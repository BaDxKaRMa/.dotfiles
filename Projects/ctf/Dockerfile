FROM kalilinux/kali-rolling:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

# Bring everything up to date and install packages
RUN apt-get update && apt-get -y install \
  zsh \
  kali-linux-large \
  x11-apps \
  burpsuite \
  firefox-esr \
  iputils-ping \
  feroxbuster \
  fonts-noto-color-emoji \
  wkhtmltopdf \
  python3-venv \
  lsd \
  fortune \
  cowsay \
  bat \
  tldr \
  ninja-build \
  gettext \
  cmake \
  unzip \
  curl \
  build-essential \
  cargo \
  ripgrep \
  luarocks \
  fd-find \
  xclip \
  python3.12-venv \
  npm \
  fzf \
  neofetch \
  tmux

# Install Tinyproxy
RUN apt-get install -y tinyproxy

# Configure Tinyproxy
RUN echo "User nobody\nGroup nogroup\nPort 8888\nListen 0.0.0.0\nTimeout 600\nDefaultErrorFile \"/usr/share/tinyproxy/default.html\"\nStatFile \"/usr/share/tinyproxy/stats.html\"\nLogfile \"/var/log/tinyproxy/tinyproxy.log\"\nLogLevel Info\nPidFile \"/var/run/tinyproxy/tinyproxy.pid\"\nMaxClients 100\nMinSpareServers 5\nMaxSpareServers 20\nStartServers 10\nMaxRequestsPerChild 0\nAllow 172.16.0.0/12\nAllow 192.168.0.0/16\nAllow 10.0.0.0/8\nViaProxyName \"tinyproxy\"\n" > /etc/tinyproxy/tinyproxy.conf


ENV PATH="/root/.local/bin:/home/badmin/bin:/usr/games:${PATH}"
RUN python3 -m pip install --user pipx && \
  pipx install git+https://github.com/Tib3rius/AutoRecon.git

RUN python3 -m pip install neovim

# pyenv install
RUN curl https://pyenv.run | bash

# Create our new user and add it to some groups
RUN useradd -G sudo,video badmin --shell /bin/zsh -m
RUN echo "badmin:badmin" | chpasswd

# Clean up packages
RUN apt-get -y autoremove

# Build neovim
RUN git clone https://github.com/neovim/neovim /opt/neovim
WORKDIR /opt/neovim
RUN git checkout stable && \
  make CMAKE_BUILD_TYPE=RelWithDebInfo && \
  cd build && cpack -G DEB && dpkg -i nvim-linux64.deb

RUN wget --output-document /opt/nmapstyle.xsl https://raw.githubusercontent.com/Haxxnet/nmap-bootstrap-xsl/main/nmap-bootstrap.xsl

USER root
RUN service tinyproxy start

# Switch to the badmin user
USER badmin
ENV HOME=/home/badmin
WORKDIR /home/badmin

RUN mkdir -p $HOME/.local/share

# Oh my zsh install
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# powerlevel10k install
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.config/zsh/themes/powerlevel10k

# Install fzf-tab omz plugin
RUN git clone https://github.com/Aloxaf/fzf-tab $HOME/.config/zsh/plugins/fzf-tab

# Install zsh-completions omz plugin
RUN git clone https://github.com/zsh-users/zsh-completions $HOME/.config/zsh/plugins/zsh-completions

# Install zsh-autosuggestions omz plugin
RUN git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.config/zsh/plugins/zsh-autosuggestions

# Install history-substring-search omz plugin
RUN git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.config/zsh/plugins/zsh-history-substring-search

# Install Autoswitch venv omz plugin
RUN git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git $HOME/.config/zsh/plugins/autoswitch_virtualenv

# Install Syntax highlighting omz plugin
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/plugins/zsh-syntax-highlighting

# Install autoupdate omz plugin
RUN git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $HOME/.config/zsh/plugins/autoupdate

# pokemonsay
RUN git clone https://github.com/BaDxKaRMa/pokemonsay.git .pokemonsay
RUN $HOME/.pokemonsay/install.sh

# Install Tmux TPM
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

RUN echo "cache"
# Clone your dotfiles repository into a temporary directory in the badmin user's home directory
RUN git clone --separate-git-dir=$HOME/.dotfiles https://github.com/BaDxKaRMa/.dotfiles.git $HOME/tmpdotfiles

# Copy the files into the badmin user's home directory
RUN rsync --recursive --verbose --exclude '.git' $HOME/tmpdotfiles/ $HOME

RUN rm -rf $HOME/tmpdotfiles/

# Start tmux when the container starts
CMD ["tmux"]
