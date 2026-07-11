__dotfiles_widget_name=ai


##
## env (envs must be loaded in main thread)
##
path=($path
    $HOME/.opencode/bin
)
typeset -U path PATH
export PATH


##
## init
##
"__dotfiles_widget-init-${__dotfiles_widget_name}"() {
    if ! command -v ollama >/dev/null; then
        curl -fsSL https://ollama.com/install.sh | sh
    fi
    if ! command -v gemini >/dev/null; then
        vp install -g @google/gemini-cli
    fi
    if ! command -v claude >/dev/null; then
        curl -fsSL https://claude.ai/install.sh | bash
    fi
    if ! command -v codex >/dev/null; then
        vp install -g @openai/codex
    fi
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
    command -v ollama
    ollama version

    command -v gemini
    gemini version

    command -v claude
    claude version

    command -v codex
    codex version
}


unset __dotfiles_widget_name
