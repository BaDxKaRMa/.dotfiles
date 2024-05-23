<div align="center">
    <h1>Dotfiles with the Sauce🍝</h1>

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Obsidian](https://img.shields.io/badge/Obsidian-%23483699.svg?style=for-the-badge&logo=obsidian&logoColor=white)
![Sublime Text](https://img.shields.io/badge/sublime_text-%23575757.svg?style=for-the-badge&logo=sublime-text&logoColor=important)

</div>

## Contents

1. [Details](#details)
1. [Dependencies](#dependencies)
1. [First Time Setup](#firsttime)
1. [Deploy](#deploy)
1. [Folder Structure](#folderStructure)
1. [Notes](#notes)

<a name="details"></a>

## Details

- **OS**: macOS
- **Shell**: zsh (omz)
- **Terminal**: [iTerm2](https://iterm2.com/)
- **Font**: [Monaspace](https://monaspace.githubnext.com/) (Radon)
- Editor/PDE: [Neovim](https://neovim.io/)

<a name="dependencies"></a>

## Dependencies

| Dependency |          Description          |
| :--------: | :---------------------------: |
|   `git`    | You need to download the repo |
|  `rsync`   | If you need to override files |

<a name="firsttime"></a>

## First Time Setup

This is the slickest setup for managing dotfiles that I've used and it lets you pick and choose what in your `$HOME` is synced.

First, we create a bare repo in a new folder named `.dotfiles`. This will hold the .git files and config.

```
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```

Next, I added an alias that I use for this repo. This is the special sauce of this setup. When calling my dotfiles git, I will now use `dot`. This needs to be added to your profile somewhere (like a `.zshrc` file.)

```
alias dot='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Next, don't show untracked files (because that would be a lot) and add the remote.

```
dot config --local status.showUntrackedFiles no
dot remote add origin git@github.com:<Username>/.dotfiles.git
```

Now, you can use the alias to add any file to wish you start syncing. Commit and push to see the results in your GitHub Repo.

```
cd $HOME
dot add .vimrc
dot commit -m "Add .vimrc"
dot push
```

<a name="deploy"></a>

## Deploy to a new system

To setup a new machine all you need to do is clone the repo using a bare repo.

```
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:BaDxKaRMa/.dotfiles.git ~
```

However, some programs create default config files, so this might fail if git finds an existing config file in your $HOME. In that case, a simple solution is to clone to a temporary directory, and then delete it once you are done.

```
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:BaDxKaRMa/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

<a name="folderStructure"></a>

## Config Folder File Structure

- `.config`: Base folder used to store user config files
- `zsh`: Contains Aliases, Functions, welcome, and environment variables
- `nvim`: LazyVim NeoVim setup

<a name="notes"></a>

## Notes

### Useful Aliases

```zsh
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dcam='dot commit -a -m'
alias dst='dot status'
alias dl='dot pull'
alias dp='dot push'
alias da='dot add'
```
