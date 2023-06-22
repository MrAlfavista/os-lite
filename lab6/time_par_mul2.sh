#!/bin/bash

for ((i = 1; i <= 20; i++)); do
	echo $i
	./gen-nums.sh 500000
	for ((j = 0; j < 10; j++)); do
		/usr/bin/time -f "%E" ./par_mul2.sh $i
	done
done
