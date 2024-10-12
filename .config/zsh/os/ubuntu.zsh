__DOTFILES_OS_NAME=ubuntu


##
## env
##
"__dotfiles_os-env-${__DOTFILES_OS_NAME}"() {
    path=(
        $path
        /snap/bin
        $HOME/.local/bin
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
    export EDITOR=nano
    export VISUAL=nano

    ##
    ## alias
    ##
    alias rm='mv -t $XDG_DATA_HOME/Trash/files/'
}


##
## update
##
"__dotfiles_os-update-${__DOTFILES_OS_NAME}"() {
    sudo apt update
    sudo apt upgrade -y
    sudo snap refresh
}


unset __DOTFILES_OS_NAME
