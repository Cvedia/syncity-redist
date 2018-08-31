#!/bin/bash
echo "Creating / updating hooks..."

cd $(dirname "$0")
cd ../.git/hooks

RT="$?"
if [ "$RT" -eq "1" ] ; then
	echo "Couldnt chdir to ../.git/hooks, aborting!"
	exit 6
fi

rm -fv pre-push
ln -vs ../../git_hooks/pre-push.sh pre-push

echo "Done"
