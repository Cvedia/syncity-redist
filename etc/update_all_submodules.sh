#!/bin/bash

cd $(dirname "$0")
cd ..

git submodule update 
git submodule foreach git checkout master 
git submodule foreach git pull origin master

echo "Done"
