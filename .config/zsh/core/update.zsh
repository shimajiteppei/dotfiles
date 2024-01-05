#
# update
#

dotfiles-update-self() {
  cd $HOME
  git submodule update --recursive
  cd -

  zinit self-update
  __dotfiles-update-widget
}

dotfiles-check-xdg() {
  $XDG_DATA_HOME/xdg-ninja/xdg-ninja.sh
}
