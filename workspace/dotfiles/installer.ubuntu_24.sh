#!/usr/bin/env sh

sudo apt install -y curl git bash zsh build-essential cmake pkg-config libssl-dev zip unzip

cd $(dirname $0)
if ./installer.sh; then
    echo 'installation success'
else
    echo 'installation failed'
    exit 1
fi
