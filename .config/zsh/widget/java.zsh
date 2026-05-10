__dotfiles_widget_name=java


##
## env (envs must be loaded in main thread)
##
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"


##
## init
##
"__dotfiles_widget-init-${__dotfiles_widget_name}"() {
    ##
    ## install
    ##
    if ! [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
        curl -s "https://get.sdkman.io?rcupdate=false" | bash
    fi

    ##
    ## init
    ##
    if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
        source "$SDKMAN_DIR/bin/sdkman-init.sh"
    fi
}


##
## update
##
"__dotfiles_widget-update-${__dotfiles_widget_name}"() {
    if command -v sdk >/dev/null; then
        sdk selfupdate
    fi
}


##
## clean
##
"__dotfiles_widget-clean-${__dotfiles_widget_name}"() {
    if command -v sdk >/dev/null; then
        sdk flush
    fi
}


##
## test
##
"__dotfiles_widget-test-${__dotfiles_widget_name}"() {
    command -v sdk
    sdk version
}


unset __dotfiles_widget_name
