__dotfiles_core-init() {
    source $ZDOTDIR/core/zinit.zsh
    source $ZDOTDIR/core/history.zsh
    source $ZDOTDIR/core/completion.zsh
    source $ZDOTDIR/core/alias.zsh
}

__dotfiles_core-update() {
    cd $HOME
    git submodule update --recursive
    cd -

    zinit self-update
    zinit update
}
