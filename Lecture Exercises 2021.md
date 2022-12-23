## Type 5 : File permission 07/04/2021

Creare **utente linux** appartenente al gruppo opensource.
Fare in modo che nuovi files e direcotry creati dall'utente linux alla creazione, di default non possano **essere letti, scritti o visti**, da nessun'altro al di fuori dell'utente linux.
```bash
[root@class ~]# groupadd opensource
[root@class ~]# useradd -g openource linux
useradd: group 'openource' does not exist
[root@class ~]# useradd -g opensource linux
[root@class ~]# id linux
uid=1017(linux) gid=3004(opensource) groups=3004(opensource)
[root@class ~]# su - linux

# Creao file e directory di test 
[linux@class ~]$ touch testFile
[linux@class ~]$ mkdir testDir
[linux@class ~]$ ls -la
total 16
drwx------.  3 linux opensource   93 Dec 23 13:25 .
drwxr-xr-x. 21 root  root       4096 Dec 23 13:22 ..
-rw-r--r--.  1 linux opensource   18 Nov 18 15:29 .bash_logout
-rw-r--r--.  1 linux opensource  141 Nov 18 15:29 .bash_profile
-rw-r--r--.  1 linux opensource  492 Nov 18 15:29 .bashrc
drwxr-xr-x.  2 linux opensource    6 Dec 23 13:25 testDir
-rw-r--r--.  1 linux opensource    0 Dec 23 13:25 testFile

# Utilizzo umask per modificare permessi di default di nuovi file creati
[linux@class ~]$ umask
0022

# In questo caso applico 077 in modo che solo l'utente owner possa effettuare r w 
[linux@class ~]$ umask 077
[linux@class ~]$ touch testFile2
[linux@class ~]$ ls -la
total 16
drwx------.  3 linux opensource  110 Dec 23 13:29 .
drwxr-xr-x. 21 root  root       4096 Dec 23 13:22 ..
-rw-r--r--.  1 linux opensource   18 Nov 18 15:29 .bash_logout
-rw-r--r--.  1 linux opensource  141 Nov 18 15:29 .bash_profile
-rw-r--r--.  1 linux opensource  492 Nov 18 15:29 .bashrc
drwxr-xr-x.  2 linux opensource    6 Dec 23 13:25 testDir
-rw-r--r--.  1 linux opensource    0 Dec 23 13:25 testFile
-rw-------.  1 linux opensource    0 Dec 23 13:29 testFile2

# Necssario applicare umask come permanente --> inserire permesso in .bashrc (umask 700)
# NB : umask è funzione sottrattiva : parti da 777, togli 077, ottieni 700
[linux@class ~]$ logout
[root@class ~]# su - linux
[linux@class ~]$ umask
0022
[linux@class ~]$ ls -la
total 20
drwx------.  3 linux opensource  131 Dec 23 13:34 .
drwxr-xr-x. 21 root  root       4096 Dec 23 13:22 ..
-rw-------.  1 linux opensource   96 Dec 23 13:34 .bash_history
-rw-r--r--.  1 linux opensource   18 Nov 18 15:29 .bash_logout
-rw-r--r--.  1 linux opensource  141 Nov 18 15:29 .bash_profile
-rw-r--r--.  1 linux opensource  492 Nov 18 15:29 .bashrc
drwxr-xr-x.  2 linux opensource    6 Dec 23 13:25 testDir
-rw-r--r--.  1 linux opensource    0 Dec 23 13:25 testFile
-rw-------.  1 linux opensource    0 Dec 23 13:29 testFile2
[linux@class ~]$ vim .bashrc
[linux@class ~]$ logout
[root@class ~]# su - linux
[linux@class ~]$ umask
0700
[linux@class ~]$

```
## Type 4 : File permission 27/08/2021

Creare la directory **/exam/exercise4/collaboration/students** dove gli utenti facenti parte del **gruppo students** potranno condividere file e directory.
Fare in modo che tutti i file e directory create sotto /exam/exercise4/collaboration/students vengano assegnati automaticamente al gruppo **students**.
```bash
# Creo la directory
[root@class ~]# mkdir -p /exam/exercise4/collaboration/students~
[root@class ~]# cd /exam/exercise4/collaboration/
[root@class collaboration]# ls -la
total 0
drwxr-xr-x. 3 root root 22 Dec 23 14:00 .
drwxr-xr-x. 3 root root 27 Dec 23 13:59 ..
drwxr-xr-x. 2 root root  6 Dec 23 13:59 students

# Cambio proprietà di apartenenza dei file da root a student in modo ricorsivo partendo dall dir exam/
[root@class collaboration]# chown -R  :student /exam
[root@class collaboration]# ls -la
total 0
drwxr-xr-x. 3 root student 22 Dec 23 14:00 .
drwxr-xr-x. 3 root student 27 Dec 23 13:59 ..
drwxr-xr-x. 2 root student  6 Dec 23 13:59 students

[root@class collaboration]# touch testFile
[root@class collaboration]# ls -la
total 0
drwxr-xr-x. 3 root student 38 Dec 23 14:07 .
drwxr-xr-x. 3 root student 27 Dec 23 13:59 ..
drwxr-xr-x. 2 root student  6 Dec 23 13:59 students
-rw-r--r--. 1 root root     0 Dec 23 14:07 testFile

[root@class collaboration]# ll
total 0
drwxr-xr-x. 2 root student 6 Dec 23 13:59 students
-rw-r--r--. 1 root root    0 Dec 23 14:07 testFile

# Setto gruppo students in esecuzione 
[root@class collaboration]# chmod g+s students/
[root@class collaboration]# ls -la
total 0
drwxr-xr-x. 3 root student 38 Dec 23 14:07 .
drwxr-xr-x. 3 root student 27 Dec 23 13:59 ..
drwxr-sr-x. 2 root student  6 Dec 23 13:59 students
-rw-r--r--. 1 root root     0 Dec 23 14:07 testFile

[root@class collaboration]# cd students/
[root@class students]# touch testfile1
[root@class students]# ls -la
total 0
drwxr-sr-x. 2 root student 23 Dec 23 14:16 .
drwxr-xr-x. 3 root student 38 Dec 23 14:07 ..
-rw-r--r--. 1 root student  0 Dec 23 14:16 testfile1

[root@class students]# touch testFile1
[root@class students]# ls -ls
total 0
0 -rw-r--r--. 1 root student 0 Dec 23 14:16 testfile1
0 -rw-r--r--. 1 root student 0 Dec 23 14:35 testFile1

[root@class students]# ls -la
total 0
drwxr-sr-x. 2 root student 40 Dec 23 14:35 .
drwxr-xr-x. 3 root student 38 Dec 23 14:07 ..
-rw-r--r--. 1 root student  0 Dec 23 14:16 testfile1
-rw-r--r--. 1 root student  0 Dec 23 14:35 testFile1
[root@class students]#

```
## Type 3 : alias command 07/04/2021
Creare i seguenti alias command disponibili a tutti gli utenti del sistema: 

 - "c" comando *clear*
 - "hwmp" comando *uname -mp*

```bash
[root@class ~]# uname -mp
x86_64 x86_64

[root@class ~]# echo 'alias hwmp="uname -mp"' >> /etc/bashrc
[root@class ~]# logout

[root@class ~]# hwmp
x86_64 x86_64


```
