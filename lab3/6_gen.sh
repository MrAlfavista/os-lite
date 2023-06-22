#!/bin/bash

./6_han.sh &

while true
do
  read input
  
  if [[ $input == "+" ]]
  then
    kill -USR1 $(cat hpid)
    
  elif [[ $input == "*" ]]
  then
	kill -USR2 $(cat hpid)
  
  elif [[ $input == "TERM" ]]
  then
    kill -SIGTERM $(cat hpid)
	rm hpid
	break
  else
    echo "Error: Invalid input. Please enter a valid operation (+ or *) or TERM"
  fi
done