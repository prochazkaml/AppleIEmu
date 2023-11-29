#!/bin/bash

# A simple MATLAB script bundler. Bundles several files into a single
# MATLAB script that can be run with MATLAB.

# Supported MATLAB bundling instructions:
#
#   %#include "file" - includes the contents of "file" at the current position (that file will also be processed)
#   %#incbin "file" - includes the contents of "file" as a byte row vector at the current position

cachedir="build/bundlecache"

if [ ! -d "$cachedir" ]; then
	mkdir -p "$cachedir"
fi

if [ $# -ne 1 ]; then
	echo "Usage: $0 <file>" 1>&2
	exit 1
fi

#if [ ! -f "$1" ]; then
#	echo "File not found: $1" 1>&2
#	exit 1
#fi

sedlist=""

function include {
	echo " - Including \"$1\" (text mode)" 1>&2
		echo "%%% ================ Including file $1 (text mode) ================"
	$0 "$1"
}

function incbin {
	echo " - Including \"$1\" (binary mode)" 1>&2

	echo "%%% ================ Including file $1 (binary mode) ================"
	echo "%%% ================ Bundled file $1 start ================"
	xxd -i -c 256 "$1" | grep -v "rom_" | grep -v "}" | sed "s/,$/ .../g" | sed "s/,//g"
	echo "%%% ================ Bundled file $1 end ================"
}

function incdefs {
	echo " - Including definitions from \"$1\"" 1>&2

	echo "%%% ================ Including definitions file $1 ================"

	cachename="$cachedir/`echo "$1" | tr / _`"

	if [ ! -f "$cachename" ]; then
		while read line; do
			if [ "$line" ]; then
				line=`echo "$line" | sed "$sedlist"`
				sedlist="${sedlist}s/`echo $line | cut -d" " -f1`/`echo $line | cut -d" " -f2-`/g;"
			fi
		done < $1

		echo "$sedlist" > "$cachename"
	else
		echo "   (using cached $cachename)" 1>&2

		sedlist=`cat "$cachename"`		
	fi
}

function incfun {
	echo " - Including function from \"$1\" (arguments \"$2\")" 1>&2

	i=1
	field=1
	funsedlist=""
	sedprefix="__ret"

	while true; do
		arg=`echo $2 | cut -d" " -f$field`

		if [ ! $arg ]; then
			break
		elif [ $arg == "=" ]; then
			sedprefix="__arg"
			i=0
		elif [ $arg != "~" ]; then
			funsedlist="${funsedlist}s/$sedprefix$i/$arg/g;"
		fi

		i=$((i+1))
		field=$((field+1))
	done

	echo "%%% ================ Including function file $1 (arguments: $2) ================"

	cachename="$cachedir/`echo "$1" | tr / _`.`echo "$2" | tr " " _`"

	if [ ! -f "$cachename" ]; then
		$0 "$1" | sed "$funsedlist" > "$cachename"
	else
		echo "   (using cached $cachename)" 1>&2
	fi

	cat "$cachename"
}

echo "%%% ================ Bundled file $1 start ================"

while IFS= read -r line; do
	if [[ "$line" =~ ^%#include\ \"(.*)\"$ ]]; then
		include "${BASH_REMATCH[1]}"
	elif [[ "$line" =~ ^%#incbin\ \"(.*)\"$ ]]; then
		incbin "${BASH_REMATCH[1]}"
	elif [[ "$line" =~ ^%#incdefs\ \"(.*)\"$ ]]; then
		incdefs "${BASH_REMATCH[1]}"
	elif [[ "$line" =~ ^%#incfun\ \"(.*)\"\ (.*)$ ]]; then
		incfun "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}"
	else
		if [ "$sedlist" ]; then
			echo "$line" | sed "$sedlist"
		else
			echo "$line"
		fi
	fi
done < $1

echo "%%% ================ Bundled file $1 end ================"
