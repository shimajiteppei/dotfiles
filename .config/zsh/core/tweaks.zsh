##
## tweaks; tuning zsh options
##
## documentation:
##   - https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap08.html
##   - https://zsh.sourceforge.io/Doc/Release/Parameters.html
##   - https://zsh.sourceforge.io/Doc/Release/Options.html
##   - https://zsh.sourceforge.io/Doc/Release/Completion-System.html
##
## awesome reference:
##   - https://wiki.archlinux.org/title/Zsh
##   - https://gitlab.com/kalilinux/packages/kali-defaults/-/blob/kali/master/etc/skel/.zshrc
##


##
## shell variables
##
# history file
mkdir -p $XDG_STATE_HOME/zsh
export HISTFILE="$XDG_STATE_HOME/zsh/history"
[[ -s "$HISTFILE" ]] || touch "$HISTFILE"
HISTSIZE=1000000
SAVEHIST=200000


##
## shell options
##
# completion
setopt MENU_COMPLETE

# globbing
setopt GLOB_DOTS
setopt NUMERIC_GLOB_SORT

# history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt HIST_FCNTL_LOCK


##
## completion configuration
##
autoload -Uz compinit
zsh-defer compinit -C -d "$__dotfiles_cache_dir/.zcompdump"
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' gain-privileges 1
zstyle ':completion:*' rehash true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
__dotfiles_eval-cache 'dircolors -b'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


##
## other tweaks
##
# history completion by up and down arrow keys
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# autocomplete for hostnames defined in .ssh/conf.d/*.conf
_ssh() {
  compadd $(find $HOME/.ssh/ -type f -name '*.conf' | xargs egrep '^Host ' | awk '{print $2}' | egrep '^[^\*]+$' | sort);
}
