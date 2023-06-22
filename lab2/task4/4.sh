#!/bin/bash
declare -a processes

for pid in $(ps -eo pid | tail -n +2); do
  ppid=$(awk '/^PPid:/ {print $2}' /proc/$pid/status)
  sum_exec_runtime=$(awk '/^se.sum_exec_runtime/ {print $3}' /proc/$pid/sched)
  nr_switches=$(awk '/^nr_switches/ {print $3}' /proc/$pid/sched)
  art=$(echo "$sum_exec_runtime / $nr_switches" | bc -l)
  processes+=("ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$art")
done

sorted_processes=($(printf '%s\n' "${processes[@]}" | sort -t= -k3n))

printf '%s\n' "${sorted_processes[@]}" > task4.txt
