- Create uno script bash sotto /exam/exercise5 chiamato numbers.sh con le seguenti caratteristiche:
  - Accetti in ingresso due numeri come argomenti
  - Stampi “The larger of the two numbers is: NUMBER“ NUMBER=il maggiore dei due numeri passati come argomento.
  - Se passati un numero di argomenti diversi da 2 stampi: “only two numbers please!!” ed esca.
  - Se non viene passato nessun argomenti stampi: “nothing to do” ed esca
  - Se i parametri passati sono due ma non sono numeri (uno o entrambi gli argomenti) riporti l’errore “only numbers please!!” ed esca
  - NB: la gestione degli errori venga fatta tramite l’utilizzo di una funzione
```bash
#!/bin/bash

# FUNZIONE CONFRONTO NUMERI
function number(){
if [ "$1" -gt "$2" ]
then
        echo "The larger number of the two is $1 ";
else
        echo "The larger number of the two is $2 ";
fi
}

# FUNZIONE CONTROLLO ERRORI
function check(){
if [ -z "$1" ] && [ -z "$2" ]
then
        echo "Nothing to do";
        exit 2

elif [ -z "$1" ] || [ -z "$2" ] || [ ! -z "$3" ]
then
        echo "Only two numbers please!";
        exit 3
elif ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]
then
        echo "Only numbers please!";
        exit 1
fi

number $1 $2
}

# BLOCCO PRINCIPALE
check $1 $2 $3
```
