__DOTFILES_WIDGET_NAME=python


##
## env (envs must be loaded in main thread)
##
export PIP_REQUIRE_VIRTUALENV=true
# override global python by uv venv
path=(
    $XDG_DATA_HOME/uv-venv/bin
    $path
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
    command -v uv >/dev/null || { curl -LsSf https://astral.sh/uv/install.sh | sh ;}

    ##
    ## init
    ##
    command -v uv >/dev/null && eval "$(uv generate-shell-completion zsh)"

    ##
    ## create global venv
    ##
    [[ -s "$XDG_DATA_HOME/uv-venv" ]] || uv venv "$XDG_DATA_HOME/uv-venv"
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
    command -v uv >/dev/null || uv self update
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
}


unset __DOTFILES_WIDGET_NAME
