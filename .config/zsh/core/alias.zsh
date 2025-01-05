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
alias rm='rm -i'
alias mkdir='mkdir -p'

alias g='git'
# to avoid running ghostscript by type error
alias gs='git status --short'
# https://zsh-abbr.olets.dev/commands.html#git
alias git s='status --short'
alias git ap='add -p'
alias git cm='commit -m'
alias git ca='commit --amend'
alias git ch='checkout'
alias git re='reset'
# disable switch/restore
alias git switch='checkout'
alias git restore='reset'
# override
alias git clone='clone --recurse-submodules'
alias git config='config --local'
alias git pull='fetch --all --tags --prune --prune-tags && git pull --rebase --autostash'
