#!/bin/bash

# MATLAB script minificator. Removes comments and whitespace from a MATLAB script.

if [ $# -ne 1 ]; then
	echo "Usage: $0 <file>" 1>&2
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "File not found: $1" 1>&2
	exit 1
fi

while IFS= read -r line; do
	echo "$line" | xargs echo
done < "$1"
