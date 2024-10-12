# 💠 dotfiles 💠

## Checklist for setting up a new machine

- [Ubuntu](./workspace/dotfiles/README.ubuntu.md)
- [MacOS](./workspace/dotfiles/README.mac.md)
- [Windows](./workspace/dotfiles/README.windows.md)

## Installation

1. install git

2. pull git repository

```shell
cd $HOME
test -d .git || (
    git init --initial-branch main
    git remote add origin https://github.com/shimajiteppei/dotfiles.git
    git pull origin main
    git submodule update --init --remote --recursive
)
```

3. run installer

```sh
$HOME/workspace/dotfiles/installer.ubuntu_24.sh
```

### DO NOT

DO NOT run `chsh -s $(which zsh)`.

## Usage

```shell
# update system and dotfiles itself
...update

# clean widget environment
...clean

# check XDG based directory
...check
```

## Develop

use VSCode

## Testing

run test
```shell
$HOME/workspace/dotfiles/test.sh
```

clear test data
```shell
$HOME/workspace/dotfiles/test.sh clear
```
