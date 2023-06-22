#!/bin/bash

for ((i = 1; i <= 20; i++)); do
	echo $i
	for ((j = 0; j < 10; j++)); do
		/usr/bin/time -f "%E" ./seq_cos.sh $i
	done
done
