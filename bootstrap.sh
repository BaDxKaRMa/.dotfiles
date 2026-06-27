#!/usr/bin/env bash
# bootstrap.sh - set up this dotfiles environment on a fresh macOS or Linux box.
#
# Idempotent: safe to re-run. It installs the packages, oh-my-zsh, the
# powerlevel10k theme, and the external zsh plugins this config expects.
# It does NOT manage the dotfiles themselves; clone those first (see README).
set -euo pipefail

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.config/zsh}"
OMZ_DIR="${ZSH:-$HOME/.oh-my-zsh}"
BREWFILE="$HOME/.config/Brewfile"
OS="$(uname -s)"

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[warn]\033[0m %s\n' "$*" >&2; }
have() { command -v "$1" >/dev/null 2>&1; }

# --- packages --------------------------------------------------------------
install_macos_packages() {
  if ! have brew; then
    log "Installing Homebrew"
    NONINTERACTIVE=1 /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
  fi
  if [[ -f "$BREWFILE" ]]; then
    log "Installing packages from $BREWFILE (brew bundle)"
    brew bundle --file "$BREWFILE" || warn "brew bundle had failures; see output above"
  else
    warn "No Brewfile at $BREWFILE; skipping brew bundle"
  fi
}

install_linux_packages() {
  # Core CLI tools the shell config calls. GUI apps and casks from the Brewfile
  # are intentionally skipped on Linux; install those by hand if you want them.
  local apt_pkgs=(zsh git curl wget fzf fd-find bat ripgrep jq tree tmux neovim
                  silversearcher-ag gnupg htop mtr nmap unzip build-essential)
  local dnf_pkgs=(zsh git curl wget fzf fd-find bat ripgrep jq tree tmux neovim
                  the_silver_searcher gnupg2 htop mtr nmap unzip)
  if have apt-get; then
    log "Installing packages via apt"
    sudo apt-get update -y && sudo apt-get install -y "${apt_pkgs[@]}"
  elif have dnf; then
    log "Installing packages via dnf"
    sudo dnf install -y "${dnf_pkgs[@]}"
  else
    warn "No apt-get or dnf; install the shell deps manually (see README)"
    return
  fi
  link_debian_binaries
}

# Debian/Ubuntu ship these under different binary names than the config uses.
link_debian_binaries() {
  mkdir -p "$HOME/.local/bin"
  if have fdfind && [[ ! -e "$HOME/.local/bin/fd" ]]; then
    ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
    log "linked fd -> fdfind in ~/.local/bin"
  fi
  if have batcat && [[ ! -e "$HOME/.local/bin/bat" ]]; then
    ln -s "$(command -v batcat)" "$HOME/.local/bin/bat"
    log "linked bat -> batcat in ~/.local/bin"
  fi
}

install_nerd_font_linux() {
  if fc-list 2>/dev/null | grep -qi monaspace; then
    log "Monaspace Nerd Font already present"; return
  fi
  have curl && have unzip || { warn "need curl+unzip for the font; skipping"; return; }
  log "Installing Monaspace Nerd Font"
  local dir="$HOME/.local/share/fonts" zip="/tmp/Monaspace.zip"
  mkdir -p "$dir"
  if curl -fsSL \
      "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Monaspace.zip" \
      -o "$zip"; then
    unzip -oq "$zip" -d "$dir/Monaspace" && fc-cache -f >/dev/null 2>&1 || true
    rm -f "$zip"
  else
    warn "could not download Monaspace Nerd Font; install it manually"
  fi
}

# --- oh-my-zsh + theme + plugins -------------------------------------------
install_omz() {
  if [[ -d "$OMZ_DIR" ]]; then
    log "oh-my-zsh already installed"
  else
    log "Installing oh-my-zsh"
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
      "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}

clone_or_update() {  # repo dest
  if [[ -d "$2/.git" ]]; then
    git -C "$2" pull --ff-only --quiet || warn "could not update $2"
  else
    git clone --depth 1 --quiet "$1" "$2" && log "cloned $(basename "$2")"
  fi
}

install_plugins() {
  local p="$ZSH_CUSTOM_DIR/plugins" t="$ZSH_CUSTOM_DIR/themes"
  mkdir -p "$p" "$t"
  clone_or_update https://github.com/romkatv/powerlevel10k.git                  "$t/powerlevel10k"
  clone_or_update https://github.com/romkatv/zsh-defer.git                      "$p/zsh-defer"
  clone_or_update https://github.com/zsh-users/zsh-completions.git              "$p/zsh-completions"
  clone_or_update https://github.com/zsh-users/zsh-autosuggestions.git          "$p/zsh-autosuggestions"
  clone_or_update https://github.com/zsh-users/zsh-syntax-highlighting.git      "$p/zsh-syntax-highlighting"
  clone_or_update https://github.com/zsh-users/zsh-history-substring-search.git "$p/history-substring-search"
  clone_or_update https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git "$p/autoswitch_virtualenv"
  clone_or_update https://github.com/Aloxaf/fzf-tab.git                         "$p/fzf-tab"
  clone_or_update https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git   "$p/autoupdate"
  # ssh-agent is a built-in omz plugin, but .zshrc sources it from custom; link it.
  if [[ -d "$OMZ_DIR/plugins/ssh-agent" && ! -e "$p/ssh-agent" ]]; then
    ln -s "$OMZ_DIR/plugins/ssh-agent" "$p/ssh-agent"
  fi
}

main() {
  case "$OS" in
    Darwin) install_macos_packages ;;
    Linux)  install_linux_packages; install_nerd_font_linux ;;
    *)      warn "Unsupported OS: $OS (skipping package install)" ;;
  esac
  install_omz
  install_plugins
  log "Done. Start a new shell (or run: exec zsh)."
  case "${SHELL:-}" in
    *zsh) ;;
    *) warn "Your login shell isn't zsh. Set it with: chsh -s \"$(command -v zsh)\"" ;;
  esac
}

main "$@"
