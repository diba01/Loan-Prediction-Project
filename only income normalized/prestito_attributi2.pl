% Definizione degli attributi e dei valori possibili
a(gender, [male, female, nil]). % Genere del richiedente (Male, Female, NIL)
a(married, [yes, no, nil]).     % Stato civile (Yes, No, NIL)
a(dependents, [0, 1, 2, 3, nil]). % Numero di dipendenti a carico (0, 1, 2, 3, NIL)
a(self_employed, [yes, no, nil]). % Lavoratore autonomo (Yes, No, NIL)
a(applicantincome, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30, 32, 33, 34, 35, 37, 40, 41, 42, 48, 68, 76, 79, 80, 104, 127, 162]). % Reddito richiedente
a(coapplicantincome, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 22, 23, 40, 68, 84]). % Reddito co-richiedente
a(loanamount, [low, medium_low, medium_high, high, very_high, nil]). % Importo del prestito
a(loan_amount_term, [short_term, medium_short_term, medium_long_term, long_term, nil]). % Durata prestito
a(credit_history, [0, 1, nil]). % Storico creditizio (0 = Negativo, 1 = Positivo, NIL)
a(property_area, [urban, semiurban, rural]). % Area della proprietà
% a(loanstatus, [y, n]). Stato del prestito (Y = Approvato, N =
% Rifiutato)




