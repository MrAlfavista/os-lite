#!/bin/bash

for ((i = 0; i < 20; i++)); do
	rm -f "2-${i}"
	touch "2-${i}"
	./gen-nums $1 > "2-${i}"
done
