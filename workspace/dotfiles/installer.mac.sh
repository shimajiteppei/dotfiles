#!/usr/bin/env sh

brew install curl git cmake coreutils bash

cd $(dirname $0)

EXIT_CODE_FILE="installer_result"
LOG_FILE="installer.log"
( ./installer.sh; echo $? >&3 ) 3>$EXIT_CODE_FILE 2>&1 | tee "$LOG_FILE"
EXIT_CODE=$(cat $EXIT_CODE_FILE)
rm "$EXIT_CODE_FILE"

if test ${EXIT_CODE:-1} -eq 0; then
    echo 'installation success'
    exit 0
else
    echo 'installation failed'
    exit 1
fi
