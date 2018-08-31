#!/bin/bash
_BASE="$1"
rsync -av syncity "$_BASE"
rsync -av syncity.py "$_BASE"
rsync -av *.md "$_BASE"
rsync -av CHANGELOG "$_BASE"
rsync -av requeriments.txt "$_BASE"
rsync -av install "$_BASE" --exclude=*test*
rsync -av cl "$_BASE"
rsync -av etc "$_BASE" --exclude=*$(basename $0)
rsync -av cfg "$_BASE"
rsync -av layout "$_BASE"
