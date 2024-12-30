__DOTFILES_WIDGET_NAME=delta


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## install
    ##
    command -v delta >/dev/null || cargo install git-delta
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
