__dotfiles-update-system() {
  sudo apt update
  sudo apt upgrade -y
  sudo snap refresh
}

alias rm='mv -t $XDG_DATA_HOME/Trash/files/'
