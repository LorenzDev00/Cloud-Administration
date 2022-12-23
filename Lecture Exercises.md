## Exercise 1: Managing pipeline and regular expression 19/01/2022

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
## Exercise 1: Managing pipeline, regular expression and command substitution 08/02/2022

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
