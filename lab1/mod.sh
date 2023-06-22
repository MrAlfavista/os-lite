#!/bin/bash

while read line; do

  surname=$(echo $line | cut -d' ' -f1)
  
  name=$(echo $line | cut -d' ' -f2)
  
  otchecstvo=$(echo $line | cut -d' ' -f3)
  
  group=$(echo $line | cut -d' ' -f4)

  group_year=$(echo $group | cut -c2-3)
  
  first_letter=$(echo "$group_year" | cut -c1)
  
  first_digit=$((first_letter - "0"))
  
  result=$((first_digit * (first_digit % 3)))
  
  second_letter=$(echo "$group_year" | cut -c2)
  
  second_digit=$((second_letter - "0"))

  year=$((result + second_digit))

echo "$name $surname $otchecstvo $year"

done < students.txt