__dotfiles_widget_name=docker


##
## init
##
"__dotfiles_widget-init-${__dotfiles_widget_name}"() {
    if ! command -v docker >/dev/null; then
        curl -fsSL https://get.docker.com | sudo sh
        sudo usermod -aG docker $USER
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
    if command -v docker >/dev/null; then
        docker system prune --force --volumes --all
    fi
}


##
## test
##
"__dotfiles_widget-test-${__dotfiles_widget_name}"() {
    command -v docker
    docker --version
}


unset __dotfiles_widget_name
