__dotfiles_os_name=ubuntu


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
__dotfiles_widget_list=($__dotfiles_widget_list
    docker
)


##
## init
##
"__dotfiles_os-init-${__dotfiles_os_name}"() {
    ##
    ## init
    ##
    export EDITOR=nano
    export VISUAL=nano
}


##
## update
##
"__dotfiles_os-update-${__dotfiles_os_name}"() {
    sudo apt update
    sudo apt upgrade -y
    sudo snap refresh
    flatpak update -y
}


unset __dotfiles_os_name
