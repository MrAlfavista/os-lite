#!/bin/bash

touch emails.lst

for file in /etc/* 
do
  grep -oE "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" $file >> emails.lst
done

sort emails.lst | uniq -u > temp.lst

mv temp.lst emails.lst

cat emails.lst