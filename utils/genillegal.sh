#!/bin/bash

for i in src/cpucore/opcodes/illegal/*.m; do
	filename=`basename "$i"`
	opcode="${filename%.*}"
	echo "error(\"ERROR - INVALID OPCODE @ %04X: $opcode\n\", pc - 1)" > "$i"
done
