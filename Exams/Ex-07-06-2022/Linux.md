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
# Exercise 2: Special file permission and users
- Creare una directory sotto /exam/exercise3/students dove gli utenti del gruppo students, mark nadine e martin potranno condividere files
- Solamente gli utenti del gruppo students potranno creare e cancellare i file sotto /exam/exercise3/students
- Tutti i file creati sotto la directory /exam/exercise3/students dovranno essere assegnati automaticamente al gruppo students
```bash
# Creo directory
[root@class exam]# mkdir exercise3.1
[root@class exam]# cd exercise3.1
[root@class exercise3.1]# mkdir students
[root@class exercise3.1]# cd ..
[root@class exam]# cd exercise3.1
[root@class exercise3.1]# ls -la
total 0
drwxr-xr-x.  3 root root     22 Dec 29 15:23 .
drwxrwxrwx. 10 root student 169 Dec 29 15:23 ..
drwxr-xr-x.  2 root root      6 Dec 29 15:23 students

[root@class exam]# chown -R :students /exam/
[root@class exam]# ls -la
total 12
drwxrwxrwx. 11 root    students 4096 Dec 29 16:40 .
dr-xr-xr-x. 19 root    root      247 Dec 23 20:52 ..
drwxr-xr-x.  2 root    students   64 Dec 26 14:31 BashExercise
-rwxr-xr-x.  1 root    students   79 Dec 28 18:37 BashService.sh
drwxrwsr-x.  8 student students 4096 Dec 29 14:34 exercise1
drwxr-sr-x.  3 root    students   87 Dec 27 22:46 exercise2
drwxrwxr-x.  2 exam2   students   39 Dec 29 15:12 exercise3
drwxr-sr-x.  3 root    students   38 Dec 29 16:38 exercise3.1
drwxr-xr-x.  2 root    students    6 Dec 26 15:29 exercise4
drwxrwxrwx.  3 root    students   84 Dec 29 15:04 exercise5
drwxr-xr-x.  2 root    students  125 Dec 28 12:19 exercise6
drwxrwxr-x.  2 mark    students    6 Dec 29 16:04 mark

# Aggiungo utenti
[root@class exercise3.1]# useradd mark
[root@class exercise3.1]# useradd martin
[root@class exercise3.1]# useradd nadine

# Aggiungo utenti al gruppo

  578   usermod -a -G students mark
  579   usermod -a -G students martin
  580   usermod -a -G students nadine
  
[root@class exercise3.1]# for i in {mark,martin,nadine}; do id $i; done
uid=3105(mark) gid=3107(mark) groups=3107(mark),2100(students)
uid=3106(martin) gid=3108(martin) groups=3108(martin),2100(students)
uid=3107(nadine) gid=3109(nadine) groups=3109(nadine),2100(students)
[root@class exercise3.1]#

# Imposto file creati in students come appartenenti automaticamente al gruppo students
[root@class exam]# cd exercise3.1
[root@class exercise3.1]# chmod g+s students/

# Aggiungo permessi ai soli membri del gruppo students per modificare la dir students
[root@class exercise3.1]# chmod 770 students/
[root@class exercise3.1]# su mark
[mark@class exercise3.1]$ cd students/
[mark@class students]$ ls -la
total 0
drwxrws---. 2 root students 52 Dec 29 16:55 .
drwxr-sr-x. 3 root students 38 Dec 29 16:38 ..
-rw-rw-r--. 1 mark students  0 Dec 29 16:55 prova
-rw-r--r--. 1 root students  0 Dec 29 16:39 rootfile
-rw-r--r--. 1 root students  0 Dec 29 16:39 rootfile1

# L'utente alice non può accedere perchè non è parte del gruppo
[root@class exercise3.1]# su alice
[alice@class exercise3.1]$ cd students/
bash: cd: students/: Permission denied

# Gli tuenti membri di students possono aggiungere e modificare files 
[nadine@class students]$ touch nadinefile
[nadine@class students]$ ls -la
total 0
drwxrws---. 2 root   students 70 Dec 29 18:34 .
drwxr-sr-x. 3 root   students 38 Dec 29 16:38 ..
-rw-rw-r--. 1 nadine students  0 Dec 29 18:34 nadinefile
-rw-rw-r--. 1 mark   students  0 Dec 29 17:03 prova
-rw-r--r--. 1 root   students  0 Dec 29 16:39 rootfile
-rw-r--r--. 1 root   students  0 Dec 29 16:39 rootfile1
[nadine@class students]$ touch prova
[nadine@class students]$ ls -la
total 0
drwxrws---. 2 root   students 70 Dec 29 18:34 .
drwxr-sr-x. 3 root   students 38 Dec 29 16:38 ..
-rw-rw-r--. 1 nadine students  0 Dec 29 18:34 nadinefile
-rw-rw-r--. 1 mark   students  0 Dec 29 18:35 prova
-rw-r--r--. 1 root   students  0 Dec 29 16:39 rootfile
-rw-r--r--. 1 root   students  0 Dec 29 16:39 rootfile1
[nadine@class students]$ exit
exit
[root@class exercise3.1]# su martin
[martin@class exercise3.1]$ cd students/
[martin@class students]$ touch martinfile
[martin@class students]$ ls -la
total 0
drwxrws---. 2 root   students 88 Dec 29 18:35 .
drwxr-sr-x. 3 root   students 38 Dec 29 16:38 ..
-rw-rw-r--. 1 martin students  0 Dec 29 18:35 martinfile
-rw-rw-r--. 1 nadine students  0 Dec 29 18:34 nadinefile
-rw-rw-r--. 1 mark   students  0 Dec 29 18:35 prova
-rw-r--r--. 1 root   students  0 Dec 29 16:39 rootfile
-rw-r--r--. 1 root   students  0 Dec 29 16:39 rootfile1


