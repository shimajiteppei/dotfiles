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
zsh -ic 'command -v cargo'
zsh -ic 'command -v navi'
zsh -ic 'command -v uv'
zsh -ic 'uv python install'
zsh -ic 'command -v sdk'
zsh -ic 'sdk install java'
zsh -ic 'command -v volta'
zsh -ic 'volta install node'


# exit
set +ex
exit 0
