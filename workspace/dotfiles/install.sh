#!/usr/bin/env sh
set -ex
cd $HOME


##
## decide installer mode
##
__dotfiles_installer_enable_test=0
__dotfiles_installer_enable_test_local=0

case "$DOTFILES_INSTALLER_MODE" in
    test_ci)
        __dotfiles_installer_enable_test=1
        __dotfiles_installer_enable_test_local=0
        ;;
    test_local)
        __dotfiles_installer_enable_test=1
        __dotfiles_installer_enable_test_local=1
        ;;
esac

cat <<EOF
################################################################
[dotfiles log]
starting dotfiles installer

DOTFILES_INSTALLER_MODE=$DOTFILES_INSTALLER_MODE
__dotfiles_installer_enable_test=$__dotfiles_installer_enable_test
__dotfiles_installer_enable_test_local=$__dotfiles_installer_enable_test_local
################################################################
EOF



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

if [ $__dotfiles_installer_enable_test_local -gt 0 ]; then
    # override zsh dir for test
    echo 'export ZDOTDIR="$HOME/Home/.config/zsh"' >> $HOME/.zshenv
fi



###
### init zsh
###
cat <<EOF
################################################################
[dotfiles log]
initializing zsh environment
################################################################
EOF

# load env manually
test -e $HOME/.zshenv
. $HOME/.zshenv
test -e $XDG_DATA_HOME/zinit/zinit.git/.git
# init zshrc
DOTFILES_ZSHRC_MODE=install zsh $ZDOTDIR/.zshrc

cat <<EOF
################################################################
[dotfiles log]
zsh environment initialized successfully
################################################################
EOF


###
### check zsh
###
cat <<EOF
################################################################
[dotfiles log]
checking zsh environment
################################################################
EOF

DOTFILES_ZSHRC_MODE=install zsh -ic "...test"


if [ $__dotfiles_installer_enable_test -gt 0 ]; then

cat <<EOF
################################################################
[dotfiles log]
checking zsh task: update
################################################################
EOF

zsh -ic "...update"

cat <<EOF
################################################################
[dotfiles log]
checking zsh task: clean
################################################################
EOF

zsh -ic "...clean"

cat <<EOF
################################################################
[dotfiles log]
checking reinstall zsh environment
################################################################
EOF

DOTFILES_ZSHRC_MODE=install zsh $ZDOTDIR/.zshrc

cat <<EOF
################################################################
[dotfiles log]
checking zsh environment
################################################################
EOF

DOTFILES_ZSHRC_MODE=install zsh -ic "...test"

fi

cat <<EOF
################################################################
[dotfiles log]
zsh environment checked successfully
################################################################
EOF


# exit
set +ex
exit 0
