#!/bin/bash

for ((i = 0; i < $1; i++)); do
	./cos < $i > 20
done
    
