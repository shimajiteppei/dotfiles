##
## zsh profiling
## ```shell
## DOTFILES_PROFILE=1 zsh -i -c exit
## ```
##
[[ $DOTFILES_PROFILE == 1 ]] && zmodload zsh/zprof
__dotfiles_profile() {
  [[ $DOTFILES_PROFILE == 1 ]] && zprof
}

##
## load scripts
##
source $ZDOTDIR/core/lib.zsh
source $ZDOTDIR/os/lib.zsh
source $ZDOTDIR/widget/lib.zsh

##
## init
##
__dotfiles_core-init
__dotfiles_os-init
__dotfiles_widget-init

##
## define tasks
##
...update() {
    __dotfiles_os-update
    __dotfiles_core-update
    __dotfiles_widget-update
}

...clean() {
    __dotfiles_widget-clean
}

...check() {
    $XDG_DATA_HOME/xdg-ninja/xdg-ninja.sh
}

__dotfiles_profile
