def mappa_intervallo(valori, intervallo_dimensione=100):
    intervalli = []
    for valore in valori:
        if 0 <= valore <= 80000:  # Valori tra 0 e 80.000
            if valore <= 100:
                intervallo = 1  # I valori da 0 a 100 sono mappati nell'intervallo 1
            else:
                intervallo = (valore - 1) // intervallo_dimensione + 1
            intervalli.append(intervallo)
        else:
            intervalli.append('fuori intervallo')  # Valore fuori dal range
    return intervalli
valori = [] 
risultato = mappa_intervallo(valori) 
print(risultato)
