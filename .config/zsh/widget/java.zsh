__DOTFILES_WIDGET_NAME=java


##
## env (envs must be loaded in main thread)
##
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## install
    ##
    [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] || (curl -s "https://get.sdkman.io?rcupdate=false" | bash)

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
