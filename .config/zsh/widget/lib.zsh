__DOTFILES_WIDGET_LIST=(
    docker
    rust
    navi
    python
    nodejs
    java
    abbr
    delta
)

for widget in $__DOTFILES_WIDGET_LIST; do
    source $ZDOTDIR/widget/$widget.zsh
done

__dotfiles_widget-init() {
    for widget in $__DOTFILES_WIDGET_LIST; do
        "__dotfiles_widget-init-${widget}"
    done
}

__dotfiles_widget-update() {
    for widget in $__DOTFILES_WIDGET_LIST; do
        "__dotfiles_widget-update-${widget}"
    done
}

__dotfiles_widget-clean() {
    for widget in $__DOTFILES_WIDGET_LIST; do
        "__dotfiles_widget-clean-${widget}"
    done
}
