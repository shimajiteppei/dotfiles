__DOTFILES_WIDGET_NAME=python


##
## env (envs must be loaded in main thread)
##
export PIP_REQUIRE_VIRTUALENV=true


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## install
    ##
    command -v uv >/dev/null || cargo install --git https://github.com/astral-sh/uv uv

    ##
    ## init
    ##
    eval "$(uv generate-shell-completion zsh)"
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
