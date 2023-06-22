#!/bin/bash

pipe="my_pipe"
rm -f $pipe
mkfifo $pipe

./5_han.sh &

while true
do
  read input
  
  if [[ $input == "+" || $input == "*" ]]
  then
    echo $input > $pipe
    
  elif [[ $input == "QUIT" ]]
  then
    echo $input > $pipe
    exit 0
  
  elif [[ $input =~ ^[0-9]+$ ]]
  then
    echo $input > $pipe
  else
    echo "Error: Invalid input. Please enter a valid operation (+ or *), a numeric value, or QUIT."
  fi
done
