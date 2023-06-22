#!/bin/bash

calculated=1
mode="+"

pipe="my_pipe"
rm -f $pipe
mkfifo $pipe

while true
do
  read line < $pipe
  
  if [[ $line =~ ^[0-9]+$ ]]
  then
    if [[ $mode == "+" ]]
    then
      calculated=$(($calculated + $line))
    elif [[ $mode == "*" ]]
    then
      calculated=$(($calculated * $line))
    fi
  elif [[ $line == "+" ]]
  then
    mode="+"
  elif [[ $line == "*" ]]
  then
    mode="*"
  elif [[ $line == "QUIT" ]]
  then
	echo "The result is $calculated."
    break
  
  else
    echo "Error: Invalid input."
    break
  fi
done


rm -f $pipe