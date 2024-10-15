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

### Editor

Please use VSCode as your editor. Configuration files are located under the `.vscode` directory.

### Testing

The main installation process is implemented in [.config/zsh/.zshrc](./.config/zsh/.zshrc).

Tests for `.zshrc` are provided in [test.sh](./workspace/dotfiles/test.sh) and the [GitHub workflow](./.github/workflows/test-install.yaml).

Here is how to use `test.sh`:

```shell
# run installation test with multipass VM
$HOME/workspace/dotfiles/test.sh

# delete installation test VM
$HOME/workspace/dotfiles/test.sh clear
```

### Structure

These dotfiles follow the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/). Basic configuration files are stored under `XDG_CONFIG_HOME`, which is `$HOME/.config`.

We use [zsh](https://zsh.sourceforge.io/Doc/) in this dotfiles. The `.zshrc` file is located at [.config/zsh/.zshrc](./.config/zsh/.zshrc) and primarily serves two functions:

- Provisioning
    - Installation and initial setup of various features
- Task Runner
    - Update and initialization processes for various features

Since `.zshrc` performs many tasks, it is managed by splitting it into files for each function. The directory is divided into three main sections:

- core
    - Processes related to zsh and zsh plugins
- os
    - OS-specific processes
- widget
    - Processes related to applications (mainly language toolchains)

For the basic coding style, please refer to `lib.zsh` and `template.zsh`.



## Personal checklist for setting up a new machine (日本語)

- [Ubuntu](./workspace/dotfiles/README.ubuntu.md)
- [MacOS](./workspace/dotfiles/README.mac.md)
- [Windows](./workspace/dotfiles/README.windows.md)
