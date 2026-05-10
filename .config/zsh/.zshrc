##
## zsh profiling
##
[[ $__DOTFILES_DEBUG_MODE > 1 ]] && set -x
[[ $__DOTFILES_PROFILE_MODE > 0 ]] && zmodload zsh/zprof

##
## load scripts
##
source $ZDOTDIR/core/lib.zsh
source $ZDOTDIR/os/lib.zsh
source $ZDOTDIR/widget/lib.zsh
[[ $__DOTFILES_DEBUG_MODE > 1 ]] && echo $__dotfiles_os_type
[[ $__DOTFILES_DEBUG_MODE > 1 ]] && echo $__dotfiles_widget_list


##
## init
##
__dotfiles_core-init
__dotfiles_os-init
# defer loading widgets on interactive shell
if [[ $__DOTFILES_DEBUG_MODE > 0 ]]; then
    __dotfiles_widget-init
else
    zsh-defer __dotfiles_widget-init
fi

##
## define tasks
##
...update() {
    __dotfiles_os-update
    __dotfiles_core-update
    __dotfiles_widget-update
}

...clean() {
    __dotfiles_widget-clean
}

...edit() {
    code $HOME/.vscode/dotfiles.code-workspace
}


##
## post init hooks
##
# end zsh profiling
[[ $__DOTFILES_PROFILE_MODE > 0 ]] && zprof
# force return code
return 0
