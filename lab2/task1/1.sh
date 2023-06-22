#!/bin/bash
touch output.txt
number=$(ps -U $USER | tail -n +4 | wc -l)
echo "Amount: $number" >> output.txt
ps -U $USER -o pid,command | tail -n +2 >> output.txt