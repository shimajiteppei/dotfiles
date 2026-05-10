__dotfiles_widget_name=delta


##
## init
##
"__dotfiles_widget-init-${__dotfiles_widget_name}"() {
    ##
    ## install
    ##
    if ! command -v delta >/dev/null; then
        cargo binstall --no-confirm --disable-telemetry git-delta
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
    command -v delta
    delta --version
}


unset __dotfiles_widget_name
