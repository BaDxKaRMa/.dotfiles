<div align="center">
    <h1>Dotfiles with the Sauce!</h1>
</div>

[![HitCount](http://hits.dwyl.com/badxkarma/modern-awesome.svg)](http://hits.dwyl.com/badxkarma/modern-awesome)

## Contents ##
1. [Details](#details)
2. [Dependencies](#dependencies)
3. [First Time Setup](#firsttime)
4. [Installation](#installation)
5. [Folder Structure](#folderStructure)
6. [My Preferred Applications](#applications)
7. [Notes](#notes)

<a name="details"></a>
## Details ##
+ **OS**: MacOS
+ **Shell**: zsh (omz)
+ **Terminal**: iTerm2
+ **Font**: Hack Nerd Font (Patched)

<a name="dependencies"></a>
## Dependencies ##

|Dependency|Description|
|:----------:|:-------------:|
|`git`|You need to download the repo|
|`curl`|Download the web things|

<a name="firsttime"></a>
## First Time Setup ##
I've turned away from symlinking everything because that was going to get unwieldy. Instead, I'm using a bare repo. These are the steps to build it.  

First, we create a bare repo in a new folder named `.dotfiles`.

```
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```  

Next, I added an alias that I use for this repo. This is the special sauce of this setup.

```
alias dot='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

```

Next, don't show untracked files (because that would be a lot) and add the remote. 

```
dot config --local status.showUntrackedFiles no
dot remote add origin git@github.com:BaDxKaRMa/.dotfiles.git
```

Now, you can use the alias to add any file to wish you start syncing. Commit and push to see the results in your GitHub Repo.

```
cd $HOME
dot add .vimrc
dot commit -m "Add .vimrc"
dot push
```

<a name="installation"></a>
## Installation
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
## Folder File Structure ##
+ `rc.lua`: Contains the script that runs when awesome starts (essentially links all the other files together)

<a name="applications"></a>
## My Preferred Applications ##
+ **Text Editor - Vim:** It's just cool and easy to use
+ **Other Text Editor - Sublime Text:** It's a better Notepad++
+ **Web Browser - Safari**: Safari (Firefox backup)
+ **Terminal - iTerm2**: It should just be stock

<a name="notes"></a>
## Notes ##

