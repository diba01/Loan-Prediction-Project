% Predicato principale per trasformare il dataset
trasforma :-
    open('da inserire la directory', read, StreamIn),          % Apri il file di input
    open('da inserire la directory', write, StreamOut),  % Apri il file di output
    leggi_nomi_colonne(StreamIn, NomiColonne),   % Leggi la prima riga del file per ottenere i nomi delle colonne
    processa_righe(StreamIn, StreamOut, NomiColonne), % Processa tutte le righe
    close(StreamIn),                   % Chiudi il file di input
    close(StreamOut).                  % Chiudi il file di output


% Processa ogni riga del file
processa_righe(StreamIn, StreamOut, NomiColonne) :-
    read_line_to_string(StreamIn, Line),
    ( Line \= end_of_file ->
        crea_fatto(Line, NomiColonne, Fatto),
        writeln(StreamOut, Fatto),
        processa_righe(StreamIn, StreamOut, NomiColonne)
    ; true ). % Fermati se raggiungi la fine del file

% Trasforma una riga del dataset in un fatto Prolog con chiave=valore
crea_fatto(Line, NomiColonne, Fatto) :-
    split_string(Line, ",", "", Campi),             % Dividi la riga in campi
    append(Attributi, [Target], Campi),             % Separa gli attributi dalla classe target
    crea_associazioni(NomiColonne, Attributi, Associazioni), % Crea chiave=valore
    atomic_list_concat(Associazioni, ', ', Argomenti),       % Combina chiave=valore con virgole
    atomic_list_concat(['e(', Target, ', [', Argomenti, ']).'], '', Fatto). % Crea il fatto

% Associa i nomi delle colonne ai valori corrispondenti
crea_associazioni([], [], []).
crea_associazioni([Nome|Nomi], [Valore|Valori], [Associazione|Associazioni]) :-
    atomic_list_concat([Nome, '=', Valore], '', Associazione), % Crea "nome=valore"
    crea_associazioni(Nomi, Valori, Associazioni).

% Ottieni i nomi delle colonne dalla prima riga del file
leggi_nomi_colonne(StreamIn, NomiColonne) :-
    read_line_to_string(StreamIn, HeaderLine),    % Leggi la prima riga del file
    split_string(HeaderLine, ",", "", Campi),     % Dividi la riga in campi
    append(AttribNomi, [_Target], Campi),         % Escludi l'ultimo campo (classe target)
    NomiColonne = AttribNomi.                     % Restituisci i nomi delle colonne
