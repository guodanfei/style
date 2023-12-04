#!/bin/bash
#
#


if [ ! -d ./output ]; then
	mkdir output
fi

if [ ! -d ./output/source ]; then
	mkdir output/source
fi


make ${1}
