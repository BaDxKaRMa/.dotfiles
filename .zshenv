# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh"

#omz autoupdate settings
export ZSH_CUSTOM_AUTOUPDATE_QUIET=true
export ZSH_CUSTOM_AUTOUPDATE_NUM_WORKERS=8

# Virtualenv settings
export AUTOSWITCH_VIRTUAL_ENV_DIR=".virtualenv"

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"

# Editor preference
export EDITOR='vim'

# FZF env lives in ~/.config/zsh/fzf.zsh (single source of truth, sourced by omz).

# Terminal and tool configs
# Debian/Ubuntu ship bat as `batcat`; resolve once so MANPAGER/fzf preview work
# on both macOS and Linux. BAT_CMD is reused by fzf.zsh.
if command -v bat >/dev/null 2>&1; then
  export BAT_CMD=bat
elif command -v batcat >/dev/null 2>&1; then
  export BAT_CMD=batcat
fi
if [[ -n "$BAT_CMD" ]]; then
  export MANPAGER="sh -c 'col -bx | ${BAT_CMD} -l man -p'"
  export BAT_THEME='ansi'
fi
export HOMEBREW_NO_ENV_HINTS=True
export GPG_TTY=$TTY
export ZSH_THEME="powerlevel10k/powerlevel10k"

# PATH additions (use standard PATH syntax rather than add_to_path)
export PATH="$HOME/bin:$PYENV_ROOT/bin:/opt/homebrew/sbin:$PATH"
