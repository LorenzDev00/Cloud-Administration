# Exercise 1: Managing pipeline and regular expression
- Utilizzare il comando find e grep, per trovare tutti i files e directories sotto il path /usr che contengono il pattern “ab” “ac” “af” “bb” “bc” “bf” nel nome.
- Riportare il comando utilizzato sotto /exam/exercise1/regex.txt.
```bash
[root@class exercise1]# find /usr | grep -e ab -e ac -e af -e bb -e bc -e bf

/usr/libexec/abrt-action-install-debuginfo-to-abrt-cache
/usr/libexec/abrt-gdb-exploitable
/usr/libexec/packagekit-direct
/usr/libexec/packagekitd
/usr/libexec/cockpit-wsinstance-factory
/usr/libexec/psacct
/usr/libexec/psacct/accton-create
/usr/libexec/man-db/globbing
/usr/local/share/applications/mimeinfo.cache
...

[root@class exercise1]# echo "find /usr | grep -e "ab" -e "ac" -e "af" -e "bb" -e "bc" -e "bf"" > regex.txt

```

# Exercise 2: Shell environment and alias command
- Creare un nuovo comando o alias command chiamato userinfo disponibile al login per TUTTI gli utenti del sistema.
- Chiamato dovrà stampare la seguente stringa user: <username> - working directory: <print working directory> - home_directory: /home/directory
 
# Exercise 3: Managing Files with Shell Expansion and Command substitution
- Creare sotto il path /exam/exercise3 le directory exercise3_directoryX con X compreso tra 1 e 50
- all’interno di /exam/exercise3/exercise3_directoryX creare i files fileY_DATE.txt
  - con Y compreso tra 1 e 5
  - DATE la data di creazione file nel formato Y-m-d-H:M:S

```bash
[root@class exercise3]# for i in {1..50}; do mkdir exercise3_directory"$i"; done
[root@class exercise3]# for dir in */; do for i in {1..5}; do touch "$dir"file"$i"_$(date '+%Y-%m-%d-%H:%M:%S').txt; done; done;

[root@class exam]# tree exercise3
exercise3
├── billfile
├── exercise3_directory1
│   ├── file1_2022-12-29-19:12:31.txt
│   ├── file2_2022-12-29-19:12:31.txt
│   ├── file3_2022-12-29-19:12:31.txt
│   ├── file4_2022-12-29-19:12:31.txt
│   └── file5_2022-12-29-19:12:31.txt
├── exercise3_directory10
│   ├── file1_2022-12-29-19:12:31.txt
│   ├── file2_2022-12-29-19:12:31.txt
│   ├── file3_2022-12-29-19:12:31.txt
│   ├── file4_2022-12-29-19:12:31.txt
│   └── file5_2022-12-29-19:12:31.txt
├── exercise3_directory11
│   ├── file1_2022-12-29-19:12:31.txt
│   ├── file2_2022-12-29-19:12:31.txt
│   ├── file3_2022-12-29-19:12:31.txt
│   ├── file4_2022-12-29-19:12:31.txt
│   └── file5_2022-12-29-19:12:31.txt
├── exercise3_directory12
│   ├── file1_2022-12-29-19:12:31.txt
│   ├── file2_2022-12-29-19:12:31.txt
│   ├── file3_2022-12-29-19:12:31.txt
│   ├── file4_2022-12-29-19:12:31.txt
│   └── file5_2022-12-29-19:12:31.txt
├── exercise3_directory13
│   ├── file1_2022-12-29-19:12:31.txt
│   ├── file2_2022-12-29-19:12:31.txt
│   ├── file3_2022-12-29-19:12:31.txt
│   ├── file4_2022-12-29-19:12:31.txt
│   └── file5_2022-12-29-19:12:31.txt
```
