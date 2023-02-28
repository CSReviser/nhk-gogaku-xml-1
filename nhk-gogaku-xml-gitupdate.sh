#!/bin/sh

cd /path_to/nhk-gogaku-xml || exit;

git pull origin master

test -f xml-wget.sh && sh xml-wget.sh || echo "File doesn't exists"

git add -A

# Set the date of Monday of this week
# FreeBSD
git commit -am "`date -v-sun -v+1d +'%Y-%m-%d'` Updated files"
# Linux GNU coreutils
# git commit -am "`date -d 'last sunday + 1 day' +'%Y-%m-%d'` Updated files"

git push -u origin master
