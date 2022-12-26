# Esercizio 1: Managing pipeline and regular expression
```bash
[student@class /]$ find /usr 2> exam/exercise1/findErr.txt | grep [0-9] > exam/exercise1/find.txt
```
# Esercizio 2: Special file permission
```bash
[student@class /]$ mkdir exam/exercise2
[student@class /]$ cd exam/exercise2

[root@class exercise2]# groupadd collaboration
[root@class exercise2]# chown -R  :collaboration /exam/exercise2

# Imposto assegnazione gruppo alla creazione di un file 
[root@class exercise2]# cd ..
[root@class exam]# chmod g+s exercise2
[root@class exam]# cd exercise2
[root@class exercise2]# touch testfile1
[root@class exercise2]# ls -ls
total 0
0 -rw-r--r--. 1 root collaboration 0 Dec 26 16:38 testfile1
0 -rw-r--r--. 1 root root          0 Dec 26 16:37 textfile

# Cambio utente 
[root@class exercise2]# su student
[student@class exercise2]$ touch studentTestFile
[student@class exercise2]$ ls -la
total 0
drwxrwsr-x. 2 student collaboration  62 Dec 26 16:39 .
drwxrwxrwx. 8 root    student       111 Dec 26 16:23 ..
-rw-rw-r--. 1 student collaboration   0 Dec 26 16:39 studentTestFile
-rw-r--r--. 1 root    collaboration   0 Dec 26 16:38 testfile1
-rw-r--r--. 1 root    root            0 Dec 26 16:37 textfile

```
# Esercizio 3: Default file permission
```bush
# Aggiungo utente
[root@class BashExercise]# useradd exercise3
[root@class BashExercise]# id exercise3
uid=1002(exercise3) gid=1002(exercise3) groups=1002(exercise3)

# Aggiungo gruppo
[root@class BashExercise]# groupadd exams
[root@class BashExercise]# usermod -g exams exercise3
[root@class BashExercise]# id exercise3
uid=1002(exercise3) gid=1003(exams) groups=1003(exams)

# Modifico file .bashrc per rendere permanente la mask dei permessi
[root@class BashExercise]# vim /home/exercise3/.bashrc
# umask 117 (777 - 117 = 660)

# Creo file test 
[exercise3@class ~]$ touch testfile1
[exercise3@class ~]$ ls -la
total 12
drwx------. 2 exercise3 exams 116 Dec 26 14:58 .
drwxr-xr-x. 5 root      root   51 Dec 26 14:39 ..
----------. 1 exercise3 exams   0 Dec 26 14:57 .bash_history
-rw-r--r--. 1 exercise3 exams  18 Jan 19  2022 .bash_logout
-rw-r--r--. 1 exercise3 exams 141 Jan 19  2022 .bash_profile
-rw-r--r--. 1 exercise3 exams 502 Dec 26 14:57 .bashrc
----------. 1 exercise3 exams   0 Dec 26 14:56 testfile
-rw-rw----. 1 exercise3 exams   0 Dec 26 14:58 testfile1
```
# Esercizio 4: Shell environment and alias command
```bash
[root@class /]# mkdir exam/exercise4
[root@class /]# cd exam/exercise4
[root@class exercise4]# alias userinfo="echo user: $USER - working directory: $H

# Rendo comando alias permanente inserendolo in /etc/bashrc
[root@class exercise4]# vim /etc/bashrc

[root@class ~]# su student
[student@class root]$ userinfo
user: student - working directory: /root - home_directory: /home/student

[root@class ~]# su alice
[alice@class root]$ userinfo
user: alice - working directory: /root - home_directory: /home/alice

```
