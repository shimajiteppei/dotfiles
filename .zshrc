##
## zinit, powerlevel10k
##

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


##
## plugin, completion
##

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
  romkatv/powerlevel10k \
  zdharma-continuum/history-search-multi-word \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-completions \
  olets/zsh-abbr \
  arzzen/calc.plugin.zsh \

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# https://zsh-manual.netlify.app/completion-system
setopt globdots
setopt auto_menu
setopt menu_complete
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*:*:*:*:*' menu select
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'


##
## history
##

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=200000
setopt histexpiredupsfirst # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt histignoredups       # ignore duplicated commands history list
setopt histignorespace      # ignore commands that start with space
setopt histverify            # show command with history expansion to user before running it
setopt sharehistory         # share command history data

zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(exit|code)($| )" ]]
}


##
## env
##

export VOLTA_HOME="$HOME/.volta"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

path=(
  $path
  /snap/bin(N-/)
  $HOME/.local/bin(N-/)
  $VOLTA_HOME/bin(N-/)
  $HOME/.cargo/bin(N-/)
  /usr/local/go/bin(N-/)
)
typeset -U path PATH
export PATH

# open navi with Ctrl + G
eval "$(navi widget zsh)"


##
## alias
##

alias alias='abbr --session --global --quieter --force'
abbr clear-session
alias history="history 0"
alias grep='grep --color=auto'
alias ll='ls -lahF --color'
alias cp='cp -i'
alias mv='mv -i'
alias rm='mv -t $HOME/.local/share/Trash/files'
alias mkdir='mkdir -p'
alias g='git'
alias gs='git status'
# https://zsh-abbr.olets.dev/commands.html#git
alias git ap='add -p'
alias git b='branch'
alias git ch='checkout'
alias git cb='checkout -b'
alias git clone='clone --recurse-submodules'
alias git cm='commit -m'
alias git ca='commit --amend'
alias git config='config --local'
alias git s='status'


##
## fast-syntax-highlighting highlighting of abbreviations (https://github.com/olets/zsh-abbr/issues/24)
##

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
