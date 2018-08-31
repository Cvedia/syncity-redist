#!/bin/bash

if [ "$USER" != "root" ] ; then
	echo "WARNING: You should run this script as root"
fi

cd ../../..

# check if python3 is install and contains pip module
python3 -c "import pip" 2> /dev/null
RT=$?

if [ "$RT" -ne "0" ] ; then
	echo It looks like you don\'t have python3 and / or pip installed, running apt-get...
	apt-get install python3 python3-pip -y
fi

echo Installing required modules...
python3 -m pip install -r requeriments.txt

RT=$?
if [ "$RT" -ne "0" ] ; then
	echo [$RT] Something went wrong, please check your logs
else
	echo Done!
fi
