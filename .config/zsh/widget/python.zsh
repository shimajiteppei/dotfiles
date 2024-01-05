##
## env
##

export PYENV_ROOT="$HOME/.pyenv"
export PIP_REQUIRE_VIRTUALENV=true
path=($path
  $PYENV_ROOT/bin
)
typeset -U path PATH
export PATH


##
## install
##

command -v pyenv >/dev/null || (curl https://pyenv.run | bash)
command -v poetry >/dev/null || (curl -sSL https://install.python-poetry.org | python3 -)


##
## init
##

command -v pyenv >/dev/null && eval "$(pyenv init -)"


##
## alias
##


##
## update
##

__dotfiles-update-widget-python() {
  command -v pyenv >/dev/null && pyenv update
  command -v poetry >/dev/null && poetry self update
}
