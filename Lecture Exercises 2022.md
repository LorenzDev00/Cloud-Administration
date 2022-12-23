## Type 1: Managing pipeline and regular expression 19/01/2022

Utilizzare il comando **find**, e l’utente **student**, per trovare tutti i files e directories sotto il path **/usr** che contengono almeno un numero nel nome. Redirigere lo standard output sul file **/exam/exercise1/find.txt**.
```bash
[root@class ~]# su - student
    
    [student@class ~]$ find /usr | grep [0-9] > find.txt
    # Questo è lo std error 
    find: ‘/usr/share/polkit-1/rules.d’: Permission denied
    find: ‘/usr/share/empty.sshd’: Permission denied
    find: ‘/usr/libexec/initscripts/legacy-actions/auditd’: Permission denied
    
    # Questo è il risultato cercato 
    [student@class ~]$ cat find.txt
    /usr/lib/debug/usr/lib64
    /usr/lib/debug/lib64
    /usr/lib/.build-id/d1
    /usr/lib/.build-id/d1/b90b6ef978e37d3eb3bba154d782ce44d442e2
    /usr/lib/.build-id/d1/42f65bc1290c8f569236c11314897a85bbedd7
    /usr/lib/.build-id/d1/e69cbb285692ab3a0f3685f53d4b0194e22cac
    /usr/lib/.build-id/05 ...
    
    [student@class ~]$ ls -la
    total 2164
    drwx------.  4 student student     146 Dec 23 10:45 .
    drwxr-xr-x. 20 root    root       4096 Aug  9 15:57 ..
    -rw-------.  1 student student     255 Oct 14 13:25 .bash_history
    -rw-r--r--.  1 student student      18 Jan 19  2022 .bash_logout
    -rw-r--r--.  1 student student     141 Jan 19  2022 .bash_profile
    -rw-r--r--.  1 student student     492 Jan 19  2022 .bashrc
    drwxr-xr-x.  3 student student      27 Sep 23 15:41 Documents
    -rw-r--r--.  1 student student 2187752 Dec 23 10:45 find.txt
    -rw-------.  1 student student      20 Sep 30 14:58 .lesshst
    drwxr-xr-x.  4 student student      38 Sep 23 15:38 Videos
```
## Type 1: Managing pipeline, regular expression and command substitution 08/02/2022

Utilizzare il comando **find**, e l’utente student, per trovare tutti i files e directories sotto il path **/var** che contengono la lettera **a** o la lettera **b** o le lettera **c**. Per ogni file trovato determinare il file type utilizzando il comando file e redirigere l’output su **/exam/exercise1/find.txt**. Redirigere eventuali errori su **/exam/exercise1/error.txt**.
```bash
[root@class ~]# su - student
[student@class ~]$ mkdir exam
[student@class ~]$ cd exam/
[student@class exam]$ mkdir exercise
[student@class ~]$ cd exercise/
# Lo std error deve essere applicato al find perchè student tramite questo comando effettua la ricerca e quindi esponde i permessi negati 
[student@class exercise]$ file $(find /var 2>error.txt | grep [abc]) > find1.txt

[student@class exercise]$ cat find1.txt

/var/cache/man/cat2:                                                                                                                                           directory
/var/cache/man/cat3:                                                                                                                                           directory
/var/cache/man/cat4:                                                                                                                                           directory
/var/cache/man/cat5:                                                                                                                                           directory
/var/cache/man/cat6:                                                                                                                                           directory
/var/cache/man/cat7:                                                                                                                                           directory
/var/cache/man/cat8:                                                                                                                                           directory
...

[student@class exercise]$ cat error.txt

find: ‘/var/lib/selinux/targeted/active’: Permission denied
find: ‘/var/lib/selinux/final’: Permission denied
find: ‘/var/lib/sss/keytabs’: Permission denied
find: ‘/var/lib/sss/db’: Permission denied
find: ‘/var/lib/sss/deskprofile’: Permission denied
find: ‘/var/lib/sss/pipes/private’: Permission denied
find: ‘/var/lib/sss/secrets’: Permission denied
find: ‘/var/lib/fprint’: Permission denied
find: ‘/var/lib/portables’: Permission denied
find: ‘/var/lib/private’: Permission denied
find: ‘/var/lib/samba/private’: Permission denied
find: ‘/var/lib/polkit-1’: Permission denied
...

```

## Type 4 : User and Group 08/02/2022

 Creare un nuovo gruppo chiamati students con GID 3005 
Creare gli utenti appartenenti al gruppo students erossi e gbianchi 
●  l’utente erossi avrà le seguenti caratteristiche: 
-- UID 3008 
-- home directory /home/students/erossi 
-- password erossi 
-- dovrà cambiare password una volta ogni 30 giorni 
● l’utente gbianchi avrà le seguenti caratteristiche: 
-- UID 3010 
-- potrà accedere e gestire i file e directory appartenenti al gruppo collaboration 
dovrà cambiare password al primo accesso 
--  l’account scadrà dopo un anno dalla sua creazione
```bash
# Verifico GID gruppo 
[root@class students]# grep students /etc/group
students:x:3005:

# Aggiungo utente erossi con UID 3008 e home direcorty richiesta
[root@class students]# useradd -u 3008 --home /home/students/erossi erossi
[root@class students]# id erossi
uid=3008(erossi) gid=3008(erossi) groups=3008(erossi)

# Imposto students come gruppo di appartenenza di erossi 
[root@class students]# usermod -g students erossi
[root@class students]# id erossi
uid=3008(erossi) gid=3005(students) groups=3005(students)

# Verifico home directory
[root@class students]# grep student /etc/passwd
student:x:1000:1000::/home/student:/bin/bash
studenteProva:x:1005:1005::/home/studenteProva:/bin/bash
erossi:x:3008:3005::/home/students/erossi:/bin/bash

[root@class students]# chage -l erossi
Last password change                                    : Dec 23, 2022
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7

# Imposto cambuio password dopo 30 grorni 
[root@class students]# chage -d 30 erossi
[root@class students]# chage -l erossi
Last password change                                    : Jan 31, 1970
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7

[root@class students]# chage -M 30 erossi
[root@class students]# chage -l erossi
Last password change                                    : Jan 31, 1970
Password expires                                        : Mar 02, 1970
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 30
Number of days of warning before password expires       : 7

# Imposto password
[root@class students]# passwd erossi
Changing password for user erossi.
New password:
BAD PASSWORD: The password is shorter than 8 characters
Retype new password:
passwd: all authentication tokens updated successfully.
[root@class students]#

```
## Type 5 : Shell environment and alias command 08/02/2022

Creare un nuovo comando o alias command a piacimento chiamato **userinfo** disponibile al login per TUTTI gli utenti del sistema. Chiamato dovrà stampare la seguente stringa 
```bash
user: <username> - working directory: <print working directory> - home_directory: <home directory>

# Verifico variabili
[root@class students]# echo $USER
root
[root@class students]# $PWD
-bash: /exam/exercise4/collaboration/students: Is a directory
[root@class students]# $HOME
-bash: /root: Is a directory

# Definisco alias command
[root@class students]# alias userinfo="echo user: $USER - working directory: $PWD - home_directory: $HOME"
[root@class students]# userinfo
user: root - working directory: /exam/exercise4/collaboration/students - home_directory: /root

# Inserisco comando in /etc/bash in modo che sia disponibile a tutti gli utenti 
[root@class students]# vim /etc/bashrc
[root@class students]# logout
Connection to 127.0.0.1 closed.
                                                                                                                                       ✓

  23/12/2022   17:26.44   /home/mobaxterm  ssh root@127.0.0.1 -p 2222
root@127.0.0.1's password:
X11 forwarding request failed on channel 0
Activate the web console with: systemctl enable --now cockpit.socket

Last login: Fri Dec 23 10:40:39 2022 from 10.0.2.2
[root@class ~]# userinfo
user: root - working direcotry: /root - home_directory: /root
[root@class ~]#
[root@class ~]#

```
