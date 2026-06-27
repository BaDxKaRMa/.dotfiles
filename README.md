<div align="center">
    <h1>Dotfiles with the Sauce🍝</h1>

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
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
1. [What bootstrap installs](#bootstrap)
1. [Folder Structure](#folderStructure)
1. [Notes](#notes)

<a name="details"></a>

## Details

- **OS**: macOS and Linux
- **Shell**: zsh (oh-my-zsh + powerlevel10k)
- **Terminal**: [iTerm2](https://iterm2.com/) (macOS)
- **Font**: [Monaspace](https://monaspace.githubnext.com/) Nerd Font (Radon)
- Editor/PDE: [Neovim](https://neovim.io/)

<a name="dependencies"></a>

## Dependencies

You only need `git` to clone, and `curl` for the bootstrap. Everything else (the
~60 CLI tools the shell calls, oh-my-zsh, powerlevel10k, the external zsh
plugins, and the Nerd font) is installed by [`bootstrap.sh`](#bootstrap).

| Dependency | Description                                  |
| :--------: | :------------------------------------------- |
|   `git`    | Clone the repo                               |
|  `curl`    | Used by `bootstrap.sh` to fetch installers   |
|  `rsync`   | Only if you deploy via the rsync method below |

On macOS the package set lives in `.config/Brewfile` and is installed with
`brew bundle`. On Linux the bootstrap installs the core CLI tools via `apt` or
`dnf`; GUI/cask apps are skipped.

<a name="firsttime"></a>

## First Time Setup

This is the slickest setup for managing dotfiles that I've used and it lets you
pick and choose what in your `$HOME` is synced.

First, create a bare repo in a new folder named `.dotfiles`. This holds the
`.git` data and config.

```sh
mkdir "$HOME/.dotfiles"
git init --bare "$HOME/.dotfiles"
```

Add an alias for talking to this bare repo. This is the special sauce of the
setup; when managing my dotfiles I use `dot` instead of `git`. Add it to your
shell profile (it already lives in `.config/zsh/aliases.zsh`).

```sh
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Don't show untracked files (there would be a lot) and add the remote.

```sh
dot config --local status.showUntrackedFiles no
dot remote add origin git@github.com:<Username>/.dotfiles.git
```

Now use the alias to track any file you want synced.

```sh
cd "$HOME"
dot add .vimrc
dot commit -m "Add .vimrc"
dot push
```

<a name="deploy"></a>

## Deploy to a new system

Clone the repo into `$HOME` using the bare-repo method, then run the bootstrap.

```sh
git clone --separate-git-dir="$HOME/.dotfiles" git@github.com:BaDxKaRMa/.dotfiles.git ~
~/bootstrap.sh
```

Some programs create default config files, so the clone can fail if git finds an
existing file in `$HOME`. If that happens, clone to a temp directory, sync, then
delete it.

```sh
git clone --separate-git-dir="$HOME/.dotfiles" git@github.com:BaDxKaRMa/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ "$HOME/"
rm -r tmpdotfiles
~/bootstrap.sh
```

Finally, make zsh your login shell if it isn't already:

```sh
chsh -s "$(command -v zsh)"
```

<a name="bootstrap"></a>

## What bootstrap installs

`bootstrap.sh` is idempotent (safe to re-run) and does the following:

- **Packages**
  - macOS: installs Homebrew if missing, then `brew bundle --file ~/.config/Brewfile`.
  - Linux: installs the core CLI tools via `apt` or `dnf`, and symlinks
    `fd -> fdfind` / `bat -> batcat` into `~/.local/bin` (Debian/Ubuntu name them
    differently).
- **oh-my-zsh** (unattended; keeps your existing `.zshrc`).
- **powerlevel10k** theme, cloned into `~/.config/zsh/themes`.
- **External zsh plugins**, cloned into `~/.config/zsh/plugins`:
  `zsh-defer`, `zsh-completions`, `zsh-autosuggestions`,
  `zsh-syntax-highlighting`, `history-substring-search`,
  `autoswitch_virtualenv`, `fzf-tab`, `autoupdate` (and a link to the built-in
  `ssh-agent` plugin).
- **Monaspace Nerd Font** (via the Brewfile cask on macOS, or a release download
  on Linux).

It does **not** modify your dotfiles; clone those first.

<a name="folderStructure"></a>

## Config Folder File Structure

- `.config`: base folder for user config files
- `.config/zsh`: aliases, functions, fzf, welcome banner, and environment
- `.config/nvim`: LazyVim Neovim setup
- `.config/Brewfile`: macOS package manifest (`brew bundle`)
- `bootstrap.sh`: fresh-machine setup (see above)

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
