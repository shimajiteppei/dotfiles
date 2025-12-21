__DOTFILES_WIDGET_NAME=gitwatch


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    docker inspect -f '{{.State.Running}}' dotfiles-gitwatch || ${HOME}/workspace/dotfiles/gitwatch.sh start
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
    docker inspect -f '{{.State.Running}}' dotfiles-gitwatch && ${HOME}/workspace/dotfiles/gitwatch.sh down
}


unset __DOTFILES_WIDGET_NAME
