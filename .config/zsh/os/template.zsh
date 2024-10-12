__DOTFILES_OS_NAME=template


##
## env (envs must be loaded in main thread)
##
path=($path
    
)
typeset -U path PATH
export PATH


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
