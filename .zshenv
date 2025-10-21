# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh"

# Virtualenv settings
export AUTOSWITCH_VIRTUAL_ENV_DIR=".virtualenv"

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"

# Editor preference
export EDITOR='vim'

# FZF configurations
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --no-ignore'
export FZF_DEFAULT_OPTS="
-i
--ansi
--multi
--exact
--layout=reverse
--bind '?:toggle-preview'
--bind ctrl-a:select-all+accept
--preview-window 'right:60%'
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS='-i -e --cycle --height 50% --border --layout=reverse --preview='
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --no-ignore'
export FZF_COMPLETION_TRIGGER='**'

# Terminal and tool configs
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME='ansi'
export HOMEBREW_NO_ENV_HINTS=True
export GPG_TTY=$TTY
export ZSH_THEME="powerlevel10k/powerlevel10k"

# PATH additions (use standard PATH syntax rather than add_to_path)
export PATH="$HOME/bin:$PYENV_ROOT/bin:/opt/homebrew/sbin:$PATH"
