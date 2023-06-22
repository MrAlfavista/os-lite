#!/bin/bash

for ((i = 0; i < $1; i++)); do
	./mul2 500000 "2-${i}" &
done
wait
    
