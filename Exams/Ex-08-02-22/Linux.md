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
