#!/bin/bash

sedlist=""

while read line; do
	if [ "$line" ]; then
		echo $line
		sedlist="${sedlist}s/`echo $line | cut -d" " -f1`/`echo $line | cut -d" " -f2`/g;"
	fi
done < src/cpucore/microcode/definitions.txt

echo "$sedlist"
