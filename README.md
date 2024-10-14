# 💠 shimajiteppei's dotfiles 💠

My dotfiles for Ubuntu, MacOS and WSL.



## Installation

### 1. install git

for Ubuntu, WSL
```shell
sudo apt install git
```
for MacOS
```shell
brew install git
```

### 2. pull git repository to home directory

```shell
cd $HOME
test -d .git || (
    git init --initial-branch main
    git remote add origin https://github.com/shimajiteppei/dotfiles.git
    git pull origin main
    git submodule update --init --remote --recursive
)
```

### 3. run installer

for Ubuntu and WSL, run [Ubuntu installer](./workspace/dotfiles/installer.ubuntu_24.sh).

```shell
$HOME/workspace/dotfiles/installer.ubuntu_24.sh
```

for MacOS, run [MacOS installer](./workspace/dotfiles/installer.mac.sh).

```shell
$HOME/workspace/dotfiles/installer.mac.sh
```

### ! NOTICE !

DO NOT run `chsh -s $(which zsh)`.



## Checklist for setting up a new machine

- [Ubuntu](./workspace/dotfiles/README.ubuntu.md)
- [MacOS](./workspace/dotfiles/README.mac.md)
- [Windows](./workspace/dotfiles/README.windows.md)



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

Use VSCode.

Main installation process is implemented in [.config/zsh/.zshrc](.config/zsh/.zshrc).

.zshrc is tested with [test.sh](./workspace/dotfiles/test.sh) and [github workflow](./.github/workflows/test-install.yaml).

```shell
# run installation test with multipass VM
$HOME/workspace/dotfiles/test.sh

# delete installation test VM
$HOME/workspace/dotfiles/test.sh clear
```
