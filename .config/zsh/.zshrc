[[ $DOTFILES_ZSHRC_MODE = debug ]] && set -x



##
## preload scripts
##
__dotfiles_zshrc_enable_parallel=1
__dotfiles_zshrc_enable_perf=0
__dotfiles_zshrc_enable_debug=0

case "$DOTFILES_ZSHRC_MODE" in
    install)
        __dotfiles_zshrc_enable_parallel=0
        __dotfiles_zshrc_enable_perf=0
        __dotfiles_zshrc_enable_debug=0
        ;;
    debug)
        __dotfiles_zshrc_enable_parallel=0
        __dotfiles_zshrc_enable_perf=0
        __dotfiles_zshrc_enable_debug=1
        ;;
    perf)
        __dotfiles_zshrc_enable_parallel=1
        __dotfiles_zshrc_enable_perf=1
        __dotfiles_zshrc_enable_debug=0
        ;;
esac

if [[ $__dotfiles_zshrc_enable_debug > 0 ]]; then
cat <<EOF
################################################################
[dotfiles log]

DOTFILES_ZSHRC_MODE=$DOTFILES_ZSHRC_MODE
__dotfiles_zshrc_enable_parallel=$__dotfiles_zshrc_enable_parallel
__dotfiles_zshrc_enable_perf=$__dotfiles_zshrc_enable_perf
__dotfiles_zshrc_enable_debug=$__dotfiles_zshrc_enable_debug
################################################################
EOF
fi
if [[ $__dotfiles_zshrc_enable_perf > 0 ]]; then
    zmodload zsh/zprof
fi



##
## load scripts
##
if [[ $__dotfiles_zshrc_enable_debug > 0 ]]; then
cat <<EOF
################################################################
[dotfiles log]
start loading zshrc
################################################################
EOF
fi

source $ZDOTDIR/core/lib.zsh
source $ZDOTDIR/os/lib.zsh
source $ZDOTDIR/widget/lib.zsh

if [[ $__dotfiles_zshrc_enable_debug > 0 ]]; then
cat <<EOF
################################################################
[dotfiles log]
end loading zshrc

__dotfiles_os_type=$__dotfiles_os_type
__dotfiles_widget_list=$__dotfiles_widget_list
################################################################
EOF
fi



##
## init scripts
##
if [[ $__dotfiles_zshrc_enable_debug > 0 ]]; then
cat <<EOF
################################################################
[dotfiles log]
start initializing zshrc
################################################################
EOF
fi

__dotfiles_core-init
__dotfiles_os-init
# defer loading widgets on interactive shell
if [[ $__dotfiles_zshrc_enable_parallel > 0 ]]; then
    zsh-defer __dotfiles_widget-init
else
    __dotfiles_widget-init
fi

if [[ $__dotfiles_zshrc_enable_debug > 0 ]]; then
cat <<EOF
################################################################
[dotfiles log]
end initializing zshrc
################################################################
EOF
fi



##
## define tasks
##
if [[ $__dotfiles_zshrc_enable_debug > 0 ]]; then
cat <<EOF
################################################################
[dotfiles log]
start defining zshrc tasks
################################################################
EOF
fi

...update() {
    __dotfiles_os-update
    __dotfiles_core-update
    __dotfiles_widget-update
}

...clean() {
    __dotfiles_widget-clean
}

...edit() {
    code $HOME/.vscode/dotfiles.code-workspace
}

...test() {
    __dotfiles_widget-test
}

if [[ $__dotfiles_zshrc_enable_debug > 0 ]]; then
cat <<EOF
################################################################
[dotfiles log]
end defining zshrc tasks
################################################################
EOF
fi


##
## post init scripts
##
# end zsh profiling
if [[ $__dotfiles_zshrc_enable_perf > 0 ]]; then
    zprof
fi

# force return code
return 0
