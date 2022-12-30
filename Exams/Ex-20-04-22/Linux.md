# Exercise 1: Managing Files with Shell Expansion and Command substitution
- Creare sotto il path /exam/exercise1 le directory exercise1_directoryX con X compreso tra 1 e 5
- all’interno di /exam/exercise1/exercise1_directoryX creare i files fileY_DATE.txt
  -  con Y compreso tra 1 e 10
  -  DATE la data di creazione file nel formato Y-m-d-H:M:S (date +%Y-%m-%d-%H:%M:%S)

```bash
[root@class exercise1]# for i in {1..5}; do mkdir exercise1_directory"$i"; done
[root@class exercise1]# for dir in */; do for i in {1..10}; do touch "$dir"file"$i"_$(date +"%Y-%m-%d-%H-%M-%S"); done; done

[root@class exercise1]# cd ..
[root@class exam]# tree exercise1/

exercise1/
├── error.txt
├── exercise1_directory1
│   ├── file10_2022-12-27-21-47-24
│   ├── file1_2022-12-27-21-47-24
│   ├── file2_2022-12-27-21-47-24
│   ├── file3_2022-12-27-21-47-24
│   ├── file4_2022-12-27-21-47-24
│   ├── file5_2022-12-27-21-47-24
│   ├── file6_2022-12-27-21-47-24
│   ├── file7_2022-12-27-21-47-24
│   ├── file8_2022-12-27-21-47-24
│   └── file9_2022-12-27-21-47-24
├── exercise1_directory2
│   ├── file10_2022-12-27-21-47-24
│   ├── file1_2022-12-27-21-47-24
│   ├── file2_2022-12-27-21-47-24
│   ├── file3_2022-12-27-21-47-24
│   ├── file4_2022-12-27-21-47-24
│   ├── file5_2022-12-27-21-47-24
│   ├── file6_2022-12-27-21-47-24
│   ├── file7_2022-12-27-21-47-24
│   ├── file8_2022-12-27-21-47-24
│   └── file9_2022-12-27-21-47-24
├── exercise1_directory3
│   ├── file10_2022-12-27-21-47-24
│   ├── file1_2022-12-27-21-47-24
│   ├── file2_2022-12-27-21-47-24
│   ├── file3_2022-12-27-21-47-24
│   ├── file4_2022-12-27-21-47-24
│   ├── file5_2022-12-27-21-47-24
│   ├── file6_2022-12-27-21-47-24
│   ├── file7_2022-12-27-21-47-24
│   ├── file8_2022-12-27-21-47-24
│   └── file9_2022-12-27-21-47-24
```
# Exercise 2: Special file permission
- Creare una directory sotto /exam/exercise2 dove gli utenti che possono accedere al gruppo collaboration potranno condividere files
- Tutti i file creati sotto la directory /exam/exercise2 dovranno essere assegnati automaticamente al gruppo collaboration
```bash
# Aggiungo gruppo cooperation
[root@class exercise2]# groupadd cooperation
[root@class exercise2]# cd ..
[root@class exam]# ls -la
total 4
drwxrwxrwx.  9 root    student        128 Dec 27 22:03 .
dr-xr-xr-x. 19 root    root           247 Dec 23 20:52 ..
drwxr-xr-x.  2 root    student         64 Dec 26 14:31 BashExercise
drwxrwxr-x.  8 student student       4096 Dec 27 22:41 exercise1
drwxr-sr-x.  3 root    collaboration   87 Dec 27 22:46 exercise2
drwxrwxr-x.  2 exam2   exam2           23 Dec 27 15:13 exercise3
drwxr-xr-x.  2 root    student          6 Dec 26 15:29 exercise4
drwxrwxrwx.  3 root    student         39 Dec 24 15:44 exercise5
drwxr-xr-x.  2 root    student        156 Dec 27 21:09 exercise6

# Imposto in maniera ricorsiva dir exercise1 appartenente a gruppo cooperation
[root@class exam]# chown -R :cooperation exercise1
[root@class exam]# ls -la
total 4
drwxrwxrwx.  9 root    student        128 Dec 27 22:03 .
dr-xr-xr-x. 19 root    root           247 Dec 23 20:52 ..
drwxr-xr-x.  2 root    student         64 Dec 26 14:31 BashExercise
drwxrwxr-x.  8 student cooperation   4096 Dec 27 22:41 exercise1
drwxr-sr-x.  3 root    collaboration   87 Dec 27 22:46 exercise2
drwxrwxr-x.  2 exam2   exam2           23 Dec 27 15:13 exercise3
drwxr-xr-x.  2 root    student          6 Dec 26 15:29 exercise4
drwxrwxrwx.  3 root    student         39 Dec 24 15:44 exercise5
drwxr-xr-x.  2 root    student        156 Dec 27 21:09 exercise6

# Applico gruppo di exercise1 in modo automatico a tutti i nuovi file creati
[root@class exam]# chmod g+s exercise1/

[root@class exam]# cd exercise1
[root@class exercise1]# touch testfile1
[root@class exercise1]# ls -la
total 48
drwxrwsr-x. 8 student cooperation  4096 Dec 27 23:00 .
drwxrwxrwx. 9 root    student       128 Dec 27 22:03 ..
-rw-rw-r--. 1 student cooperation  2272 Dec 27 17:03 error.txt
drwxr-xr-x. 2 root    cooperation  4096 Dec 27 21:47 exercise1_directory1
drwxr-xr-x. 2 root    cooperation  4096 Dec 27 21:47 exercise1_directory2
drwxr-xr-x. 2 root    cooperation  4096 Dec 27 21:47 exercise1_directory3
drwxr-xr-x. 2 root    cooperation  4096 Dec 27 21:47 exercise1_directory4
drwxr-xr-x. 2 root    cooperation  4096 Dec 27 21:47 exercise1_directory5
-rw-------. 1 exam2   cooperation     0 Dec 27 15:27 ffile
-rw-rw-r--. 1 ruth    cooperation     0 Dec 27 22:41 file
-rw-rw-r--. 1 student cooperation   190 Dec 26 16:21 findErr.txt
-rw-rw-r--. 1 student cooperation 12028 Dec 27 20:07 find.txt
drwxr-xr-x. 2 root    cooperation  4096 Dec 27 21:47 RandomFiles
-rw-r--r--. 1 root    cooperation     0 Dec 27 23:00 testfile1
```
# Exercise 3: User and Group
- Create due nuovi gruppi students e exam
  - students con GID 2100
  - exam con GID 2101
- Creare gli utenti appartenenti al gruppo exam: rossi e morini
  - l’utente rossi avrà le seguenti caratteristiche:
    - UID 3100
    - home directory /home/exam/rossi
    - dovrà cambiare password al primo accesso
    - dovrà poter accedere a file e directory appartenenti al gruppo students
  - l’utente morini avrà le seguenti caratteristiche:
    - UID 3101
    - dovrà cambiare password al primo accesso e successivamente una volta al mese
    - gruppi secondari users gamers e wheel
    - utilizzare come shell di default sh al posto di bash
```bash
 #Aggiungo gruppi
  308  groupadd students
  309  groupadd exam
 
 #Imposto GID pruppi
  310  groupmod -g 2100 students
  311  groupmod -g 2101 exam
  
 #Aggiungo utenti al gruppo exam
  312  useradd rossi
  313  useradd morini
  
  315  usermod -a -G exam rossi
  316  usermod -a -G exam morini
  317  id rossi
  318  id morini
  
 #Modifico UID utenti
  319  usermod -u 3100 rossi
  320  usermod -u 3101 morini
  321  id rossi
  322  id morini

#Modifico home direcotry rossi
  324  usermod -d /home/exam/rossi rossi

# Imposto paswd rossi e ne imposto il rinnovo al prossimo login
[root@class ~]# passwd rossi
Changing password for user rossi.
New password:
BAD PASSWORD: The password is shorter than 8 characters
Retype new password:
passwd: all authentication tokens updated successfully.

[root@class ~]# passwd -e rossi
Expiring password for user rossi.
passwd: Success

[alice@class root]$ su rossi
Password:
You are required to change your password immediately (administrator enforced).
Current password:
New password:
Retype new password:
bash-5.1$ su
Password:

# Aggiungo rossi al gruppo students
[root@class ~]# usermod -a -G students rossi

# Imposo paswd morini
[root@class ~]# passwd morini
Changing password for user morini.
New password:
BAD PASSWORD: The password is shorter than 8 characters
Retype new password:
passwd: all authentication tokens updated successfully.

# Imposto rinnovo paswd al prossimo login
[root@class ~]# passwd -e morini
Expiring password for user morini.
passwd: Success

# Imposto scadenza paswd ogni mese
[root@class ~]# passwd -x 30 morini
Adjusting aging data for user morini.
passwd: Success
[root@class ~]# su alice
[alice@class root]$ su morini
Password:
You are required to change your password immediately (administrator enforced).
Current password:
New password:
Retype new password:
[morini@class root]$ chage -l morini
Last password change                                    : Dec 28, 2022
Password expires                                        : Jan 27, 2023
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 30
Number of days of warning before password expires       : 7

# Aggiungo morini ai gruppi
[root@class ~]# usermod -a -G users,gamers,wheel morini
[root@class ~]# id morini
uid=3101(morini) gid=3015(morini) groups=3015(morini),10(wheel),100(users),2101(exam),31
[root@class ~]#
```
# Exercise 4: alias command
- Creare i seguenti aliases commands disponibili a tutti gli utenti del sistema:
  - “lsl” comando: ls -lah
- Creare un alias command disponibile a tutti gli utenti del sistema chiamato “psuser” il quale restituisca la lista di tutti i processi attivi del solo utente cheù lancia il comando.
```bash
# /etc/bashrc

alias lsl="ls -lah"
alias psuser="ps -U $USER"
```
# Exercise 5: Systemd
- Installare sul vostro sistema il servizio vsftpd
- Il servizio deve essere attivo al boot della macchina
```bash
# Eseguibile : /exam/exercise5/Ex5service.sh
#!/bin/bash

echo "Starting Ex5Service";
echo "Executing loop . . . ";
for i in {1..5}
do
  echo "Step $i";
done
echo "Loop ends, Service off";
sleep 1m

# Servizio : /etc/systemd/system/Ex5service.service
[Unit]
Description=Example systemd service

[Service]
ExecStart=/bin/bash /exam/exercise5/Ex5service.sh

[Install]
WantedBy=multi-user.target

# Avvio servizio
[root@class ~]# systemctl start Ex5service.service
[root@class ~]# systemctl status Ex5service.service
● Ex5service.service - Example systemd service
     Loaded: loaded (/etc/systemd/system/Ex5service.service; enabled; vendor preset: disabled)
     Active: active (running) since Wed 2022-12-28 21:47:20 CET; 20s ago
   Main PID: 6949 (bash)
      Tasks: 2 (limit: 2331)
     Memory: 580.0K
        CPU: 15ms
     CGroup: /system.slice/Ex5service.service
             ├─6949 /bin/bash /exam/exercise5/Ex5service.sh
             └─6950 sleep 1m

Dec 28 21:47:20 class systemd[1]: Started Ex5service.service - Example systemd service.
Dec 28 21:47:20 class bash[6949]: Starting Ex5Service
Dec 28 21:47:20 class bash[6949]: Executing loop . . .
Dec 28 21:47:20 class bash[6949]: Step 1
Dec 28 21:47:20 class bash[6949]: Step 2
Dec 28 21:47:20 class bash[6949]: Step 3
Dec 28 21:47:20 class bash[6949]: Step 4
Dec 28 21:47:20 class bash[6949]: Step 5
Dec 28 21:47:20 class bash[6949]: Loop ends, Service off

[root@class ~]# systemctl enable Ex5service.service

[root@class ~]# reboot
Connection to 127.0.0.1 closed by remote host.
Connection to 127.0.0.1 closed.
                                                                                                                                                                       
root@127.0.0.1's password:
root@127.0.0.1's password:
X11 forwarding request failed on channel 0
Web console: https://class:9090/ or https://10.0.2.15:9090/

Last login: Wed Dec 28 21:45:47 2022 from 10.0.2.2

[root@class ~]# systemctl status Ex5service.service
● Ex5service.service - Example systemd service
     Loaded: loaded (/etc/systemd/system/Ex5service.service; enabled; vendor preset: disabled)
     Active: active (running) since Wed 2022-12-28 16:36:20 CET; 7h ago
   Main PID: 669 (bash)
      Tasks: 2 (limit: 2331)
     Memory: 612.0K
        CPU: 12ms
     CGroup: /system.slice/Ex5service.service
             ├─669 /bin/bash /exam/exercise5/Ex5service.sh
             └─673 sleep 1m

Dec 28 16:36:20 class systemd[1]: Started Ex5service.service - Example systemd service.
Dec 28 16:36:21 class bash[669]: Starting Ex5Service
Dec 28 16:36:21 class bash[669]: Executing loop . . .
Dec 28 16:36:21 class bash[669]: Step 1
Dec 28 16:36:21 class bash[669]: Step 2
Dec 28 16:36:21 class bash[669]: Step 3
Dec 28 16:36:21 class bash[669]: Step 4
Dec 28 16:36:21 class bash[669]: Step 5
Dec 28 16:36:21 class bash[669]: Loop ends, Service off
```
