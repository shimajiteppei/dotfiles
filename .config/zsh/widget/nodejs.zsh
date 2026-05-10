__dotfiles_widget_name=nodejs


##
## env (envs must be loaded in main thread)
##
export VITE_PLUS_HOME="$HOME/.vite-plus"
path=($path
    $VITE_PLUS_HOME/bin
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
    if ! command -v vp >/dev/null; then
        curl -fsSL https://vite.plus | bash
        vp env on
        vp env install lts
    fi
}


##
## update
##
"__dotfiles_widget-update-${__dotfiles_widget_name}"() {
    if command -v vp >/dev/null; then
        vp upgrade
        vp update --global
    fi
}


##
## clean
##
"__dotfiles_widget-clean-${__dotfiles_widget_name}"() {
    if command -v vp >/dev/null; then
        vp implode
    fi
}


unset __dotfiles_widget_name
