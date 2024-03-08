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

__dotfiles_widget-update-nodejs() {
  command -v volta >/dev/null && (curl https://get.volta.sh | bash)
}


##
## clean
##

__dotfiles_widget-clean-nodejs() {
  local VOLTA_TOOL_IMAGE=$VOLTA_HOME/tools/image
  volta list node --format plain | grep -v 'default' | awk -F ' |@' '{print $3}' | xargs -I{} rm -rf $VOLTA_TOOL_IMAGE/node/{}
  volta list npm --format plain | grep -v 'default' | awk -F ' |@' '{print $3}' | xargs -I{} rm -rf $VOLTA_TOOL_IMAGE/npm/{}
  volta list yarn --format plain | grep -v 'default' | awk -F ' |@' '{print $3}' | xargs -I{} rm -rf $VOLTA_TOOL_IMAGE/yarn/{}
}
