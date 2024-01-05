##
## completion
## https://zsh-manual.netlify.app/completion-system
##

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

setopt globdots
setopt auto_menu
setopt menu_complete
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*:*:*:*:*' menu select
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

##
## autocomplete for hostnames defined in .ssh/conf.d/*.conf
##

_ssh() {
  compadd $(find $HOME/.ssh/ -type f -name '*.conf' | xargs egrep '^Host ' | awk '{print $2}' | egrep '^[^\*]+$' | sort);
}
