#!/usr/bin/env sh

brew install curl git cmake coreutils

cd $(dirname $0)
if ./installer.sh; then
    echo 'installation success'
else
    echo 'installation failed'
    exit 1
fi
