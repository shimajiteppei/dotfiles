__DOTFILES_WIDGET_NAME=ai


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
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    command -v ollama >/dev/null || { curl -fsSL https://ollama.com/install.sh | sh ;}
    command -v gemini >/dev/null || npm install -g @google/gemini-cli
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
}


unset __DOTFILES_WIDGET_NAME
