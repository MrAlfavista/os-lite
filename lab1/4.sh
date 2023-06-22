#!/bin/bash

home_dir=$HOME

cur_dir=$(pwd)

if [ "$home_dir" == "$cur_dir" ]; then
  echo "Мы в домашней директории: $home_dir"
  exit 0
else
  echo "Не в домашней директории"
  exit 1
fi