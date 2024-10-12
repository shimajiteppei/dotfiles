__DOTFILES_WIDGET_NAME=rust


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## env
    ##
    path=($path
        $HOME/.cargo/bin
    )
    typeset -U path PATH
    export PATH

    ##
    ## install
    ##
    command -v cargo >/dev/null || (curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y)
    command -v cargo-install-update >/dev/null || cargo install cargo-update
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
    command -v rustup >/dev/null && rustup update
    command -v cargo-install-update >/dev/null && cargo install-update --all
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
}


unset __DOTFILES_WIDGET_NAME
