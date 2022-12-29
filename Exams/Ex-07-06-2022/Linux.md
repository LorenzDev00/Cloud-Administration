# Exercise 1: Regular Expressions
- Usare l’utente student per creare il file /exam/exercise1/text contenente l’elenco di tutti i file e directory presenti sotto /usr utilizzando il comando “ls -r1”
- riportare in /exam/exercise1/regex la regular expression necessaria per ottenere a partire dal file /exam/exercise1/text tutte le occorrenze che facciano match con:
  - inizi con un carattere compreso tra il carattere minuscolo a, e il carattere minuscolo m (a b c d e … m)
  - finisca con il carattere a oppure b oppure t oppure n
- Potete testare la vostra regular expression con il comando grep (grep regex /exam/exercise1/text)
```bash
# Scrivo contenuto /usr/ in /exam/exercise1/text
[student@class /]$ cd /usr/
[student@class usr]$ ls -r1 > /exam/exercise1/text
[student@class usr]$ cat /exam/exercise1/text
tmp
src
share
sbin
local
libexec
lib64
lib
include
games
bin

# Eseguo stampa con regular exprssion
[student@class exercise1]$ grep ^[abcdefghijklm] /exam/exercise1/text | grep [abtn]$
lib
bin
```
