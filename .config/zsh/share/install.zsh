#
# install languages
#
# Rust
command -v cargo >/dev/null || (curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh)
# JavaScript
command -v volta >/dev/null || (curl https://get.volta.sh | bash)
command -v bun >/dev/null || (curl -fsSL https://bun.sh/install | bash)
# Python
command -v pyenv >/dev/null || (curl https://pyenv.run | bash)
command -v poetry >/dev/null || (curl -sSL https://install.python-poetry.org | python3 -)
# Java
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] || (curl -s "https://get.sdkman.io" | bash)

# install prerequisites
[[ -s "$XDG_DATA_HOME/fzf/bin/fzf" ]] || $XDG_DATA_HOME/fzf/install --bin
command -v navi >/dev/null || (bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install))
