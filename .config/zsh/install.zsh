# install prerequisites
[[ -s "$XDG_DATA_HOME/fzf/bin/fzf" ]] || $XDG_DATA_HOME/fzf/install --bin
command -v navi >/dev/null || (bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install))
