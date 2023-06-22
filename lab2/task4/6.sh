#!/bin/bash

max_usage=0
max_pid=0

for pid in $(ps -eo pid | tail -n +2); do
	rss=$(grep -s "VmRSS:" /proc/$pid/status | awk '{print $2}')
    if [[ $rss -gt $max_usage ]]; then
      max_usage=$rss
      max_pid=$pid
    fi
done
echo "Process with max RAM usage is PID=$max_pid with VmRSS=$max_usage kB"
