__dotfiles_widget_name=gitwatch


##
## init
##
"__dotfiles_widget-init-${__dotfiles_widget_name}"() {
    if ! docker inspect -f '{{.State.Running}}' dotfiles-gitwatch; then
        ${HOME}/workspace/dotfiles/gitwatch.sh start
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
    if docker inspect -f '{{.State.Running}}' dotfiles-gitwatch; then
        ${HOME}/workspace/dotfiles/gitwatch.sh down
    fi
}


unset __dotfiles_widget_name
