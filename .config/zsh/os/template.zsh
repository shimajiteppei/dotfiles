__DOTFILES_OS_NAME=template


##
## env
##
"__dotfiles_os-env-${__DOTFILES_OS_NAME}"() {
    path=($path
    
    )
    typeset -U path PATH
    export PATH
}


##
## init
##
"__dotfiles_os-init-${__DOTFILES_OS_NAME}"() {
    ##
    ## init
    ##

    ##
    ## alias
    ##
}


##
## update
##
"__dotfiles_os-update-${__DOTFILES_OS_NAME}"() {
}


unset __DOTFILES_OS_NAME
