__DOTFILES_WIDGET_NAME=nodejs


##
## env (envs must be loaded in main thread)
##
export VOLTA_HOME="$HOME/.volta"
path=($path
    $VOLTA_HOME/bin
)
typeset -U path PATH
export PATH


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## install
    ##
    command -v volta >/dev/null || (curl https://get.volta.sh | bash)
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
    command -v volta >/dev/null && (curl https://get.volta.sh | bash)
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
    local VOLTA_TOOL_IMAGE=$VOLTA_HOME/tools/image
    volta list node --format plain | grep -v 'default' | awk -F ' |@' '{print $3}' | xargs -I{} rm -rf $VOLTA_TOOL_IMAGE/node/{}
    volta list npm --format plain | grep -v 'default' | awk -F ' |@' '{print $3}' | xargs -I{} rm -rf $VOLTA_TOOL_IMAGE/npm/{}
    volta list yarn --format plain | grep -v 'default' | awk -F ' |@' '{print $3}' | xargs -I{} rm -rf $VOLTA_TOOL_IMAGE/yarn/{}
}


unset __DOTFILES_WIDGET_NAME
