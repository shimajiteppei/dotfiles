__dotfiles_widget_name=mise


##
## env (envs must be loaded in main thread)
##
path=($path
    
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
    if ! command -v mise >/dev/null; then
        cargo binstall --no-confirm --disable-telemetry mise
        mise use -g usage
    fi

    ##
    ## init
    ##
    if command -v mise >/dev/null; then
        __dotfiles_eval-cache mise activate zsh
        __dotfiles_eval-cache mise completion zsh
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
}


##
## test
##
"__dotfiles_widget-test-${__dotfiles_widget_name}"() {
    command -v mise
    mise --version
}


unset __dotfiles_widget_name
