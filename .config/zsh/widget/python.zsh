__dotfiles_widget_name=python


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
"__dotfiles_widget-init-${__dotfiles_widget_name}"() {
    ##
    ## install
    ##
    if ! command -v uv >/dev/null; then
        curl -LsSf https://astral.sh/uv/install.sh | sh
        uv python install
    fi

    ##
    ## init
    ##
    if command -v uv >/dev/null; then
        __dotfiles_eval-cache 'uv generate-shell-completion zsh'
    fi

    ##
    ## create global venv
    ##
    if ! [[ -s "$XDG_DATA_HOME/uv-venv" ]]; then
        uv venv "$XDG_DATA_HOME/uv-venv"
    fi
}


##
## update
##
"__dotfiles_widget-update-${__dotfiles_widget_name}"() {
    if command -v uv >/dev/null; then
        uv self update
        uv tool upgrade --all
        uv python upgrade
    fi
}


##
## clean
##
"__dotfiles_widget-clean-${__dotfiles_widget_name}"() {
}


##
## test
##
"__dotfiles_widget-test-${__dotfiles_widget_name}"() {
    command -v uv
    uv --version
}


unset __dotfiles_widget_name
