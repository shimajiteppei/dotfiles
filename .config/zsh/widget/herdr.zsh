__dotfiles_widget_name=herdr


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
    if ! command -v herdr >/dev/null; then
        cargo binstall --no-confirm --disable-telemetry herdr
        mkdir -p "$HOME/.local/bin"
        ln -sfn "$(which herdr)" "$HOME/.local/bin/herdr"
    fi

    ##
    ## init
    ##
    # register herdr toggle keybinding
    if [[ ${HERDR_ENV:-0} > 0 ]]; then
        __dotfiles_herdr-noop() {
        }
        zle -N __dotfiles_herdr-noop
        bindkey '^H' __dotfiles_herdr-noop
    else
        __dotfiles_herdr-toggle() {
            zle -I
            herdr </dev/tty >/dev/tty 2>/dev/tty
            zle reset-prompt
        }
        zle -N __dotfiles_herdr-toggle
        bindkey '^H' __dotfiles_herdr-toggle
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
}


unset __dotfiles_widget_name
