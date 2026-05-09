__DOTFILES_WIDGET_NAME=docker


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    command -v docker >/dev/null || {
        curl -fsSL https://get.docker.com | sudo sh;
        sudo usermod -aG docker $USER;
    }
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
