## Bash Script 07/06/2022
Create uno script bash sotto **/exam/exercise5** chiamato **exercise5.sh** con le seguenti caratteristiche: 
- accetti in ingresso un lista di argomenti a piacere 
- lo script dovrà stampare in output: 
	 - la lista dei parametri passati in ingresso 
	 - il numero di parametri passati in ingresso 
	 - per ogni entry passata contare il numero di caratteri per ogni parametro e riportarlo in output 
	 - Se non viene passato nessun argomento in ingresso riporti un errore generico a piacere
```bash
#!/bin/bash

echo "Digitare numero di parametri a piacere: "
read -a array

# Conto il numero di parametri per virificare che l'array non sia vuoto
if [ "${#array[@]}" -eq "0" ]
then 
	echo "Errore: necessario iniserire argomenti ";
	echo "File: array{0}"
	exit 1;
fi

# Stampo tutti i parametri letterali
echo "Parametri passati : "${array[*]}" ";

#for arg in "${array[@]}"
#do
#echo "${arg} "
#done

# Stampo quantità parametri letterali
echo "Numero di parametri passati :${#array[@]}";

# Stampo conteggio caratteri di ogni parametro 
for arg in "${array[@]}"
do 
  echo "il parametro \"${arg}\" contiene $(echo -n ${arg} | wc -c) caratteri";
done
```
## Bash Script 20/04/2022

Create uno script bash sotto **/exam/exercise6** chiamato **check_arguments.sh** con le seguenti caratteristiche: 
- accetti in ingresso un lista di argomenti contenenti una lista di path verso file e/o directory 
- lo script dovrà analizzare la lista di **TUTTI** gli argomenti passati e se l’argomento passato è: 
	- un **file** stampi la stringa: *ArgName is a regular file*
	- una **directory** stampi la stringa: *ArgName is a directory* 
	- un **puntamento** a qualcosa di non esistente: *ArgName File or Directory not found* 
	- altrimenti dovrà stampare la stringa: *is another type of file* 
	- se non verrà passato nulla in ingresso allo script stamperà un generico **messaggio di errore**
```bash
#!/bin/bash

echo "digitare una lista di path verso file e/o directory :";
read -r -a array

# Controllo che gli argomenti passati siano >0
if [ "${#array[@]}" -eq "0" ];
then
  echo "Error : nessun argomento trovato";
  exit 1
fi

# Funzione di controllo Tipologia file
check_file() {
  if [ -f ${ARG} ];
  then
    echo "${ARG} e' un file"
    return
  elif [ -d ${ARG} ];
  then
    echo "${ARG} e' una directory"
    return
  elif [ ! -e ${ARG} ];
  then
    echo "${ARG} file non trovato"
    return
  else
    echo "${ARG} e' un altro tipo di file"
    return
fi
}

# Eseguo loop attraverso gli arg passai
for ARG in "${array[@]}"
do
  check_file ${ARG}
done

```
