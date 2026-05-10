__dotfiles_os_name=macos


##
## env (envs must be loaded in main thread)
##
path=($path
    $HOME/.local/bin
    $HOME/.rd/bin
    $(brew --prefix coreutils)/libexec/gnubin
)
typeset -U path PATH
export PATH


##
## extra widgets
##
__dotfiles_widget_list=($__dotfiles_widget_list
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
    brew upgrade
}


unset __dotfiles_os_name
