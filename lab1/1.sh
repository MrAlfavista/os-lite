#!/bin/bash

# Set the directory to be displayed
dir=$1

# Check if a directory was provided
if [ -z "$dir" ]; then
  # If no directory was provided, use the current directory
  dir=$(pwd)
fi

# Check if the provided directory exists
if [ ! -d "$dir" ]; then
  echo "Error: $dir is not a valid directory"
  exit 1
fi

# Recursively list the contents of the directory
# The `-L 1` option tells `find` to only list the files in the current directory, not subdirectories
# The `-mindepth 1` option tells `find` to exclude the current directory itself
# The `-printf` option tells `find` to print the file names with the appropriate indentation
find "$dir" -mindepth 1 -printf "%P\n" | while read file; do
  # Calculate the indentation for the file based on the number of '/' characters in its name
  indent=$(echo "$file" | sed 's/[^/]//g' | wc -c)

  # Print the file name with the appropriate indentation
  printf "%${indent}s%s\n" "" "$file"
done