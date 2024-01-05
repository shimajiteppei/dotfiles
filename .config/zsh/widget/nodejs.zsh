##
## env
##

export VOLTA_HOME="$HOME/.volta"
path=($path
  $VOLTA_HOME/bin
)
typeset -U path PATH
export PATH


##
## install
##

command -v volta >/dev/null || (curl https://get.volta.sh | bash)


##
## init
##


##
## alias
##


##
## update
##

__dotfiles-update-widget-nodejs() {
  command -v volta >/dev/null && (curl https://get.volta.sh | bash)
}
