% Definizione degli attributi e dei valori possibili
a(gender, [male, female, nil]). % Genere del richiedente (Male, Female, NIL)
a(married, [yes, no, nil]).     % Stato civile (Yes, No, NIL)
a(dependents, [0, 1, 2, 3, nil]). % Numero di dipendenti a carico (0, 1, 2, 3, NIL)
a(education, [graduate, not_graduate]). % Livello di istruzione (Graduate, Not Graduate, NIL)
a(self_employed, [yes, no, nil]). % Lavoratore autonomo (Yes, No, NIL)
a(applicantincome, [low, medium_low, medium_high, high, very_high]). % Reddito richiedente
a(coapplicantincome, [null, low, medium_low, medium_high, high]). % Reddito co-richiedente
a(loanamount, [low, medium_low, medium_high, high, very_high, nil]). % Importo del prestito
a(loan_amount_term, [short_term, medium_short_term, medium_long_term, long_term, nil]). % Durata prestito
a(credit_history, [0, 1, nil]). % Storico creditizio (0 = Negativo, 1 = Positivo, NIL)
a(property_area, [urban, semiurban, rural]). % Area della proprietà
% a(loanstatus, [y, n]). Stato del prestito (Y = Approvato, N =
% Rifiutato)




