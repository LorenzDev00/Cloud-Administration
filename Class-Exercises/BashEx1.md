# Esercizio 1
Create uno script bash sotto /exam/exercise6 chiamato checkusername.sh con le seguenti caratteristiche:
- accetti in ingresso una lista a piacere di username da controllare
       - minimo 1 username
       - massimo 5 username
- Stampi a video per tutti gli username passati nella lista le seguenti informazioni:
       - Se lo username non è presente un messaggio: “user <username> not found”
   - nessun messaggio di errore (STDERR) di sistema deve comparire a video.
   - Se lo username è presente il messaggio: “user <username> found:”
       - l’output del comando id <username>
       - l’output del comando chage -l <username>
       - la riga contenente le sole informazioni username presenti sotto /etc/passwd
   - Lo script dovrà prevedere una serie di controlli:
      - se non viene passato nessun parametro lo script esca con exit code 10 e riporti il messaggio di errore: 
            no parameters passed - Usage: checkusername.sh <username list>
       - Se il numero di parametri eccede il numero massimo lo script esca con exit code 20 un messaggio di errore: 
            too many parameters passed (max 5) - Usage: checkusername.sh <username list>
   - NB. Il messaggio di errore DEVE essere gestito tramite una unica funzione

```bash
#!/bin/bash

# FUNZIONE CONTROLLO UTENTE INPUT
function check_input () {
if id "$user" &>/dev/null;
then
    echo "user [$user] found";
    id $user;
    chage -l $user; 
    grep $user /etc/passwd;
    echo "- - - - - - - - - - - "; 
else
    echo "user [$user] not found";
    echo "- - - - - - - - - - - "; 
fi 
}

# FUNZIONE GESTIONE ERRORE
function error {
	local ERROR=$1
	local EXIT_CODE=$2
	echo "${ERROR} - Usage: checkusername.sh $@";
	exit ${EXIT_CODE}
}

# BLOCCO PRINCIPALE 
if [ "$#" -lt "1" ];
then
	error "no paramater passed" 10
elif [ "$#" -gt "5" ];
then
	error "#!/bin/bash

# FUNZIONE CONTROLLO UTENTE INPUT
function check_input () {
if id "$user" &>/dev/null;
then
    echo "user [$user] found";
    id $user;
    chage -l $user;
    grep $user /etc/passwd;
    echo "- - - - - - - - - - - ";
else
    echo "user [$user] not found";
    echo "- - - - - - - - - - - ";
fi
}

# FUNZIONE GESTIONE ERRORE
function error {
        local ERROR=$1
        local EXIT_CODE=$2
        echo "${ERROR} - Usage: checkusername.sh $@";
        exit ${EXIT_CODE}
}

# BLOCCO PRINCIPALE
if [ "$#" -lt "1" ];
then
        error "no paramater passed" 10
elif [ "$#" -gt "5" ];
then
        error "too many parameters passed" 20
else
        for user in "$@"
        do
                check_input $user
        done
fi
too many parameters passed" 20
	exit 20
else
	for user in "$@"
	do
		check_input $user
	done
fi 


```
