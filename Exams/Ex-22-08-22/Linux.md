# Exercise 1: Regular expression
- Dato un file con il seguente contenuto:
  _can
  man
  fan
  dan
  ran
  pan_
- Riportare una regular expression che rispetti il seguente schema
  _Match can
  Match man
  Match fan
  Skip dan
  Skip ran
  Skip pan_
- potete testare il tutto creando il file regexpr.txt sotto /exam/exercise1/regexpr.txt e il comando grep
- riportare la soluzione sotto /exam/exercise1/solution
```bash
[root@class exercise1]# grep '^[cmf]' /exam/exercise1/regexpr.txt
can
man
fan

[root@class exercise1]# echo "^[cmf]" > /exam/exercise1/solution
[root@class exercise1]# cat /exam/exercise1/solution
^[cmf]
[root@class exercise1]#
```
# Esercizio 4: Shell environment and alias command
```bash
[root@class /]# mkdir exam/exercise4
[root@class /]# cd exam/exercise4
[root@class exercise4]# alias userinfo="echo user: $USER - working directory: $HOME"

# Rendo comando alias permanente inserendolo in /etc/bashrc
[root@class exercise4]# vim /etc/bashrc

[root@class ~]# su student
[student@class root]$ userinfo
user: student - working directory: /root - home_directory: /home/student

[root@class ~]# su alice
[alice@class root]$ userinfo
user: alice - working directory: /root - home_directory: /home/alice
