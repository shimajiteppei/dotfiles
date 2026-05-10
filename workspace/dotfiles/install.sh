#!/usr/bin/env sh
set -ex
cd $HOME



##
## preinstall os libs
##
case "$(uname -s)" in
    Linux)
        sudo apt install -y curl git bash zsh cmake build-essential pkg-config libssl-dev zip unzip
        ;;
    Darwin)
        brew install curl git bash zsh cmake coreutils </dev/null
        ;;
    *)
        exit 1
        ;;
esac



##
## init dotfiles repo
##
if ! test -d $HOME/.git; then
    cd $HOME;
    git init --initial-branch dotfiles;
    git remote add origin https://github.com/shimajiteppei/dotfiles.git;
    git pull origin dotfiles;
    git submodule update --init --remote --recursive;
    git config --local user.name shimajiteppei;
    git config --local user.email shimajiteppei@gmail.com;
fi
# for test
if [ ${__DOTFILES_TEST_MODE:-0} -gt 0 ]; then
    echo 'export ZDOTDIR="$HOME/Home/.config/zsh"' >> $HOME/.zshenv
fi
# load env manually
test -e $HOME/.zshenv
. $HOME/.zshenv

test -e $XDG_DATA_HOME/fzf/.git
test -e $XDG_DATA_HOME/xdg-ninja/.git
test -e $XDG_DATA_HOME/zinit/zinit.git/.git




###
### init zsh
###
__DOTFILES_DEBUG_MODE=1 zsh $ZDOTDIR/.zshrc



###
### check zsh
###
__DOTFILES_DEBUG_MODE=1 zsh -ic "$(cat <<'EOF'

set -e

# command -v docker
# docker --version

command -v cargo
cargo --version

command -v uv
uv --version

command -v vp
vp --version

command -v sdk
sdk version

command -v delta
delta --version

command -v abbr
abbr --version

command -v mise
mise --version

EOF
)"



# exit
set +ex

echo "dotfiles installed successfully!"
exit 0
