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


##
## init
##

command -v pyenv >/dev/null && eval "$(pyenv init -)"
(pyenv global | grep 3.11-dev) || pyenv install 3.11-dev && pyenv global 3.11-dev
command -v poetry >/dev/null || command -v python >/dev/null || (curl -sSL https://install.python-poetry.org | python -)


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
