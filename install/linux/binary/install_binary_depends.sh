#!/bin/bash

if [ "$EUID" -ne "0" ]; then
	echo "You must run this script as root."
	exit 1
fi

read -n 1 -s -r -p "This script will install the required dependencies for syncity, this is intended for ubuntu-based systems and will require internet access to download the required packages.

Press any key to continue or CTRL+C to abort..."

echo "Installing dependencies..."

apt-get update && apt-get install build-essential libxmu-dev libxi-dev libgl-dev libosmesa-dev libopencv-dev wget sqlite3 -y
RT=$?
if [ "$RT" -ne "0" ] ; then
	echo "Failed, aborting!"
fi

hasGLEW=`ldconfig -p | grep libGLEW.so.2.1`

if [ -z "$hasGLEW" ] ; then
	echo "Downloading GLEW ..."

	export GLEW_DEST=/usr/local
	mkdir /tmp/glew && cd /tmp/glew && wget https://sourceforge.net/projects/glew/files/glew/2.1.0/glew-2.1.0.zip/download -O glew-2.1.0.zip
	RT=$?
	if [ "$RT" -ne "0" ] ; then
		echo "Failed, mirror down? Aborting!"
	fi
	
	echo "Building GLEW ..."
	
	unzip glew-2.1.0.zip && \
		cd glew-2.1.0 && \
		make -j32 && \
		make install && \
		make clean && \
		cd /tmp && \
		rm -fr glew && \
		echo "/usr/local/lib64" >> /etc/ld.so.conf.d/x86_64-linux-gnu.conf && \
		ldconfig
	RT=$?
	if [ "$RT" -ne "0" ] ; then
		echo "Failed, compliling libGLEW!"
	fi
else
	echo "Looks like you already have libGLEW 2.1, skipping install"
fi

echo "Completed"

exit
