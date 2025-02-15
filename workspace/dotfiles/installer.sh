#!/usr/bin/env sh
# common installation process on zsh
set -ex
cd $HOME


# ensure dotfiles installed
test -d $HOME/.git || (
    cd $HOME
    git init --initial-branch main
    git remote add origin https://github.com/shimajiteppei/dotfiles.git
    git pull origin main
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
zsh -ic 'command -v docker'
zsh -ic 'docker --version'
# rust
zsh -ic 'command -v cargo'
zsh -ic 'cargo --version'
# navi
zsh -ic 'command -v navi'
zsh -ic 'navi --version'
# python
zsh -ic 'command -v uv'
zsh -ic 'uv --version'
zsh -ic 'uv python install'
# nodejs
zsh -ic 'command -v volta'
zsh -ic 'volta --version'
zsh -ic 'volta install node'
# java
zsh -ic 'command -v sdk'
zsh -ic 'sdk version'
zsh -ic 'sdk install java'
# abbr
zsh -ic 'command -v abbr'
zsh -ic 'abbr --version'
# delta
zsh -ic 'command -v delta'
zsh -ic 'delta --version'

# exit
set +ex
exit 0
