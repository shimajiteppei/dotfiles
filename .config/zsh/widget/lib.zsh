__DOTFILES_WIDGET_NAME=(
    docker
    rust
    navi
    nodejs
    java
)

for widget in $__DOTFILES_WIDGET_NAME; do
    source $ZDOTDIR/widget/$widget.zsh
done

__dotfiles_widget-init() {
    for widget in $__dotfiles_widget; do
        "__dotfiles_widget-init-$widget"
    done
}

__dotfiles_widget-update() {
    for widget in $__DOTFILES_WIDGET_NAME; do
        "__dotfiles_widget-update-$widget"
    done
}

__dotfiles_widget-clean() {
    for widget in $__DOTFILES_WIDGET_NAME; do
        "__dotfiles_widget-clean-$widget"
    done
}
