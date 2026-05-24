__dotfiles_cache_dir="$XDG_DATA_HOME/zsh/dotfiles"
mkdir -p "$__dotfiles_cache_dir"
fpath=("$__dotfiles_cache_dir" $fpath)
typeset -U fpath

__dotfiles_eval-cache() {
    local -a __dotfiles_command=("$@")
    local __dotfiles_cache_name="${(j:_:)__dotfiles_command}"
    __dotfiles_cache_name="${__dotfiles_cache_name//[^A-Za-z0-9._-]/_}"
    local __dotfiles_cache_file="$__dotfiles_cache_dir/$__dotfiles_cache_name"

    [[ -e "$__dotfiles_cache_file" ]] || "$@" > "$__dotfiles_cache_file"
    source "$__dotfiles_cache_file"
}

__dotfiles_zsh-defer() {
    if [[ $__dotfiles_zshrc_enable_parallel > 0 ]]; then
        zsh-defer "$@"
    else
        "$@"
    fi
}

__dotfiles_core-init() {
    ##
    ## init zinit
    ## https://zdharma-continuum.github.io/zinit/wiki/
    ##
    source "$XDG_DATA_HOME/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    export ABBR_AUTOLOAD=0
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
    __dotfiles_eval-cache fzf --zsh
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
