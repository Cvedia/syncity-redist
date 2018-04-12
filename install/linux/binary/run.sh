#!/bin/bash

SOP=/usr/local/lib64:`pwd`/syncity_Data/Plugins/:`pwd`/syncity_Data/Plugins/x86_64

if [ -n "$LD_LIBRARY_PATH" ]; then
  SOP=$LD_LIBRARY_PATH:$SOP
fi

echo "Running SynCity..."
LD_LIBRARY_PATH=$SOP ./syncity -logFile output_log.txt -screen-quality Fantastic -screen-fullscreen
RT=$?
if [ "$RT" -ne "0" ] ; then
	echo "Unclean exit, you might want to look into the log files."
else
	echo "Clean exit!"
fi
