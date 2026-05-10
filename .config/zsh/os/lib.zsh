case "$OSTYPE" in
    darwin*)
        __dotfiles_os_type=macos
        ;;
    linux*)
        __dotfiles_os_type=ubuntu
        ;;
    *)
        __dotfiles_os_type=template
        ;;
esac


source $ZDOTDIR/os/${__dotfiles_os_type}.zsh
__dotfiles_os-init() {
    "__dotfiles_os-init-${__dotfiles_os_type}"
}
__dotfiles_os-update() {
    "__dotfiles_os-update-${__dotfiles_os_type}"
}
