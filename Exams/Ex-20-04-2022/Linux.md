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
