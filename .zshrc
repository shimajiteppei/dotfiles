##
## zinit and plugin
##

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
  romkatv/powerlevel10k \
  zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting \
  zdharma-continuum/history-search-multi-word \
  marlonrichert/zsh-autocomplete \
  arzzen/calc.plugin.zsh \
  olets/zsh-abbr \
  b4b4r07/enhancd \

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

setopt globdots            # enable dotfile completion


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
eval "$(pyenv init -)"

path=(
  $path
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
