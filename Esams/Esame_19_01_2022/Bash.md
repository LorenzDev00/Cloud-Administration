# Esercizio 3
```bush
[root@class BashExercise]# useradd exercise3
[root@class BashExercise]# id exercise3
uid=1002(exercise3) gid=1002(exercise3) groups=1002(exercise3)

[root@class BashExercise]# groupadd exams
[root@class BashExercise]# usermod -g exams exercise3
[root@class BashExercise]# id exercise3
uid=1002(exercise3) gid=1003(exams) groups=1003(exams)

[root@class BashExercise]# vim /home/exercise3/.bashrc
# umask 117

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
