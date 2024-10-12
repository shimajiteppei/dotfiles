__DOTFILES_WIDGET_NAME=docker


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
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
    docker system prune --volumes --all
}


unset __DOTFILES_WIDGET_NAME
