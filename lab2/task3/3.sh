#!/bin/bash
info=$(ps -eo pid,start_time --sort=-start_time)
pid=$(echo $info | awk '{print $3}')
tme=$(echo $info | awk '{print $4}')
echo "$pid"
echo "$tme"