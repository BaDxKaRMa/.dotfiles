## Step 1 after fresh install
The first thing you want to do is update the system. 
`sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y` 

# Repos to add
```
sudo apt-add-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
```

# Install Fish Shell
```
sudo apt install fish
chsh -s (which fish)
```

# Programs to install
`sudo apt update && sudo apt install -y  gnome-tweak-tool vlc ffmpeg nautilus-admin timeshift openvpn network-manager-openvpn network-manager-openvpn-gnome code ttf-mscorefonts-installer ubuntu-restricted-extras obs-studio python3-pip alacritty htop fzf cowsay fortune fonts-powerline jq tldr fdclone bat`

# PokemonSay Install
```
git clone http://github.com/possatti/pokemonsay
cd pokemonsay
./install.sh
```

# LSD Install
```
sudo dpkg -i Downloads/lsd_0.19.0_amd64.deb
```

## Configure Timeshift
`sudo timeshift-gtk` 

## Config git
```
git config --global user.name "BaDxKaRMa"
git config --global user.email bad87karma@gmail.com
```
## New SSH Keys
`ssh-keygen -o -t rsa -b 4096 -C karma@pop-os`

## Clone dotfiles repo
```
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot config --local status.showUntrackedFiles no
```

## Fisher Install
`curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher IlanCosman/tide oh-my-fish/plugin-aws oh-my-fish/plugin-bang-bang PatrickF1/fzf.fish jhillyerd/plugin-git mar
kcial/upto`


## Sublime-Text Install
```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```
