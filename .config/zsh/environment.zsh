# Vim > Vi
export EDITOR='vim'

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS='-e --cycle --height 76% --border --layout=reverse'
export FZF_DEFAULT_OPTS="--ansi --multi --layout=reverse --bind ctrl-a:select-all+accept --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --no-ignore'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
bindkey "ç" fzf-cd-widget
export FZF_COMPLETION_TRIGGER='**'

# Set bat for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Fix for gpg signing
export GPG_TTY=$TTY
