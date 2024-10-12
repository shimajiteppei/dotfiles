__DOTFILES_WIDGET_NAME=navi


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## env
    ##
    export NAVI_PATH="$XDG_DATA_HOME/navi"
    path=($path
      $XDG_DATA_HOME/fzf/bin
    )
    typeset -U path PATH
    export PATH

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

    ##
    ## alias
    ##
    # fast-syntax-highlighting highlighting of abbreviations (https://github.com/olets/zsh-abbr/issues/24)
    chroma_single_word() {
        (( next_word = 2 | 8192 ))

        local __first_call="$1" __wrd="$2" __start_pos="$3" __end_pos="$4"
        local __style

        (( __first_call )) && { __style=${FAST_THEME_NAME}alias }
        [[ -n "$__style" ]] && (( __start=__start_pos-${#PREBUFFER}, __end=__end_pos-${#PREBUFFER}, __start >= 0 )) && reply+=("$__start $__end ${FAST_HIGHLIGHT_STYLES[$__style]}")

        (( this_word = next_word ))
        _start_pos=$_end_pos

        return 0
    }

    # register single word command execpt for the followings:
    # - already in PATH
    # - already in fast-syntax-highlighting chroma map
    register_single_word_chroma() {
        local word=$1
        if [[ -x $(command -v $word) ]] || [[ -n $FAST_HIGHLIGHT["chroma-$word"] ]]; then
            return 1
        fi

        FAST_HIGHLIGHT+=( "chroma-$word" chroma_single_word )
        return 0
    }

    if [[ -n $FAST_HIGHLIGHT ]]; then
        for abbr in ${(f)"$(abbr list-abbreviations)"}; do
            if [[ $abbr != *' '* ]]; then
                register_single_word_chroma ${(Q)abbr}
            fi
        done
    fi

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
