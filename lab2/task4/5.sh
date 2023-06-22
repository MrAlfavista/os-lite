#!/bin/bash

N=0
M=0
count=0

while read line; do
    PPid=$(echo "$line" | awk -F= '{print $3}' | awk -F: '{print $1}')
    ART=$(echo "$line" | awk -F= '{print $4}')
    if [[ $N -eq $PPid ]]; then
        ((count++))
        M=$(echo "$M $ART" | awk '{print $1 + $2}')
    else
        if [[ $N -ne 0 ]]; then
            M=$(echo "$M $count" | awk '{print $1/$2}')
            echo "Average_Running_Children_of_ParentID=$N is $M" >> text
        fi
        N=$PPid
        M=$ART
        count=1
    fi
    echo "$line" >> text
done < task4.txt

M=$(echo "$M $count" | awk '{print $1/$2}')
echo "Average_Running_Children_of_ParentID=$N is $M" >> text
mv text task4.txt