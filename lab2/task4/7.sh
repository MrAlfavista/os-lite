#!/bin/bash

for pid in $(ps -eo pid | tail -n +2); do
    rchar=$(grep rchar /proc/$pid/io | awk '{print $2}')
    echo "$pid $rchar" >> temp
done

sleep 60

declare -A after
for pid in $(ps -eo pid | tail -n +2); do
    rchar=$(grep rchar /proc/$pid/io | awk '{print $2}')
    after[$pid]=$rchar
done

while read line; do
    pid=$(echo $line | awk '{print $1}')
    rchar=$(echo $line | awk '{print $2}')
    usage=$((after[$pid]-$rchar))
    echo "$pid $usage" >> usage
done < temp


sort -nk2 usage | tail -n 3 >> final

while read line; do
	pid=$(echo $line | awk '{print $1}')
    used=$(echo $line | awk '{print $2}')
    cmd=$(ps -p "$pid" -o command | tail -n +2)
    echo "$pid : $used : $cmd"
done < final
rm final
rm usage
rm temp

	