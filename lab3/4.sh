#!/bin/bash

# Start the first process and capture its PID
./4demons/pr1.sh &
pid1=$!

cpulimit --pid $pid1 --limit 10 &

./4demons/pr2.sh &
./4demons/pr3.sh &