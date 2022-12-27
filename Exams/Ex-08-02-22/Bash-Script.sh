#!/bin/bash

#echo "directory $1"
#echo "extention $2"
#echo "extra $3"

# FUNZIONE INPUT PARAMETRI
function input(){
if [ -z $2 ] || [ ! -z $3 ];
then
	echo "usage: copyFile.sh "$1" "$2" ";
  exit 1
fi
}

# BLOCCO PRINCIPALE 

input $1 $2 $3

if [ -d "$1" ]; then

  find "$1" -name "*.$2" > copied_files.txt
  cat copied_files.txt
else
  
  echo "Error: $1  not found"
fi
