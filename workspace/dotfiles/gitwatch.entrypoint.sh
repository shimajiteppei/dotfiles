#!/usr/bin/env sh
set -eux

# init git config for docker container
cd /app/archive
git config user.name "shimajiteppei"
git config user.email "shimajiteppei@gmail.com"

# run gitwatch
/app/gitwatch.sh -s 2 -d '+%Y-%m-%d %H:%M:%S' -f /app/archive

# infinite sleep
tail -f /dev/null
