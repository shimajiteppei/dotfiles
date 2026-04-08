#!/usr/bin/env sh
# common installation process on zsh
set -ex
cd $HOME


# ensure dotfiles installed
test -d $HOME/.git || (
    cd $HOME
    git init --initial-branch dotfiles
    git remote add origin https://github.com/shimajiteppei/dotfiles.git
    git pull origin dotfiles
    git submodule update --init --remote --recursive
)


# for test
if test $__DOTFILES_MODE = "test"; then
    echo 'export ZDOTDIR="$HOME/Home/.config/zsh"' >> $HOME/.zshenv
fi
# load env
test -e $HOME/.zshenv
. $HOME/.zshenv


# check if submodules are installed
test -e $XDG_DATA_HOME/fzf/.git
test -e $XDG_DATA_HOME/xdg-ninja/.git
test -e $XDG_DATA_HOME/zinit/zinit.git/.git


# install zsh plugins
zsh $ZDOTDIR/.zshrc


# check if widgets are installed
# docker
# zsh -ic 'command -v docker'
# zsh -ic 'docker --version'
# rust
zsh -ic 'sleep 1 && command -v cargo'
zsh -ic 'sleep 1 && cargo --version'
# navi
zsh -ic 'sleep 1 && command -v navi'
zsh -ic 'sleep 1 && navi --version'
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
# abbr
zsh -ic 'sleep 1 && command -v abbr'
zsh -ic 'sleep 1 && abbr --version'
# delta
zsh -ic 'sleep 1 && command -v delta'
zsh -ic 'sleep 1 && delta --version'

# exit
set +ex
exit 0
