__dotfiles_widget_list=($__dotfiles_widget_list
    rust
    python
    nodejs
    java
    delta
    abbr
    mise
)

for widget in $__dotfiles_widget_list; do
    source $ZDOTDIR/widget/$widget.zsh
done

__dotfiles_widget-init() {
    for widget in $__dotfiles_widget_list; do
        "__dotfiles_widget-init-${widget}"
    done
}

__dotfiles_widget-update() {
    for widget in $__dotfiles_widget_list; do
        "__dotfiles_widget-update-${widget}"
    done
}

__dotfiles_widget-clean() {
    for widget in $__dotfiles_widget_list; do
        "__dotfiles_widget-clean-${widget}"
    done
}

__dotfiles_widget-test() {
    for widget in $__dotfiles_widget_list; do
        "__dotfiles_widget-test-${widget}"
    done
}
