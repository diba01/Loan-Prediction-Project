% programma per apprendere inducendo Regole e testandone l'efficacia

:- ensure_loaded(prestito_attributi3).
:- ensure_loaded(prestito_training_set3).
:- ensure_loaded(prestito_test_set3).

:- op(300,xfx,<==).

% ================================================================================
% apprendi(Classe)
% raccoglie il training set in una lista, costruisce e stampa a schermo
% una descrizione per la Classe e asserisce la corrispondente Regola

apprendi(Classe) :-
	findall( e(C,O), e(C,O), Esempi),      % raccoglie  gli Esempi
	apprendi(Esempi, Classe, Descrizione), % induce la Descrizione della Classe
	nl,write(Classe),write('<=='),nl,      % la stampa
	writelist(Descrizione),
	assert( Classe <== Descrizione ).      % e la asserisce, ovvero APPRENDE

% apprendi(Esempi,Classe,Descrizione)
% Descrizione copre esattamente gli esempi di Classe nella lista Esempi

apprendi( Esempi, Classe, []) :-                % Descrizione vuota perché non ci sono
	\+ member( e(Classe,_), Esempi ).       % esempi da coprire di quella Classe
apprendi( Esempi, Classe, [Cong|Congi] ) :-
	apprendi_cong( Esempi, Classe, Cong),   % induce una Cong di coppie Attr=Val che copre
						% almeno un esempio di Classe e nessun esempio
						% di una qualunque altra classe
	rimuovi( Esempi, Cong, RestoEsempi ),   % rimuove gli esempi coperti da Cong
	apprendi( RestoEsempi, Classe, Congi ). % copre gli esempi rimasti

% apprendi_cong(Esempi,Classe,Cong)
% Cong è una lista di coppie Attr=Val soddisfatti da alcuni esempi
% di Classe e da nessun esempio di un'altra classe

apprendi_cong( Esempi, Classe, []) :-
	\+ (member( e(Cl,_), Esempi), Cl \== Classe),
	!.	                               % non ci sono esempi di altre classi
apprendi_cong( Esempi, Cl, [Cond|Conds] ) :-
	scegli_cond( Esempi, Cl, Cond ),       % sceglie una coppia Attr=Val
	filtra( Esempi, [Cond], Esempi1 ),     % seleziona in Esempi1 quelli che hanno Attr=Val
	apprendi_cong( Esempi1, Cl, Conds ).

scegli_cond( Esempi, Classe, AttVal) :-
	findall( AV/Punti, punteggioAV(Esempi,Classe,AV,Punti), AVs),
	best( AVs, AttVal).

best([AttVal/_],AttVal).
best([AV0/S0,AV1/S1|AVSlist],AttVal) :-
	S1 > S0, !,    % AV1 è meglio di AV0
	best([AV1/S1|AVSlist],AttVal)
	;
	best([AV0/S0|AVSlist],AttVal).

% filtra(Esempi,Condizione,Esempi1)
% Esempi1 contiene elementi di Esempi che soddisfano Condizione

filtra(Esempi,Cond,Esempi1) :-
	findall(e(Classe,Ogg), (member(e(Classe,Ogg),Esempi),soddisfa(Ogg,Cond)), Esempi1).

% rimuovi(Esempi,Cong,RestoEsempi)
% rimuove da Esempi quelli coperti da Cong e restituisce Esempi1

rimuovi([],_,[]).
rimuovi([e(_,Ogg)|Es],Conge,Es1) :-
	soddisfa(Ogg,Conge), !, % il primo esempio matcha Conge
	rimuovi(Es,Conge,Es1).  % lo rimuove

rimuovi([E|Es],Conge,[E|Es1]) :- % mantiene il primo esempio
	rimuovi(Es,Conge,Es1).

% soddisfa(+Oggetto,+Congiunzione)
% se, atteso che Oggetto e Congiunzione abbiano almeno un attributo
% descrittivo in comune, non succeda che compaia lo stesso attributo Att
% in Oggetto ed in Congiunzione con valori diversi

soddisfa( Oggetto, Congiunzione) :-
	hanno_attributo_in_comune(Oggetto,Congiunzione),
	\+ (member(Att=Valx,Congiunzione), member(Att=Valy,Oggetto), Valx \== Valy).

hanno_attributo_in_comune(Oggetto,Congiunzione) :-
	member(Att=_,Congiunzione),
	member(Att=_,Oggetto),
	!.

punteggioAV( Esempi, Classe, AttVal, Punti ) :-
	candidato( Esempi, Classe, AttVal),  % un attributo/valore adatto
	filtra(Esempi,[AttVal],Esempi1),  % gli Esempi1 soddisfano la condizione Att=Val
	length(Esempi1,N1),
	conta_pos(Esempi1,Classe,Npos1),  % numero di esempi positivi
	Npos1 > 0,                        % almeno un esempio positivo
	Punti is (Npos1 + 1) / (N1 + 2).

candidato(Esempi,Classe,Att=Val) :-
	a(Att, Valori),                  % un attributo
	member(Val,Valori),              % un valore
	adatto(Att=Val,Esempi,Classe).

% almeno un esempio negativo deve non matchare con AttVal
adatto(AttVal,Esempi,Classe) :-
	member(e(ClasseX,OggX),Esempi),	% esempio
	ClasseX \== Classe,		% negativo
	\+ soddisfa(OggX,[AttVal]), !.	% non soddisfatto dalla coppia Att=Val

% conta_pos(Esempi,Classe,N)
% N è il numero degli esempi positivi di Classe

conta_pos([],_,0).
conta_pos([e(ClasseX,_)|Esempi],Classe,N) :-
	conta_pos(Esempi,Classe,N1),
	(ClasseX=Classe,!,N is N1+1 ; N=N1).

writelist([]).
writelist([X|L]) :-
	tab(2), writeq(X), nl,
	writelist(L).

% ==================================================================================
% classifica( +Oggetto, -Classe)
%  Oggetto: [Attributo1=Valore1, .. , AttributoN=ValoreN]
%  Classe: classe a cui potrebbe appartenere un oggetto caratterizzato da quelle coppie
%  Attributo=Valore
% presuppone che sia stata effettuata la classificazione

classifica(Oggetto,Classe) :- % Oggetto descritto da una lista Att=Val appartiene a Classe
	Classe <== Descrizione, % se Classe è una lista di liste Attx=Valx, di cui una è
	member(CongiunzioneAttributi,Descrizione), % la lista CongiunzioneAttributi e
	soddisfa(Oggetto,CongiunzioneAttributi). % questa soddisfa la lista Att=Val

stampa_matrice_di_confusione :- % per fare dei test
	findall(Classe/Oggetto,s(Classe,Oggetto),TestSet),
	length(TestSet,N),
	valuta(TestSet,VN,0,VP,0,FN,0,FP,0,NC,0),
	A is (VP + VN) / (N - NC), % Accuratezza
	E is 1 - A,		   % Errore
	write('Test effettuati :'),  writeln(N),
	write('Test non classificati :'),  writeln(NC),
	write('Veri Negativi  '), write(VN), write('   Falsi Positivi '), writeln(FP),
	write('Falsi Negativi '), write(FN), write('   Veri Positivi  '), writeln(VP),
	write('Accuratezza: '), writeln(A),
	write('Errore: '), writeln(E).

valuta([],VN,VN,VP,VP,FN,FN,FP,FP,NC,NC).
valuta([n/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica(Oggetto,n), !,      % prevede correttamente la non sopravvivenza
	VNA1 is VNA + 1,
	valuta(Coda,VN,VNA1,VP,VPA,FN,FNA,FP,FPA,NC,NCA).
valuta([y/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica(Oggetto,y), !, % prevede correttamente la sopravvivenza
	VPA1 is VPA + 1,
	valuta(Coda,VN,VNA,VP,VPA1,FN,FNA,FP,FPA,NC,NCA).
valuta([y/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica(Oggetto,n), !,      % prevede erroneamente la non sopravvivenza
	FNA1 is FNA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA1,FP,FPA,NC,NCA).
valuta([n/Oggetto|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :-
	classifica(Oggetto,y), !, % prevede erroneamente la sopravvivenza
	FPA1 is FPA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA,FP,FPA1,NC,NCA).
valuta([_/_|Coda],VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA) :- % non classifica
	NCA1 is NCA + 1,
	valuta(Coda,VN,VNA,VP,VPA,FN,FNA,FP,FPA,NC,NCA1).


/*

n <==
  [[boat=nullo,sex=male,embarked='S'],
  [boat=nullo,sex=male,embarked='C'],
  [home='Ireland',boat=nullo],
  [ticket='347082'],
  [ticket='CA 2144'],
  [ticket='W./C. 6608'],
  [ticket='2678'],
  [ticket='2691'],
  [ticket='F.C.C. 13534'],
  [boat=nullo,sex=male,age=seconda],
  [boat=nullo,age=terza],
  [ticket='11668'],
  [ticket='13050'],
  [ticket='237249'],
  [ticket='237671'],
  [ticket='240261'],
  [ticket='24065'],
  [ticket='244252'],
  [ticket='248747'],
  [ticket='250650'],
  [ticket='250651'],
  [ticket='2627'],
  [ticket='2689'],
  [ticket='315084'],
  [ticket='315087'],
  [ticket='329944'],
  [ticket='330844'],
  [ticket='330963'],
  [ticket='347080'],
  [ticket='347086'],
  [ticket='347091'],
  [ticket='347471'],
  [ticket='349236'],
  [ticket='349237'],
  [ticket='364846'],
  [ticket='364851'],
  [ticket='364859'],
  [ticket='365226'],
  [ticket='368323'],
  [ticket='368364'],
  [ticket='370377'],
  [ticket='374887'],
  [ticket='382649'],
  [ticket='394140'],
  [ticket='7546'],
  [ticket='7552'],
  [ticket='AQ/3. 30631'],
  [ticket='PC 17531'],
  [ticket='PC 17595'],
  [ticket='PC 17600'],
  [ticket='S.O./P.P. 3'],
  [ticket='SC/AH 29037'],
  [ticket='STON/O2. 3101270'],
  [ticket='STON/O2. 3101271'],
  [ticket='STON/O2. 3101290'],
  [ticket='W./C. 6609'],
  [cabin='C22 C26',sex=female],
  [ticket='3101278',sex=male],
  [ticket='31027',sex=male]].

y <==
  [[boat='13'],
  [boat='15'],
  [boat='C'],
  [boat='4'],
  [boat='10'],
  [boat='5'],
  [boat='3'],
  [boat='11'],
  [boat='9'],
  [boat='16'],
  [boat='7'],
  [boat='8'],
  [boat='6'],
  [boat='14',sex=female],
  [boat='2'],
  [boat='D',sex=female],
  [boat='12',sex=female],
  [boat='1'],
  [boat='B',pclass=1],
  [boat='14',embarked='S'],
  [boat='A',fare=(*)],
  [boat='D',pclass=1],
  [ticket='19996'],
  [ticket='231919'],
  [boat='13 15'],
  [boat='B',age=sconosciuta],
  [boat='C D'],
  [ticket='113055'],
  [ticket='113795'],
  [ticket='236852'],
  [ticket='240929'],
  [ticket='2626'],
  [ticket='2659'],
  [ticket='330923'],
  [ticket='330959'],
  [ticket='330968'],
  [ticket='349244'],
  [ticket='363272'],
  [ticket='367228'],
  [ticket='368783'],
  [ticket='370365'],
  [ticket='382651'],
  [ticket='383123'],
  [ticket='383162'],
  [ticket='A/5 3540'],
  [ticket='A/5. 10482'],
  [ticket='C.A. 34644'],
  [ticket='S.O./P.P. 752'],
  [ticket='SO/C 14885'],
  [ticket='SOTON/OQ 392083'],
  [ticket='SOTON/OQ 392089'],
  [ticket='STON/O2. 3101282'],
  [ticket='STON/O2. 3101283'],
  [ticket='SW/PP 751'],
  [cabin='B80'],
  [sibsp=3,sex=female],
  [ticket='230080',age=prima],
  [ticket='237736',sex=female],
  [ticket='PC 17597',boat='A'],
  [ticket='SC/AH 3085',sex=female]].

*/
