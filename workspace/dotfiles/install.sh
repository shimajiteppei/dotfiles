#!/usr/bin/env sh
set -ex
cd $HOME



##
## preinstall os libs
##
__DOTFILES_OSTYPE="$(uname -s)"

if [ "$__DOTFILES_OSTYPE" = Linux ]; then
    sudo apt install -y curl git bash zsh cmake build-essential pkg-config libssl-dev zip unzip
elif [ "$__DOTFILES_OSTYPE" = Darwin ]; then
    brew install curl git bash zsh cmake coreutils </dev/null
fi

unset __DOTFILES_OSTYPE



##
## init dotfiles repo
##
# ensure dotfiles installed
test -d $HOME/.git || {
    cd $HOME;
    git init --initial-branch dotfiles;
    git remote add origin https://github.com/shimajiteppei/dotfiles.git;
    git pull origin dotfiles;
    git submodule update --init --remote --recursive;
    git config --local user.name shimajiteppei;
    git config --local user.email shimajiteppei@gmail.com;
}

# for test
if [ ${__DOTFILES_TEST_MODE:-0} -gt 0 ]; then
    echo 'export ZDOTDIR="$HOME/Home/.config/zsh"' >> $HOME/.zshenv
fi
# load env
test -e $HOME/.zshenv
. $HOME/.zshenv

# check if submodules are installed
test -e $XDG_DATA_HOME/fzf/.git
test -e $XDG_DATA_HOME/xdg-ninja/.git
test -e $XDG_DATA_HOME/zinit/zinit.git/.git




###
### init zsh
###
export __DOTFILES_DEBUG_MODE=2

# install zsh plugins
zsh $ZDOTDIR/.zshrc



###
### check zsh
###
export __DOTFILES_DEBUG_MODE=1

# check if widgets are installed
# docker
# zsh -ic 'command -v docker'
# zsh -ic 'docker --version'
# rust
zsh -ic 'sleep 1 && command -v cargo'
zsh -ic 'sleep 1 && cargo --version'
# python
zsh -ic 'sleep 1 && command -v uv'
zsh -ic 'sleep 1 && uv --version'
zsh -ic 'sleep 1 && uv python install'
# nodejs
zsh -ic 'sleep 1 && command -v vp'
zsh -ic 'sleep 1 && vp --version'
zsh -ic 'sleep 1 && vp env install lts'
# java
zsh -ic 'sleep 1 && command -v sdk'
zsh -ic 'sleep 1 && sdk version'
zsh -ic 'sleep 1 && sdk install java'
# delta
zsh -ic 'sleep 1 && command -v delta'
zsh -ic 'sleep 1 && delta --version'
# abbr
zsh -ic 'sleep 1 && command -v abbr'
zsh -ic 'sleep 1 && abbr --version'
# mise
zsh -ic 'sleep 1 && command -v mise'
zsh -ic 'sleep 1 && mise --version'



# exit
unset __DOTFILES_DEBUG_MODE
set +ex
exit 0
