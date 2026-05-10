# dotfiles

My dotfiles for Ubuntu, MacOS and WSL.

This repository manages `$HOME` directly as a git working tree on the `dotfiles` branch.
It installs zsh, shell plugins, and development toolchains.



## Installation

```shell
curl -fsSL https://raw.githubusercontent.com/shimajiteppei/dotfiles/refs/heads/dotfiles/workspace/dotfiles/install.sh | sh
```



## Usage

```shell
# update system and dotfiles itself
...update

# open vscode workspace
...edit

# clean widget environment
...clean

# test dotfiles setup
...test
```



## Develop

run mise task
```shell
cd $HOME/workspace/dotfiles
mise run
```



## Personal checklist for setting up a new machine (日本語)

- [Ubuntu](./workspace/dotfiles/README.ubuntu.md)
- [MacOS](./workspace/dotfiles/README.mac.md)
- [Windows](./workspace/dotfiles/README.windows.md)
