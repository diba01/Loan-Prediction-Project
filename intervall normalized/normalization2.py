def mappa_intervallo(valori, intervallo_dimensione=10):
    intervalli = []
    for valore in valori:
        if valore == 'nil':
            intervalli.append('nil')  # Mantieni 'nil' nel risultato
        elif 0 <= valore <= 80000:  # Valori tra 0 e 80.000
            if valore <= 10:
                intervallo = 1  # I valori da 0 a 10 sono mappati nell'intervallo 1
            else:
                intervallo = (valore - 1) // intervallo_dimensione + 1
            intervalli.append(intervallo)
        else:
            intervalli.append('fuori intervallo')  # Valore fuori dal range
    return intervalli
valori = [] 
risultato = mappa_intervallo(valori) 
print(risultato)
