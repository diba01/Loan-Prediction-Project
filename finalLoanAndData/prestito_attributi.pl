% Definizione degli attributi e dei valori possibili
a(gender, [male, female, nil]). % Genere del richiedente (Male, Female, NIL)
a(married, [yes, no, nil]).     % Stato civile (Yes, No, NIL)
a(dependents, [0, 1, 2, 3, nil]). % Numero di dipendenti a carico (0, 1, 2, 3, NIL)
a(self_employed, [yes, no, nil]).
a(applicantincome, [1, 2, 3, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 83, 84, 85, 86, 87, 88, 90, 91, 92, 93, 94, 96, 97, 98, 99, 100, 101, 102, 105, 106, 108, 109, 110, 112, 113, 115, 118, 120, 122, 125, 129, 130, 131, 133, 136, 137, 146, 147, 149, 150, 154, 158, 160, 162, 163, 166, 167, 173, 175, 182, 184, 189, 195, 198, 202, 203, 207, 209, 239, 248, 292, 320, 339, 378, 392, 400, 518, 634, 726, 810]). % Reddito richiedente
a(coapplicantincome,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 57, 58, 63, 65, 67, 72, 73, 78, 79, 80, 82, 84, 90, 110, 113, 117, 140, 146, 150, 200, 240, 339, 417]
). % Reddito co-richiedente
a(loanamount, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 41, 42, 44, 46, 49, 50, 51, 55, 58, 61, 66, 71,nil]). % Importo del prestito
a(loan_amount_term, [1, 2, 4, 6, 7, 9, 12, 13, 18, 19, 24, 25, 30, 31, 35, 36, 37, 48, 49,nil]). % Durata prestito
a(credit_history, [0, 1, nil]). % Storico creditizio (0 = Negativo, 1 = Positivo, NIL)
a(property_area, [urban, semiurban, rural]). % Area della proprietà
% a(loanstatus, [y, n]). Stato del prestito (Y = Approvato, N =
% Rifiutato)


