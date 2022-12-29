# Exercise 5: Bash script
- Create uno script bash sotto /exam/exercise5 chiamato exercise5.sh con le seguenti caratteristiche:
  - accetti in ingresso un lista di argomenti a piacere
  - lo script dovrà stampare in output:
    - la lista dei parametri passati in ingresso
    - il numero di parametri passati in ingresso
    - per ogni entry passata contare il numero di caratteri per ogni parametro e riportarlo in output
    - Se non viene passato nessun argomento in ingresso riporti un errore generico a piacere
```bash
[root@class exercise5]# Ex5BashScript.sh
[root@class exercise5]# touch Ex5BashScript.sh
[root@class exercise5]# chmod +x Ex5BashScript.sh
[root@class exercise5]# vim Ex5BashScript.sh

# Creo script
#!/bin/bash

echo "Parametri passati ${@}";
echo "Numero parametri passati ${#}";
for name in ${@}
do
        echo "Il parametro $name contiene ${#name} caratteri";
done

# Eseguo script
[root@class exercise5]# ./Ex5BashScript.sh minnie goofy mickey donald
Parametri passati minnie goofy mickey donald
Numero parametri passati 4
Il parametro minnie contiene 6 caratteri
Il parametro goofy contiene 5 caratteri
Il parametro mickey contiene 6 caratteri
Il parametro donald contiene 6 caratteri
```
