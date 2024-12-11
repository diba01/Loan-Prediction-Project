import re

# Funzione per formattare i dati
def format_data(entry):
    # Trova la classe e i valori dentro le parentesi quadre
    match = re.match(r"e\((\w), \[(.*)\]\)", entry)
    
    if match:
        # Classe fuori dalle parentesi quadre
        class_label = match.group(1)
        
        # Estrai i singoli valori e rimuovi 'classe='
        values = match.group(2).split(', ')
        formatted_values = [value.split('=')[1] for value in values]
        
        # Combina il risultato
        return f"e({class_label},{','.join(formatted_values)})"
    return entry

# Funzione per leggere da un file, processare e scrivere su un altro file
def process_file(input_file, output_file):
    with open(input_file, 'r') as infile:
        # Leggi tutte le righe dal file di input
        data = infile.readlines()
    
    # Applica la formattazione a ciascuna riga
    formatted_data = [format_data(entry.strip()) + '.' for entry in data]
    
    with open(output_file, 'w') as outfile:
        # Scrivi i risultati nel file di output
        for entry in formatted_data:
            outfile.write(entry + '\n')

# Esempio di utilizzo
input_file = '/Users/dibam17/Desktop/INTELLIGENZA ARTIFICIALE/PROGETTO/loan/prestito_database.pl'  
output_file = '/Users/dibam17/Desktop/INTELLIGENZA ARTIFICIALE/PROGETTO/loan/prestito_database2.pl'  

process_file(input_file, output_file)

print(f"Elaborazione completata. I risultati sono stati salvati in {output_file}.")

