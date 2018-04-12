#!/bin/bash

cd "$1"

for f in $(git diff-index --cached --name-only f2ed90f8932e9525f41006420f55943f1fb1a8d2 | grep "syncity/scripts/" --color=never); do
	b=${f##*/}
	b=${b%.*}
	ofn=cl/head/$b.cl
	echo "*** Compliling $b to head cl..."
	
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
	
	git ls-files --error-unmatch $ofn > /dev/null 2>&1
	RT=$?
	
	if [ "$RT" -ne "0" ] ; then
		git add $ofn
	fi
	
	git commit $ofn -m "auto head file"
done

exit 0
