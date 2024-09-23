#!/usr/bin/env sh
# common installation process on zsh
set -ex

# install dotfiles
cd $HOME
test -d .git || (
    git init --initial-branch main
    git remote add origin https://github.com/shimajiteppei/dotfiles.git
    git pull origin main
    git submodule update --init --remote --recursive
)

# check if submodules are installed
test -e $HOME/.local/share/fzf/.git
test -e $HOME/.local/share/xdg-ninja/.git
test -e $HOME/.local/share/zinit/zinit.git/.git

# install zsh plugins
zsh $HOME/.config/zsh/.zshrc

# check if widgets are installed
zsh -ic 'command -v sdk'
zsh -ic 'command -v volta'
zsh -ic 'command -v cargo'
zsh -ic 'command -v navi'

# exit
set +e
exit 0
