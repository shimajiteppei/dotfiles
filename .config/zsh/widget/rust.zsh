__dotfiles_widget_name=rust


##
## env (envs must be loaded in main thread)
##
export BINSTALL_DISABLE_TELEMETRY=true
path=($path
    $HOME/.cargo/bin
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
    if ! command -v cargo >/dev/null; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    fi
        if ! command -v cargo-binstall >/dev/null; then
        curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
    fi
    if ! command -v cargo-install-update >/dev/null; then
        cargo binstall --no-confirm --disable-telemetry cargo-update
    fi
}


##
## update
##
"__dotfiles_widget-update-${__dotfiles_widget_name}"() {
    if command -v rustup >/dev/null; then
        rustup update
    fi
    if command -v cargo-install-update >/dev/null; then
        cargo install-update --all
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
    command -v cargo
    cargo --version
}


unset __dotfiles_widget_name
