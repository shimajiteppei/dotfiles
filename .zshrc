# Original source and copyright: Kali Linux and Offensive Security
# https://www.kali.org/docs/policy/kali-linux-open-source-policy/

# tools
#setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
#setopt interactivecomments # allow comments in interactive mode
#setopt ksharrays           # arrays start at 0
#setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
#setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt globdots            # enable dotfile completion
setopt no_beep             # disable beep

# hide EOL sign ('%')
export PROMPT_EOL_MARK=""

# enable completion features
autoload -Uz compinit
compinit
zstyle ':completion:*:*:*:*:*' menu select
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}=e{A-Za-z}' # case insensitive tab completion
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

#enable version control system info
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats $'-[%b]%u%c%m'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='T'
    fi
}

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=200000
setopt histexpiredupsfirst # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt histignoredups       # ignore duplicated commands history list
setopt histignorespace      # ignore commands that start with space
setopt histverify            # show command with history expansion to user before running it
setopt sharehistory         # share command history data

# force zsh to show the complete history
alias history="history 0"

force_color_prompt=yes
color_prompt=yes
PROMPT=$'%F{green}┌──(%B%F{blue}%n@%m%b%F{green})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{green}]%F{011}${vcs_info_msg_0_}\n%F{green}└─%B%F{blue}$%b%F{reset} '
RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
unset color_prompt force_color_prompt

new_line_before_prompt=yes
precmd() {
	# Print a new line before the prompt, but only if it is not the first line
    if [ "$new_line_before_prompt" = yes ]; then
	if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
	    _NEW_LINE_BEFORE_PROMPT=1
	else
	    print ""
	fi
    fi
	# set vcs vars (with setopt promptsubst)
    vcs_info
}

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias grep='grep --color=auto'
alias ll='ls -lahF --color'
alias g='git'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias gs='g s'
#alias wine='WINEARCH=win32 LANG="ja_JP.UTF-8" wine'
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/home/hotaru/.local/bin:$PATH"
