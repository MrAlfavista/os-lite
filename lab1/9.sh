#!bin/bash

C=$(cat /var/log/*.log | wc -l)
echo "$C"