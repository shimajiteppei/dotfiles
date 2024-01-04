# platform independent scripts
source $ZDOTDIR/share/install.zsh
source $ZDOTDIR/share/history.zsh
source $ZDOTDIR/share/zinit.zsh
source $ZDOTDIR/share/completion.zsh
source $ZDOTDIR/share/widget.zsh
source $ZDOTDIR/share/alias.zsh

# platform specific scripts
if [[ "$OSTYPE" == "darwin"* ]]; then
    source $ZDOTDIR/os/darwin.zsh
elif [[ "$OSTYPE" == "linux"* ]]; then
    source $ZDOTDIR/os/linux.zsh
fi
