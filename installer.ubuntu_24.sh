#!/usr/bin/env sh

# Linux
# multipass launch --name primary --cpus 1 --disk 10G --memory 2G && multipass stop primary && multipass snapshot primary
# multipass start primary && multipass exec primary -- /bin/bash -c 'sh /home/ubuntu/Home/installer.ubuntu_24.sh'
# multipass stop primary && multipass restore primary.snapshot1 
# multipass delete primary && multipass purge

sudo apt install -y curl git bash zsh build-essential pkg-config libssl-dev zip unzip

if ./installer.sh; then
    echo 'installation success'
else
    echo 'installation failed'
    exit 1
fi
