##
## env
##

export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"


##
## install
##

[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] || (curl -s "https://get.sdkman.io" | bash)


##
## init
##

[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"


##
## alias
##


##
## update
##

__dotfiles-update-widget-java() {
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  command -v sdk >/dev/null && sdk selfupdate
}
