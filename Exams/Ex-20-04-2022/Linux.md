# Exercise 1: Managing Files with Shell Expansion and Command substitution
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
