__DOTFILES_WIDGET_NAME=nodejs


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
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## install
    ##
    command -v vp >/dev/null || { curl -fsSL https://vite.plus | bash ;}
    command -v vp >/dev/null || vp env on
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
    command -v vp >/dev/null && vp upgrade
    command -v vp >/dev/null && vp update --global
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
    command -v vp >/dev/null && vp implode
}


unset __DOTFILES_WIDGET_NAME
