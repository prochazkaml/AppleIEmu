#!/bin/bash

# $1 = min value
# $2 = max value
# $3 = variable name (as in switch(...))
# $4 = result format

if [ $# -ne 4 ]; then
	echo "Usage: $0 <min> <max> <varname> <resultfmt>" 1>&2
	exit 1
fi

if [ $1 -gt $2 ]; then
	echo "Error: min > max" 1>&2
	exit 1
fi

min=$1
max=$2
varname=$3
resultfmt=$4

middle=$(( ($min + $max) / 2 ))

#echo $middle 2>&1

echo "if $varname < $middle"

if [ $((max-min)) -gt 2 ]; then
	$0 $min $middle $varname "$resultfmt"
else
	printf "$resultfmt\n" $min
fi

echo "else"

if [ $((max-min)) -gt 2 ]; then
	$0 $middle $max $varname "$resultfmt"
else
	printf "$resultfmt\n" $middle
fi

echo "end"


