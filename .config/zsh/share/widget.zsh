# sdkman
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# pyenv
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# open navi with Ctrl + G
source "$XDG_DATA_HOME/fzf/shell/completion.zsh"
eval "$(navi widget zsh)"
