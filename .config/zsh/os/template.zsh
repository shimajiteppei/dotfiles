__dotfiles_os_name=template


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
"__dotfiles_os-init-${__dotfiles_os_name}"() {
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
"__dotfiles_os-update-${__dotfiles_os_name}"() {
}


unset __dotfiles_os_name
