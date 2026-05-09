__DOTFILES_WIDGET_NAME=mise


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
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## install
    ##
    command -v mise >/dev/null || { curl https://mise.run | sh ;}

    ##
    ## init
    ##
    command -v mise >/dev/null && eval "$(mise activate zsh)"
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
}


unset __DOTFILES_WIDGET_NAME
