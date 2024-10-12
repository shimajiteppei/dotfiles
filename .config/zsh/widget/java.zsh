__DOTFILES_WIDGET_NAME=java


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## env
    ##
    export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"

    ##
    ## install
    ##
    [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] || (curl -s "https://get.sdkman.io" | bash)

    ##
    ## init
    ##
    [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
    command -v sdk >/dev/null && sdk selfupdate
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
    sdk flush
}


unset __DOTFILES_WIDGET_NAME
