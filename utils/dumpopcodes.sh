#!/bin/bash

files=`ls src/cpucore/opcodes/*/*.m | cut -d'/' -f5- | sort`
for i in $files; do
	echo =================================================
	echo $i
	cat src/cpucore/opcodes/*/$i
	echo
done
