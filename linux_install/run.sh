#!/bin/bash

SOP=/usr/local/lib64:`pwd`/syncity_Data/Plugins/:`pwd`/syncity_Data/Plugins/x86_64

if [ -n "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SOP
else
  LD_LIBRARY_PATH=$SOP
fi

export LD_LIBRARY_PATH

echo "Running SynCity..."
./syncity -logFile output_log.txt -screen-quality Fantastic -screen-fullscreen
RT=$?
if [ "$RT" -ne "0" ] ; then
	echo "Unclean exit, you might want to look into the log files."
else
	echo "Clean exit!"
fi
