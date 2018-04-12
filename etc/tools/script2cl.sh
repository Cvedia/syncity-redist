#!/bin/bash

if [ -z "$2" ] ; then
	echo "Usage: $0 <path/to/syncity.py> <path/to/output/>"
	exit 0
fi

cd "$1"

output="$2"
blacklist=( __init__ template )

in_array() {
	local e match="$1"
	shift
	
	for e in "$@"; do
		[[ "$e" == "$match" ]] && return 0
	done
	
	return 1
}

for f in $(ls --color=never -1 syncity/scripts/*.py); do
	git ls-files --error-unmatch $f > /dev/null 2>&1
	RT=$?
	
	if [ "$RT" -eq "0" ] ; then
		b=${f##*/}
		b=${b%.*}
		
		in_array $b "${blacklist[@]}"
		RT=$?
		
		if [ "$RT" -eq "0" ] ; then
			echo "*** Skipping: $b ..."
			continue
		fi
		
		echo "*** Running: $b ..."
		ofn=$output$b.cl
		python3 syncity.py -L ERR -q -d --nohead --setup_only --record $ofn -s $b > /dev/null
		RT=$?
		
		if [ "$RT" -ne "0" ] ; then
			echo "*** Error running $b , aborting!"
			exit 1
		fi
		
		if [ ! -s "$ofn" ] ; then
			echo "*** No output from $b @ $ofn"
			rm -f $ofn
		fi
	fi
done

echo "Completed!"
exit 0
