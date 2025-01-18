##
## alias
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
