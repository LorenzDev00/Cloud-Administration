# Exercise 6: Bash script
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
