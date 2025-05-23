#!/usr/bin/env sh
set -ex

__DOTFILES_TEST_VM=dotfile-test
__DOTFILES_TEST_VM_SNAPSHOT="$__DOTFILES_TEST_VM-snapshot"

if test "$1" = "clear"; then
    # clear vm
    multipass delete $__DOTFILES_TEST_VM && multipass purge
else
    # init vm
    if multipass list --snapshots | grep "$__DOTFILES_TEST_VM_SNAPSHOT"; then
        multipass stop $__DOTFILES_TEST_VM
        multipass restore --destructive $__DOTFILES_TEST_VM.$__DOTFILES_TEST_VM_SNAPSHOT
    else
        multipass launch --name $__DOTFILES_TEST_VM --cpus 4 --disk 10G --memory 4G --mount $HOME:/home/ubuntu/Home 24.04
        multipass stop $__DOTFILES_TEST_VM
        multipass snapshot $__DOTFILES_TEST_VM --name $__DOTFILES_TEST_VM_SNAPSHOT
    fi    

    # run test
    multipass start $__DOTFILES_TEST_VM
    multipass exec $__DOTFILES_TEST_VM -- /bin/bash -c 'export __DOTFILES_MODE=test; sh /home/ubuntu/Home/workspace/dotfiles/installer.ubuntu_24.sh'
fi

# exit
set +ex
exit 0
