:- ensure_loaded(prestito_database).

probabilita_prestito(Probabilita) :-
    findall(Prestito, e(Prestito, _, _, _, _, _, _, _, _, _, _), Prestiti), % Trova tutti i fatti
    length(Prestiti, Totale),                      % Conta il numero totale di prestiti
    findall(Prestito, e(y, _, _, _, _, _, _, _, _, _, _), PrestitiApprovati), % Trova prestiti approvati
    length(PrestitiApprovati, Approvati),         % Conta il numero di prestiti approvati
    Probabilita is Approvati / Totale.             % Calcola la probabilità

% Calcola la probabilità di approvazione del prestito dato un certo genere
probabilita_prestito_genere(Genere, Probabilita) :-
    findall(Prestito, e(Prestito, Genere, _, _, _, _, _, _, _, _, _), PrestitiGenere), % Trova i prestiti per un certo genere
    length(PrestitiGenere, Totale),                      % Conta il numero totale di prestiti per quel genere
    findall(Prestito, e(y, Genere, _, _, _, _, _, _, _, _, _), PrestitiApprovatiGenere), % Trova i prestiti approvati per quel genere
    length(PrestitiApprovatiGenere, ApprovatiGenere),         % Conta il numero di prestiti approvati per quel genere
    Probabilita is ApprovatiGenere / Totale.             % Calcola la probabilità

% Calcola la probabilità di approvazione del prestito dato un certo stato civile
probabilita_prestito_stato_civile(StatoCivile, Probabilita) :-
    findall(Prestito, e(Prestito, _, StatoCivile, _, _, _, _, _, _, _, _), PrestitiStatoCivile), % Trova i prestiti per un certo stato civile
    length(PrestitiStatoCivile, Totale),                      % Conta il numero totale di prestiti per quello stato civile
    findall(Prestito, e(y, _, StatoCivile, _, _, _, _, _, _, _, _), PrestitiApprovatiStatoCivile), % Trova i prestiti approvati per quello stato civile
    length(PrestitiApprovatiStatoCivile, ApprovatiStatoCivile),         % Conta il numero di prestiti approvati per quello stato civile
    Probabilita is ApprovatiStatoCivile / Totale.             % Calcola la probabilità

% Calcola la probabilità di approvazione del prestito dato il numero di dipendenti
probabilita_prestito_dipendenti(NumeroDipendenti, Probabilita) :-
    findall(Prestito, e(Prestito, _, _, NumeroDipendenti, _, _, _, _, _, _, _), PrestitiDipendenti), % Trova i prestiti per un certo numero di dipendenti
    length(PrestitiDipendenti, Totale),                      % Conta il numero totale di prestiti per quel numero di dipendenti
    findall(Prestito, e(y, _, _, NumeroDipendenti, _, _, _, _, _, _, _), PrestitiApprovatiDipendenti), % Trova i prestiti approvati per quel numero di dipendenti
    length(PrestitiApprovatiDipendenti, ApprovatiDipendenti),         % Conta il numero di prestiti approvati per quel numero di dipendenti
    Probabilita is ApprovatiDipendenti / Totale.             % Calcola la probabilità

% Calcola la probabilità di approvazione del prestito dato lo stato dell'occupazione
probabilita_prestito_occupazione(Occupazione, Probabilita) :-
    findall(Prestito, e(Prestito, _, _, _, Occupazione, _, _, _, _, _, _), PrestitiOccupazione), % Trova i prestiti per un certo stato dell'occupazione
    length(PrestitiOccupazione, Totale),                      % Conta il numero totale di prestiti per quel stato dell'occupazione
    findall(Prestito, e(y, _, _, _, Occupazione, _, _, _, _, _, _), PrestitiApprovatiOccupazione), % Trova i prestiti approvati per quello stato dell'occupazione
    length(PrestitiApprovatiOccupazione, ApprovatiOccupazione),         % Conta il numero di prestiti approvati per quello stato dell'occupazione
    Probabilita is ApprovatiOccupazione / Totale.
    % Calcola la probabilità

% Calcola la probabilità di approvazione del prestito dato un certo reddito del richiedente
probabilita_prestito_applicantincome(ApplicantIncome, Probabilita) :-
    findall(Prestito, e(Prestito, _, _, _, _, ApplicantIncome, _, _, _, _, _), PrestitiIncome), % Trova i prestiti per un certo reddito
    length(PrestitiIncome, Totale),                      % Conta il numero totale di prestiti per quel reddito
    findall(Prestito, e(y, _, _, _, _, ApplicantIncome, _, _, _, _, _), PrestitiApprovatiIncome), % Trova i prestiti approvati per quel reddito
    length(PrestitiApprovatiIncome, ApprovatiIncome),         % Conta il numero di prestiti approvati per quel reddito
    Probabilita is ApprovatiIncome / Totale.             % Calcola la probabilità

% Calcola la probabilità di approvazione del prestito dato un certo reddito del co-richiedente
probabilita_prestito_coapplicantincome(CoApplicantIncome, Probabilita) :-
    findall(Prestito, e(Prestito, _, _, _, _, _, CoApplicantIncome, _, _, _, _), PrestitiCoIncome), % Trova i prestiti per un certo reddito del co-richiedente
    length(PrestitiCoIncome, Totale),                      % Conta il numero totale di prestiti per quel reddito del co-richiedente
    findall(Prestito, e(y, _, _, _, _, _, CoApplicantIncome, _, _, _, _), PrestitiApprovatiCoIncome), % Trova i prestiti approvati per quel reddito
    length(PrestitiApprovatiCoIncome, ApprovatiCoIncome),         % Conta il numero di prestiti approvati per quel reddito del co-richiedente
    Probabilita is ApprovatiCoIncome / Totale.             % Calcola la probabilità

% Calcola la probabilità di approvazione del prestito dato un certo importo del prestito
probabilita_prestito_loanamount(LoanAmount, Probabilita) :-
    findall(Prestito, e(Prestito, _, _, _, _, _, _, LoanAmount, _, _, _), PrestitiLoanAmount), % Trova i prestiti per un certo importo
    length(PrestitiLoanAmount, Totale),                      % Conta il numero totale di prestiti per quel importo
    findall(Prestito, e(y, _, _, _, _, _, _, LoanAmount, _, _, _), PrestitiApprovatiLoanAmount), % Trova i prestiti approvati per quell'importo
    length(PrestitiApprovatiLoanAmount, ApprovatiLoanAmount),         % Conta il numero di prestiti approvati per quell'importo
    Probabilita is ApprovatiLoanAmount / Totale.             % Calcola la probabilità

% Calcola la probabilità di approvazione del prestito dato un certo termine del prestito (loan_amount_term)
probabilita_prestito_loanamount_term(LoanAmountTerm, Probabilita) :-
    findall(Prestito, e(Prestito, _, _, _, _, _, _, _, LoanAmountTerm, _, _), PrestitiLoanAmountTerm), % Trova i prestiti per un certo termine del prestito
    length(PrestitiLoanAmountTerm, Totale),                      % Conta il numero totale di prestiti per quel termine
    findall(Prestito, e(y, _, _, _, _, _, _, _, LoanAmountTerm, _, _), PrestitiApprovatiLoanAmountTerm), % Trova i prestiti approvati per quel termine
    length(PrestitiApprovatiLoanAmountTerm, ApprovatiLoanAmountTerm),         % Conta il numero di prestiti approvati per quel termine
    Probabilita is ApprovatiLoanAmountTerm / Totale.             % Calcola la probabilità








