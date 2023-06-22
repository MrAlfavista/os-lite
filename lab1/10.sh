#!/bin/bash

man bash | tr '[:upper:]' '[:lower:]' | tr -cs '[:alpha:]' '[\n*]' | sort | uniq -c | sort -nr | awk 'length($2) >= 4 {print $2}' | head -n 3
