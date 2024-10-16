__DOTFILES_OS_NAME=macos


##
## env (envs must be loaded in main thread)
##


##
## init
##
"__dotfiles_os-init-${__DOTFILES_OS_NAME}"() {
    ##
    ## init
    ##
    export EDITOR=nano
    export VISUAL=nano
}


##
## update
##
"__dotfiles_os-update-${__DOTFILES_OS_NAME}"() {
    brew upgrade
}


unset __DOTFILES_OS_NAME
