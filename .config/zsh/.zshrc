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
__dotfiles_widget=(
    docker
    rust
    python
    nodejs
    java
    golang
    navi
)

for widget in $__dotfiles_widget; do
    source $ZDOTDIR/widget/$widget.zsh
done

__dotfiles-widget-update() {
    for widget in $__dotfiles_widget; do
        "__dotfiles_widget-update-$widget"
    done
}

__dotfiles-widget-clean() {
    for widget in $__dotfiles_widget; do
        "__dotfiles_widget-clean-$widget"
    done
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
## define alias function
##

__dotfiles-update-self() {
  cd $HOME
  git submodule update --recursive
  cd -

  zinit self-update
  __dotfiles-widget-update
}

...update() {
    __dotfiles-update-system
    __dotfiles-update-self
}

...check() {
    $XDG_DATA_HOME/xdg-ninja/xdg-ninja.sh
}

...clean() {
    __dotfiles-widget-clean
}


##
## editor
##

export EDITOR=nano
export VISUAL=nano
