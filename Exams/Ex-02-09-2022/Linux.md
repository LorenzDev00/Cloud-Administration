# Exercise 1: Managing Files with Shell Expansion
- Creare la seguente struttura sotto le directory /exam/exercise1/exercise1_dirX/file-Y-DATE con:
  - X compreso tra 1 e 10
  - Y compreso tra 1 e 100
  - DATE la data di creazione nel formato Y-m-d
```bash
[root@class exercise1.1]# for i in {1..10}; do mkdir exercise1_dir"$i"; done
[root@class exercise1.1]# ls -la
total 8
drwxr-sr-x. 12 root    students 4096 Jan  1 19:54 .
drwxrwsr-x.  9 student students 4096 Jan  1 19:52 ..
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir1
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir10
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir2
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir3
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir4
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir5
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir6
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir7
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir8
drwxr-sr-x.  2 root    students    6 Jan  1 19:54 exercise1_dir9

[root@class exercise1.1]# for dir in */; do for i in {1..100}; do touch "$dir"file-"$i"-$(date +"%Y-%m-%d"); done; done
[root@class exercise1.1]# cd ..
[root@class exercise1]# tree exercise1.1

├── exercise1_dir7
│   ├── file-100-2023-01-01
│   ├── file-10-2023-01-01
│   ├── file-11-2023-01-01
│   ├── file-1-2023-01-01
│   ├── file-12-2023-01-01
│   ├── file-13-2023-01-01
└── exercise1_dir9
    ├── file-100-2023-01-01
    ├── file-10-2023-01-01
    ├── file-11-2023-01-01
    ├── file-1-2023-01-01
    ├── file-12-2023-01-01
    ├── file-13-2023-01-01
```
