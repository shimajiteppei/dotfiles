__dotfiles_core-init() {
    ##
    ## init zinit
    ##
    source "$XDG_DATA_HOME/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    zinit light-mode for \
        romkatv/powerlevel10k \
        zdharma-continuum/history-search-multi-word \
        zdharma-continuum/fast-syntax-highlighting \
        zsh-users/zsh-completions \
        olets/zsh-abbr

    ##
    ## load scripts
    ## do not use p10k instant prompt
    ##
    source $ZDOTDIR/core/p10k.zsh
    source $ZDOTDIR/core/history.zsh
    source $ZDOTDIR/core/completion.zsh
}

__dotfiles_core-update() {
    ##
    ## update source
    ##
    cd $HOME
    git submodule update --recursive
    cd -

    ##
    ## update plugins
    ##
    zinit self-update
    zinit update
}
