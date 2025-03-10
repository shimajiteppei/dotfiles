__DOTFILES_OS_NAME=ubuntu


##
## env (envs must be loaded in main thread)
##
path=(
    $path
    /snap/bin
    $HOME/.local/bin
)
typeset -U path PATH
export PATH


##
## extra widgets
##
__DOTFILES_WIDGET_LIST=($__DOTFILES_WIDGET_LIST
    docker
)


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
    sudo apt update
    sudo apt upgrade -y
    sudo snap refresh
    flatpak update -y
}


unset __DOTFILES_OS_NAME
