__dotfiles_core-init() {
    ##
    ## init zinit
    ## https://zdharma-continuum.github.io/zinit/wiki/
    ##
    source "$XDG_DATA_HOME/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    zinit light-mode for \
        romkatv/powerlevel10k \
        romkatv/zsh-defer \
        zdharma-continuum/fast-syntax-highlighting \
        olets/zsh-abbr

    zinit ice atclone"./install --all" atpull"%atclone" pick"bin/fzf" as"program"
    zinit light junegunn/fzf

    ##
    ## load scripts
    ##
    # do not use p10k instant prompt
    source $ZDOTDIR/core/p10k.zsh
    source $ZDOTDIR/core/tweaks.zsh

    export FZF_CTRL_R_OPTS="
        --border=rounded \
        --layout=reverse \
        --height=15 \
        --prompt='history> ' \
        --preview 'echo {2..} | fold -s -w 80' \
        --preview-window=up:2 \
        "
    source <(fzf --zsh)
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
