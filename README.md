# dotfiles

💠 my dotfiles 💠

## configure

1. install `bash`, `zsh`
2. set default shell to `zsh`
3. pull this repository

```sh
cd $HOME
git init --initial-branch main
git remote add origin git@github.com:shimajiteppei/dotfiles.git
git pull origin main
```

## ideology

> 勝可知而不可為
> 非利不動非得不用非危不戰

This repository only controls:

- git configs
- zsh and plugins
- provisioning scripts
- workspace directory structure

This repository does not force the HOME directory to conform to the XDG based directory.
However, when committing the configuration of installed external tools, it is preferable to conform to the XDG based directory as much as possible.

## commands

```shell
# update system and dotfiles itself
...update

# check XDG based directory
...check
```
