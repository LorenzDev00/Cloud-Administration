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
# Exercise 3: Default file permission
- Creare l’utente bill appartenente al gruppo microsoft.
- Fare in modo che nuovi file e directory creati dall’utente bill, di default (al login quindi), non possano essere letti scritti o visti, da nessuno al di fuori dell’utente bill.
```bash
# Creazione utente bill e gruppo microsoft
[root@class exercise5]# useradd bill
[root@class exercise5]# groupadd microsoft

# Aggiungo bill a gruppo microsoft
[root@class exercise5]# usermod -a -G microsoft bill
[root@class exercise5]# id bill
uid=3104(bill) gid=3105(bill) groups=3105(bill),3106(microsoft)

# Aggiungo umask 177 in .bashrc

# Rieffettuo il login
Last login: Thu Dec 29 14:47:28 2022
[root@class ~]# su bill
[bill@class root]$ cd ..
[bill@class /]$ cd exam/
[bill@class exam]$ ls -la
total 8
drwxrwxrwx.  9 root    student        150 Dec 28 17:54 .
dr-xr-xr-x. 19 root    root           247 Dec 23 20:52 ..
drwxr-xr-x.  2 root    student         64 Dec 26 14:31 BashExercise
-rwxr-xr-x.  1 root    root            79 Dec 28 18:37 BashService.sh
drwxrwsr-x.  8 student cooperation   4096 Dec 29 14:34 exercise1
drwxr-sr-x.  3 root    collaboration   87 Dec 27 22:46 exercise2
drwxrwxr-x.  2 exam2   exam2           23 Dec 27 15:13 exercise3
drwxr-xr-x.  2 root    student          6 Dec 26 15:29 exercise4
drwxrwxrwx.  3 root    student         84 Dec 29 15:04 exercise5
drwxr-xr-x.  2 root    student        125 Dec 28 12:19 exercise6
[bill@class exam]$ exit
exit

# Aggiungo bill a gruppo exam2 per consentire modifiche
[root@class ~]# usermod -a -G exam2 bill
[root@class ~]# id bill
uid=3104(bill) gid=3105(bill) groups=3105(bill),1011(exam2),3106(microsoft)

[root@class ~]# su bill
[bill@class root]$ cd ..
[bill@class /]$ cd exam/exercise3
[bill@class exercise3]$ touch billfile
[bill@class exercise3]$ ls -la
total 0
drwxrwxr-x. 2 exam2 exam2    39 Dec 29 15:12 .
drwxrwxrwx. 9 root  student 150 Dec 28 17:54 ..
-rw-------. 1 bill  bill      0 Dec 29 15:12 billfile
```
