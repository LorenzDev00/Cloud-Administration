# Exercise 1: Regular expression
- Dato un file con il seguente contenuto:
  _can
  man
  fan
  dan
  ran
  pan_
- Riportare una regular expression che rispetti il seguente schema
  _Match can
  Match man
  Match fan
  Skip dan
  Skip ran
  Skip pan_
- potete testare il tutto creando il file regexpr.txt sotto /exam/exercise1/regexpr.txt e il comando grep
- riportare la soluzione sotto /exam/exercise1/solution
```bash
[root@class exercise1]# grep '^[cmf]' /exam/exercise1/regexpr.txt
can
man
fan

[root@class exercise1]# echo "^[cmf]" > /exam/exercise1/solution
[root@class exercise1]# cat /exam/exercise1/solution
^[cmf]
[root@class exercise1]#
```
# Exercise 2: Special file permission
- Creare una directory sotto /exam/exercise2 dove gli utenti che possono accedere al gruppo collaboration potranno condividere files
- Tutti i file creati sotto la directory /exam/exercise2 dovranno essere assegnati automaticamente al gruppo collaboration
```bash
# Definisco in mdoo ricroisivo il gruppo collaboration da sharedir in giù
[root@class exercise2]# mkdir sharedir
[root@class exercise2]#  chown -R  :collaboration /exam/exercise2/sharedir/
[root@class exercise2]# ls -la
total 4
drwxr-sr-x.  4 root students       103 Jan  1 17:26 .
drwxrwxrwx. 13 root students      4096 Dec 30 17:15 ..
drwxr-sr-x.  2 root students         6 Dec 27 22:46 boom
-rw-r--r--.  1 root students         0 Dec 27 22:35 filetest1
-rw-r--r--.  1 root students         0 Dec 27 22:35 filetest2
-rw-r--r--.  1 root students         0 Dec 27 22:35 filetest3
drwxr-sr-x.  2 root collaboration    6 Jan  1 17:26 sharedir
-rw-r--r--.  1 root students         0 Dec 27 22:45 testfile10

# Imposto collaboration come gruppo permanente della dir shardir
[root@class exercise2]# chmod g+s sharedir/
[root@class exercise2]# cd sharedir/
[root@class sharedir]# touch file1,file2,file3
[root@class sharedir]# ls -la
total 0
drwxr-sr-x. 2 root collaboration  31 Jan  1 17:31 .
drwxr-sr-x. 4 root students      103 Jan  1 17:26 ..
-rw-r--r--. 1 root collaboration   0 Jan  1 17:31 file1,file2,file3

[root@class sharedir]# usermod -a -G collaboration alice
[root@class sharedir]# usermod -a -G collaboration bill

# Imposto ai soli embri di collaboration di poter condividere file 
[root@class exercise2]# chmod 770 sharedir/

[root@class sharedir]# su bill
[bill@class sharedir]$ touch textfile.txt
[bill@class sharedir]$ ls -la
total 0
drwxrws---. 2 root  collaboration  68 Jan  1 17:37 .
drwxr-sr-x. 4 root  students      103 Jan  1 17:26 ..
-rw-rw-r--. 1 alice collaboration   0 Jan  1 17:36 alicefile
-rw-r--r--. 1 root  collaboration   0 Jan  1 17:31 file1,file2,file3
-rw-------. 1 bill  collaboration   0 Jan  1 17:37 textfile.txt
```
# Exercise 3: User and Group
- Create un nuovo gruppo exams con GID 4000
- Creare lo studente exercise3 appartenente al gruppo exams con le seguenti caratteristiche:
  - UID 4100
  - home directory /home/exams/exercise3
  - dovrà cambiare password al primo accesso
  - l’account scadrà ad un anno dalla sua creazione
  - dovrà poter accedere a file e directory appartenenti al gruppo users
- Fare in modo che nuovi file e directory creati dall’utente exercise3, di default (al login quindi), possano essere letti scritti o visti, da tutti gli utenti del sistema (presenti e futuri)
```bash

```
# Esercizio 4: Shell environment and alias command
```bash
[root@class /]# mkdir exam/exercise4
[root@class /]# cd exam/exercise4
[root@class exercise4]# alias userinfo="echo user: $USER - working directory: $HOME"

# Rendo comando alias permanente inserendolo in /etc/bashrc
[root@class exercise4]# vim /etc/bashrc

[root@class ~]# su student
[student@class root]$ userinfo
user: student - working directory: /root - home_directory: /home/student

[root@class ~]# su alice
[alice@class root]$ userinfo
user: alice - working directory: /root - home_directory: /home/alice
