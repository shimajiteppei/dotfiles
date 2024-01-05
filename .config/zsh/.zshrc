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
## define update function
##
source $ZDOTDIR/core/update.zsh

##
## define platform specific function
##
if [[ "$OSTYPE" == "darwin"* ]]; then
    source $ZDOTDIR/os/darwin.zsh
elif [[ "$OSTYPE" == "linux"* ]]; then
    source $ZDOTDIR/os/linux.zsh
fi

##
## alias
##
source $ZDOTDIR/core/alias.zsh
