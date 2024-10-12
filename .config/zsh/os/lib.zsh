if [[ "$OSTYPE" == "darwin"* ]]; then
    __DOTFILES_OS_TYPE=macos
elif [[ "$OSTYPE" == "linux"* ]]; then
    __DOTFILES_OS_TYPE=ubuntu
else
    __DOTFILES_OS_TYPE=template
fi

source $ZDOTDIR/os/${__DOTFILES_OS_TYPE}.zsh
__dotfiles_os-init() {
    "__dotfiles_os-init-${__DOTFILES_OS_TYPE}"
}
__dotfiles_os-update() {
    "__dotfiles_os-update-${__DOTFILES_OS_TYPE}"
}
