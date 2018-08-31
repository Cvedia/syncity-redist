#!/bin/bash

usage () {
	if [ -n "$*" ]; then
		message "usage error: $*"
	fi
	cat <<EOF
Usage: $PROGNAME [OPTION ...]

Basic options:
	-p, --path <path> working path
	-d, --debug Does a dry-run showing the actions to be performed
	--no-commit Changes the file but skips commiting.
EOF
}

ARGS=$(getopt --options +h,p:,d \
	--long help,path:,debug,no-commit \
	--name "$PROGNAME" -- "$@")
GETOPT_STATUS=$?

if [ $GETOPT_STATUS -ne 0 ]; then
	error "internal error; getopt exited with status $GETOPT_STATUS"
	exit 6
fi

eval set -- "$ARGS"

while :; do
	case "$1" in
		-p|--path) BASE_PATH="$2"; shift ;;
		-d|--debug) DEBUG="y"; ;;
		-h|--help) SHOWHELP="y"; ;;
		--no-commit) SKIPCOMMIT="y"; ;;
		--) shift; break ;;
		*) echo "Unknown option \"$1\" aborting"; exit 6 ;;
	esac
	shift
done

if [ -n "$SHOWHELP" ]; then
	usage
	exit 0
fi

if [ -n "$BASE_PATH" ]; then
	cd "$BASE_PATH"
fi

# get latest modified date of relevant scripts
NEW_VERSION=$(date -u +"%y.%m.%d.%H%M" -r $(ls -t1 --color=never syncity.py syncity/common.py syncity/helpers.py | head -n1))

# compare with version on syncity.py
CURRENT_VERSION=$(cat syncity.py | grep 'SYNCITY_VERSION' | head -n1 | grep -Po "'(.*?)'" | sed "s/'\([^']*\)'/\1/g")

if [ -n "$DEBUG" ]; then
	echo "Debug mode"
	if [ -n "$BASE_PATH" ]; then
		echo "Using base path: '$BASE_PATH'"
	fi
	
	echo "Current version: '$CURRENT_VERSION'"
	echo "New version: '$NEW_VERSION'"
	
	if [ "$NEW_VERSION" != "$CURRENT_VERSION" ]; then
		echo "Changes needed"
	else
		echo "No changes detected"
	fi
else
	if [ "$NEW_VERSION" != "$CURRENT_VERSION" ]; then
		echo "Updating version $CURRENT_VERSION to $NEW_VERSION..."
		
		# change the file and revert it's timestamp back
		
		OLD_TS=$(date -R -r syncity.py)
		sed -i -e "s/SYNCITY_VERSION = '$CURRENT_VERSION'/SYNCITY_VERSION = '$NEW_VERSION'/g" syncity.py
		touch -d "$OLD_TS" syncity.py
		
		if [ -z "$SKIPCOMMIT" ]; then
			git commit syncity.py -m "autoversion update"
		fi
	fi
fi
