__DOTFILES_WIDGET_NAME=navi


##
## env (envs must be loaded in main thread)
##
export NAVI_PATH="$XDG_CONFIG_HOME/navi"
path=($path
    $XDG_DATA_HOME/fzf/bin
)
typeset -U path PATH
export PATH


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## install
    ##
    [[ -s "$XDG_DATA_HOME/fzf/bin/fzf" ]] || $XDG_DATA_HOME/fzf/install --bin
    command -v navi >/dev/null || cargo install navi

    ##
    ## init
    ##
    source "$XDG_DATA_HOME/fzf/shell/completion.zsh"
    # open navi with Ctrl + G
    eval "$(navi widget zsh)"
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
    [[ -s "$XDG_DATA_HOME/fzf/bin/fzf" ]] && $XDG_DATA_HOME/fzf/install --bin
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
}


unset __DOTFILES_WIDGET_NAME
