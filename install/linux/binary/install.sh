#!/bin/bash
# Copyright (c) 2016-2018 CVEDIA PVE Ltd - www.cvedia.com
#

echo This script will install dependencies to run syncity simulator.
echo It might download large amounts of data depending on what you need to install.
echo This is intended to be used in ubuntu 16.04 or 18.04. 18 is desired since all
echo dependencies are available via the package manager.
echo Press enter to continue or CTRL+C to abort...

read

if [ "$USER" != "root" ] ; then
	echo "ERROR: You must run this script as root"
	exit 1;
fi

UDISTRO=$(lsb_release -r | tr $'\n' ' ' | rev | cut -d$'\t' -f1 | rev | cut -d'.' -f1)
UDISTRO_FULL=$(lsb_release -r | tr $'\n' ' ' | rev | cut -d$'\t' -f1 | rev | cut -d' ' -f1)
UNAME=$(lsb_release -i | rev | cut -d$'\t' -f1 | rev)

if [ "$UNAME" != "Ubuntu" ] ; then
	echo "Unsupported linux distro."
	exit 1
fi

if [ "$UDISTRO_FULL" = "18.10" ] ; then
	# TODO: Build ffmpeg from source
	# TODO: Build opencv from source - lapacke issue, stdio issue
	# TODO: Resolve old library conflicts
	echo "Ubuntu 18.10 is not supported."
	exit 1
fi

if [ "$UDISTRO" != "16" -a "$UDISTRO" != "18" ]; then
	echo "Unknown Ubuntu distro, aborting"
	exit 1
else
	echo "Detected Ubuntu $UDISTRO"
fi

echo "Installing common dependencies..."
apt-key adv --keyserver keyserver.ubuntu.com --recv B6391CB2CFBA643D && \
	apt-add-repository "deb http://zeroc.com/download/Ice/3.7/ubuntu$UDISTRO.04 stable main" && \
	apt update && \
	apt install wget libstdc++6 unzip libtbb-dev libomp-dev libssl-dev libcpprest-dev zeroc-ice-all-runtime zeroc-ice-all-dev libzeroc-freeze-dev zeroc-freeze-utils python3 libgtk2.0 build-essential g++ autotools-dev libicu-dev build-essential libbz2-dev -y

_RT=$?
if [ "$_RT" -ne "0" ] ; then
	echo "Failed installing dependencies, aborting"
	exit 1
fi

# TODO: Check if this is needed on 16
apt-get install libvulkan1 -y

echo "Checking opencv3.2.0..."
ldconfig -v | grep opencv | grep 3.2.0 > /dev/null 2>&1
_RT=$?
if [ "$_RT" -ne "0" ] ; then
	echo "Installing OpenCV 3.2.0..."
	
	if [ "$UDISTRO" = "18" ]; then
		apt install build-essential cmake git pkg-config unzip ffmpeg qtbase5-dev libtiff-dev libpng-dev python-dev python3-dev python-numpy python3-numpy libopencv-dev libgtk-3-dev libx264-dev libatlas-base-dev gfortran libdc1394-22 libdc1394-22-dev libjpeg-dev libtiff5-dev libavcodec-dev libavformat-dev libswscale-dev libxine2-dev  libv4l-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev v4l-utils liblapacke-dev libopenblas-dev checkinstall libgdal-dev -y
	else
		apt install build-essential cmake git pkg-config unzip ffmpeg qtbase5-dev python-dev python3-dev python-numpy python3-numpy libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev v4l-utils liblapacke-dev libopenblas-dev checkinstall libgdal-dev -y
	fi
	
	_RT=$?
	if [ "$_RT" -ne "0" ] ; then
		echo "Failed install dependencies for OpenCV, aborting"
		exit 1;
	fi
	
	cd /opt && \
		wget https://github.com/opencv/opencv/archive/3.2.0.zip && \
		unzip 3.2.0.zip && \
		cd opencv-3.2.0/ && \
		mkdir build && \
		cd build/ && \
		cmake -D BUILD_TIFF=ON -D WITH_CUDA=OFF -D ENABLE_AVX=OFF -D WITH_LAPACK=OFF -D WITH_OPENGL=OFF -D WITH_OPENCL=OFF -D WITH_IPP=OFF -D WITH_TBB=ON -D BUILD_TBB=ON -D WITH_EIGEN=OFF -D WITH_V4L=OFF -D WITH_VTK=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -DENABLE_PRECOMPILED_HEADERS=OFF -D WITH_QT=ON .. && \
		make -j $(($(nproc) + 1)) && \
		make install && \
		echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
	_RT=$?
	
	if [ "$_RT" -ne "0" ] ; then
		echo "Failed building OpenCV, aborting"
		exit 1;
	else
		cd /opt
		echo "Cleanup ..."
		rm -fr /opt/3.2.0.zip /opt/opencv-3.2.0
	fi
fi

echo "Checking glibc..."
strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep CXXABI_1.3.11 > /dev/null 2>&1
_RT=$?

if [ "$_RT" -ne "0" ] ; then
	echo "Installing new PPA..."
	add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
		apt-get update && \
		apt-get install libstdc++6 -y
	
	_RT=$?
	if [ "$_RT" -ne "0" ] ; then
		echo "Failing install libstdc++6, aborting"
		exit 1
	fi
fi

echo "Trying to install boost via package manager..."
apt install libboost-all-dev=1.65.1.0ubuntu1 -y
_RT=$?

if [ "$_RT" -eq "0" ] ; then
	echo "Boost sucessfully installed"
else
	echo "There is no libboost-1.65.1.0ubuntu1 available for your linux distribution via apt."
	read -n 1 -p "Would you like to download and build it locally? (Y/n) " ans;
	
	case $ans in
		y|Y)
			echo "Building boost 1.65.1, this might take a while..."
			cd /opt && \
				wget https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz && \
				tar -xzvf boost_1_65_1.tar.gz && \
				cd boost_1_65_1 && \
				./bootstrap.sh --prefix=/usr/local && \
				./b2 && \
				./b2 install
			
			ldconfig -v | grep libboost | grep 1.65.1 > /dev/null 2>&1
			
			cd /opt
			rm -fr boost_1_65_1.tar.gz boost_1_65_1
			
			;;
		*)
			echo "Syncity will not work without the proper boost version installed, setup will now exit."
			exit 1; ;;
	esac
fi

echo "Completed"
exit 0
