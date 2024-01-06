##
## env
##
path=(
    $path
    /snap/bin
    $HOME/.local/bin
)
typeset -U path PATH
export PATH

##
## init zsh
##
source $ZDOTDIR/core/zinit.zsh
source $ZDOTDIR/core/history.zsh
source $ZDOTDIR/core/completion.zsh
source $ZDOTDIR/core/alias.zsh

##
## init widget
##
source $ZDOTDIR/widget/rust.zsh
source $ZDOTDIR/widget/python.zsh
source $ZDOTDIR/widget/nodejs.zsh
source $ZDOTDIR/widget/java.zsh
source $ZDOTDIR/widget/golang.zsh
source $ZDOTDIR/widget/navi.zsh
__dotfiles-update-widget() {
    __dotfiles-update-widget-rust
    __dotfiles-update-widget-python
    __dotfiles-update-widget-nodejs
    __dotfiles-update-widget-java
    __dotfiles-update-widget-golang
    __dotfiles-update-widget-navi
}

##
## define platform specific function
##
if [[ "$OSTYPE" == "darwin"* ]]; then
    source $ZDOTDIR/os/darwin.zsh
elif [[ "$OSTYPE" == "linux"* ]]; then
    source $ZDOTDIR/os/linux.zsh
fi

##
## define update function
##

__dotfiles-update-self() {
  cd $HOME
  git submodule update --recursive
  cd -

  zinit self-update
  __dotfiles-update-widget
}

...update() {
    __dotfiles-update-system
    __dotfiles-update-self
}

...check() {
    $XDG_DATA_HOME/xdg-ninja/xdg-ninja.sh
}
