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


unset __dotfiles_widget_name
