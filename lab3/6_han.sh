#!/bin/bash

touch hpid
echo $$ > hpid

res=1

plus() {
  let res=$res+2
  echo $res
}

mult() {
  let res=$res*2
  echo $res
}

finish() {
  echo "Result is $res"
  exit
}

trap plus USR1
trap mult USR2
trap finish SIGTERM

while true
do
  sleep 1
done

