#!/usr/bin/env sh
set -ex

__dotfiles_test_vm=dotfile-test
__dotfiles_test_vm_snapshot="$__dotfiles_test_vm-snapshot"

case "$1" in
	clear)
		# clear vm
        multipass delete $__dotfiles_test_vm
        multipass purge
		;;
	*)
        # init vm
        if multipass list --snapshots | grep "$__dotfiles_test_vm_snapshot"; then
            multipass stop $__dotfiles_test_vm
            multipass restore --destructive $__dotfiles_test_vm.$__dotfiles_test_vm_snapshot
        else
            multipass launch --name $__dotfiles_test_vm --cpus 4 --disk 10G --memory 4G --mount $HOME:/home/ubuntu/Home 24.04
            multipass stop $__dotfiles_test_vm
            multipass snapshot $__dotfiles_test_vm --name $__dotfiles_test_vm_snapshot
        fi    

        # run test
        multipass start $__dotfiles_test_vm
        multipass exec $__dotfiles_test_vm -- /bin/bash -c 'DOTFILES_INSTALLER_MODE=test_local sh /home/ubuntu/Home/workspace/dotfiles/install.sh'
		;;
esac

# exit
set +ex
exit 0
