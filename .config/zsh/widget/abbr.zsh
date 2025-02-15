__DOTFILES_WIDGET_NAME=abbr


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## init abbr
    ##
    abbr clear-session
    # there may have been a breaking change in v6
    local __ABBR_MAJOR_VERSION=$(abbr --version | awk '{print $3}' | awk -F. '{print $1}')
    if [[ $__ABBR_MAJOR_VERSION -ge 6 ]]; then
        alias() {
            abbr --session --regular --quieter --force $@
            abbr --session --global --quieter --force $@
        }
    else
        alias() {
            abbr --session --global --quieter --force $@
        }
    fi
    unset __ABBR_MAJOR_VERSION


    ##
    ## set alias
    ##
    alias history="history 0"
    alias grep='grep --color=auto'
    alias ll='ls -lahF --color'
    alias cp='cp -i'
    alias mv='mv -i'
    alias rm='rm -i'
    alias mkdir='mkdir -p'

    alias g='git'
    # to avoid running ghostscript by type error
    alias gs='git status --short'
    # https://zsh-abbr.olets.dev/commands.html#git
    alias 'git s'='git status --short'
    alias 'git ap'='git add -p'
    alias 'git b'='git branch'
    alias 'git cm'='git commit -m'
    alias 'git ch'='git checkout'
    alias 'git re'='git reset'
    # disable switch/restore
    alias 'git switch'='git checkout'
    alias 'git restore'='git reset'
    # override
    alias 'git clone'='git clone --recurse-submodules'
    alias 'git config'='git config --local'
    alias 'git pull'='git fetch --all --tags --prune --prune-tags && git pull --rebase --autostash'


    ##
    ## add highlight settings
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
        if [[ ! -x $(command -v $word) ]] && [[ ! -n $FAST_HIGHLIGHT["chroma-$word"] ]]; then
            FAST_HIGHLIGHT+=( "chroma-$word" chroma_single_word )
        fi
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
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
}


unset __DOTFILES_WIDGET_NAME
