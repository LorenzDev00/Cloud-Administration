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
