__dotfiles_widget_name=ai


##
## env (envs must be loaded in main thread)
##
path=($path

)
typeset -U path PATH
export PATH


##
## init
##
"__dotfiles_widget-init-${__dotfiles_widget_name}"() {
    if ! command -v claude >/dev/null; then
        vp install -g @anthropic-ai/claude-code
    fi

    if ! command -v codex >/dev/null; then
        vp install -g @openai/codex
    fi
    alias 'codex'='codex --profile local'
}


##
## update
##
"__dotfiles_widget-update-${__dotfiles_widget_name}"() {
}


##
## clean
##
"__dotfiles_widget-clean-${__dotfiles_widget_name}"() {
}


##
## test
##
"__dotfiles_widget-test-${__dotfiles_widget_name}"() {
    command -v claude
    claude version

    command -v codex
    codex version
}


unset __dotfiles_widget_name
