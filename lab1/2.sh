#!/bin/bash

input=""

while true; do
  read -r line
  if [ "$line" = "q" ]; then
    break
  fi
  input="$input$line"
done

echo "$input"