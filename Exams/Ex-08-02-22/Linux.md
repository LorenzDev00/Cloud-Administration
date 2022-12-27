# Exercise 1: Managing pipeline, regular expression and command
substitution
```bash
[student@class /]$ find /var 2>/exam/exercise1/error.txt | grep [abc] >/exam/exercise1/find.txt
```
# Exercise 2: Special file permission
```bash
# Creo range di directories
[root@class /]# cd exam/exercise2/
[root@class exercise2]# for i in {1..15}; do mkdir "directory$i"; done

# Creo, per ogni directory un range di file con indice e data creazione 
[root@class exercise2]# for dir in */; do for i in {1..9}; do touch "$dir"exam2_file"$i"_$(date +%F); done; done
[root@class exercise2]# cd ..

# Stampo alberatura directory
[root@class exam]# tree exercise2

exercise2
├── directory1
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory10
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory11
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory12
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory13
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory14
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory15
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory2
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory3
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory4
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory5
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory6
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory7
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory8
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
├── directory9
│   ├── exam2_file1_2022-12-27
│   ├── exam2_file2_2022-12-27
│   ├── exam2_file3_2022-12-27
│   ├── exam2_file4_2022-12-27
│   ├── exam2_file5_2022-12-27
│   ├── exam2_file6_2022-12-27
│   ├── exam2_file7_2022-12-27
│   ├── exam2_file8_2022-12-27
│   └── exam2_file9_2022-12-27
```
# Exercise 3: Default file permission
```bash
# Creo utente 
[root@class exam]# useradd exam2

# Creo directory e cambio permessi exam2 tramite umask in .bashrc
[exam2@class exam]$ mkdir exercise3
[exam2@class exam]$ ls -la
total 4
drwxrwxrwx.  9 root    student        128 Dec 27 15:09 .
dr-xr-xr-x. 19 root    root           247 Dec 23 20:52 ..
drwxr-xr-x.  2 root    student         64 Dec 26 14:31 BashExercise
drwxrwxr-x.  2 student student         41 Dec 26 15:59 exercise1
drwxrwsr-x. 17 student collaboration 4096 Dec 27 14:16 exercise2
drwxrwxr-x.  2 exam2   exam2            6 Dec 27 15:09 exercise3
drwxr-xr-x.  2 root    student          6 Dec 26 15:29 exercise4
drwxrwxrwx.  3 root    student         39 Dec 24 15:44 exercise5
drwxr-xr-x.  2 root    student        113 Dec 26 19:32 exercise6

[exam2@class exam]$ logout
bash: logout: not login shell: use `exit'
[exam2@class exam]$ exit
exit
[root@class exam]# logout

# Creo file prova in exercise3/
[exam2@class exercise3]$ ls -la
total 0
drwxrwxr-x. 2 exam2 exam2    23 Dec 27 15:13 .
drwxrwxrwx. 9 root  student 128 Dec 27 15:09 ..
-rw-------. 1 exam2 exam2     0 Dec 27 15:13 testfile1
[exam2@class exercise3]$

[root@class ~]# usermod -a -G student exam2
[root@class ~]# su exam2
[exam2@class root]$ cd ..
[exam2@class /]$ cd exam/
[exam2@class exam]$ id exam2
uid=1009(exam2) gid=1011(exam2) groups=1011(exam2),1000(student)

[exam2@class exam]$ cd exercise1
[exam2@class exercise1]$ touch ffile
[exam2@class exercise1]$ ls -la
total 1728
drwxrwxr-x. 2 student student      54 Dec 27 15:27 .
drwxrwxrwx. 9 root    student     128 Dec 27 15:09 ..
-rw-------. 1 exam2   exam2         0 Dec 27 15:27 ffile
-rw-rw-r--. 1 student student     190 Dec 26 16:21 findErr.txt
-rw-rw-r--. 1 student student 1765174 Dec 26 16:21 find.txt
```
# Exercise 4: User and Group
```bash
[root@class ~]# groupadd students

# Modifico GID gruppo students
[root@class ~]# groupmod -g 3005 students

# Creo utenti
[root@class ~]# useradd erossi
[root@class ~]# useradd gbianchi

# Aggiungo utenti al gruppo students
[root@class ~]# usermod -a -G students erossi
[root@class ~]# usermod -a -G students gbianchi

# cambio UID , verifico GID 
[root@class ~]# usermod -u 3008 erossi
[root@class ~]# usermod -u 3010 gbianchi

[root@class ~]# id erossi
uid=3008(erossi) gid=3006(erossi) groups=3006(erossi),3005(students)

# Cambio paswd per erossi
[root@class students]# passwd erossi
Changing password for user erossi.
New password:
BAD PASSWORD: The password is shorter than 8 characters
Retype new password:
passwd: all authentication tokens updated successfully.

# Imposto limite tempo 30 giorni 
[root@class students]# passwd -x 30 erossi
Adjusting aging data for user erossi.
passwd: Success
[root@class students]# chage -l erossi
Last password change                                    : Dec 27, 2022
Password expires                                        : Jan 26, 2023
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 30
Number of days of warning before password expires       : 7

# Consento a gbianchi di accedere e gestire i file e directory appartenenti al gruppo collaboration
[root@class students]# usermod -a -G collaboration gbianchi

[gbianchi@class exam]$ cd exercise2
[gbianchi@class exercise2]$ ls -la
total 64
drwxrwsr-x. 17 student collaboration 4096 Dec 27 14:16 .
drwxrwxrwx.  9 root    student        128 Dec 27 15:09 ..
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory1
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory10
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory11
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory12
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory13
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory14
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory15
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory2
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory3
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory4
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory5
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory6
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory7
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory8
drwxr-sr-x.  2 root    collaboration 4096 Dec 27 14:43 directory9
-rw-r--r--.  1 root    collaboration    0 Dec 27 14:20 exam2_file2022-12-27
-rw-r--r--.  1 root    collaboration    0 Dec 27 14:35 +%F
-rw-rw-r--.  1 student collaboration    0 Dec 26 16:39 studentTestFile
-rw-r--r--.  1 root    collaboration    0 Dec 26 16:38 testfile1
-rw-r--r--.  1 root    root             0 Dec 26 16:37 textfile

[gbianchi@class exercise2]$ mkdir gbianchidir
[gbianchi@class exercise2]$ touch filegbianchi
[gbianchi@class exercise2]$ ls -la
total 64
drwxrwsr-x. 18 student  collaboration 4096 Dec 27 16:20 .
drwxrwxrwx.  9 root     student        128 Dec 27 15:09 ..
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory1
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory10
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory11
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory12
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory13
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory14
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory15
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory2
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory3
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory4
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory5
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory6
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory7
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory8
drwxr-sr-x.  2 root     collaboration 4096 Dec 27 14:43 directory9
-rw-r--r--.  1 root     collaboration    0 Dec 27 14:20 exam2_file2022-12-27
-rw-r--r--.  1 root     collaboration    0 Dec 27 14:35 +%F
-rw-rw-r--.  1 gbianchi collaboration    0 Dec 27 16:20 filegbianchi
drwxrwsr-x.  2 gbianchi collaboration    6 Dec 27 16:20 gbianchidir
-rw-rw-r--.  1 student  collaboration    0 Dec 26 16:39 studentTestFile
-rw-r--r--.  1 root     collaboration    0 Dec 26 16:38 testfile1
-rw-r--r--.  1 root     root             0 Dec 26 16:37 textfile

# Imposto cambio paswd al prossimo login 
[root@class exam]# passwd -e gbianchi
Expiring password for user gbianchi.

[alice@class exam]$ su gbianchi
Password:
You are required to change your password immediately (administrator enforced).
Current password:
New password:
Retype new password:
[gbianchi@class exam]$

# Imposto scadenza account entro un anno
[root@class exam]# usermod -e 20232-12-27 john
usermod: user 'john' does not exist
[root@class exam]# usermod -e 20232-12-27 gbianchi
[root@class exam]# chage -l gbianchi
Last password change                                    : Dec 27, 2022
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : Dec 27, 20232
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```
