#!/usr/bin/env sh

set -eux

cd $HOME

#######################################################
# usage: .ssh/init.sh <name> <type>
# example: .ssh/init.sh github ed25519
#######################################################
NAME="$1"
TYPE="$2"

USER_NAME=$(id -un)
USER_GROUP=$(id -gn)
EMAIL=$(git config user.email)

SSH_DIR="/opt/ssh"
KEY_PATH="$SSH_DIR/${NAME}_${TYPE}"

# ensure home dir config
chmod 400 $HOME/.ssh/config

# ensure ssh dir
if [ ! -d "$SSH_DIR" ]; then
    sudo mkdir -p "$SSH_DIR"
    sudo chown "$USER_NAME:$USER_GROUP" "$SSH_DIR"
    chmod 700 "$SSH_DIR"
fi

# create ssh key
if [ ! -f "$KEY_PATH" ]; then
    ssh-keygen -t "$TYPE" -C "$EMAIL" -f "$KEY_PATH" -N ""
    chmod 400 "$KEY_PATH"
fi
