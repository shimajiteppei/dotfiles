##
## env
##

path=($path
  $HOME/.cargo/bin
)
typeset -U path PATH
export PATH


##
## install
##

command -v cargo >/dev/null || (curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh)
command -v cargo-install-update >/dev/null || cargo install cargo-update


##
## init
##


##
## alias
##


##
## update
##

__dotfiles-update-widget-rust() {
  command -v rustup >/dev/null && rustup update
  command -v cargo-install-update >/dev/null && cargo install-update --all
}
