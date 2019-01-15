#!/bin/bash
# Copyright (c) 2016-2018 CVEDIA PVE Ltd - www.cvedia.com
#

if [ -z "$1" ] ; then
	echo "Usage: $0 <path/to/root>"
	exit 1
fi

echo "Scanning $1 ..."

ldconfig

MISSING=$(find "$1" -type f | grep "\.so" | xargs -n1 -P$(($(nproc) + 1)) -I'{}' ldd {} | grep "not found" | grep -v "libSynCore")
K=$(echo "$MISSING" | wc -l)

if [ "$K" -le "1" ]; then
	echo "No missing dependencies"
	exit 0
else
	echo "There are $K missing dependencies:"
	echo "$MISSING"
	exit 1
fi
