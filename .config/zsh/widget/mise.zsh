__dotfiles_widget_name=mise


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
"__dotfiles_widget-init-${__dotfiles_widget_name}"() {
    ##
    ## install
    ##
    if ! command -v mise >/dev/null; then
        curl https://mise.run | sh
    fi

    ##
    ## init
    ##
    if command -v mise >/dev/null; then
        eval "$(mise activate zsh)"
    fi
}


##
## update
##
"__dotfiles_widget-update-${__dotfiles_widget_name}"() {
}


##
## clean
##
"__dotfiles_widget-clean-${__dotfiles_widget_name}"() {
}


unset __dotfiles_widget_name
