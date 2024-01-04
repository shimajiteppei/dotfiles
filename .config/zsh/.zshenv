export HISTFILE="$XDG_STATE_HOME/zsh/history"

export VOLTA_HOME="$HOME/.volta"

export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"

export PYENV_ROOT="$HOME/.pyenv"
export PIP_REQUIRE_VIRTUALENV=true

path=(
  $path
  /snap/bin
  $HOME/.local/bin
  $XDG_DATA_HOME/fzf/bin
  $VOLTA_HOME/bin
  $HOME/.cargo/bin
  $PYENV_ROOT/bin
  /usr/local/go/bin
)
typeset -U path PATH
export PATH
