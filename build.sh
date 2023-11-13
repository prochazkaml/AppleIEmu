#!/bin/bash

if [ ! -d "build" ]; then
	mkdir build
fi

if [ ! -f "build/compressor" ]; then
	echo "Compiling data compressor..."
	cc rom/compressor.c -o build/compressor
fi

if [ ! -f "build/binsearch.m" ]; then
	echo "Generating MATLAB binary search tree..."
	./utils/binarysearch.sh 0 256 "b" "%%#include \"src/cpucore/opcodes/*/%02X*\"" > build/binsearch.m
fi

# Build the system ROM

echo "Building system ROM..."

xa -C -o build/tutortxt.bin -l build/tutortxt.lst rom/tutortxt.asm
./build/compressor build/tutortxt.bin build/tutortxt.cmp
xa -C -o build/rom.bin -l build/rom.lst rom/main.asm

#xxd -i -c 256 rom.bin | grep -v "rom_" | grep -v "}" | sed "s/,$/ .../g" | sed "s/,//g" | xclip -selection clipboard

# Build the MATLAB script

echo "Building MATLAB script..."

./utils/genillegal.sh
rm -rf build/bundlecache
./utils/mlbundle.sh src/main.m > build/emu6502.m

echo "Done."
