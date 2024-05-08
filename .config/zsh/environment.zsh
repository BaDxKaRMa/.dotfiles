# Vim > Vi
export EDITOR='vim'

# FZF
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
export FZF_CTRL_R_OPTS='-i -e --cycle --height 50% --border --layout=reverse --preview='''
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --no-ignore'
bindkey "ç" fzf-cd-widget
export FZF_COMPLETION_TRIGGER='**'

# Set bat for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Bat Theme
export BAT_THEME='ansi'

# Homebrew no hints
export HOMEBREW_NO_ENV_HINTS=True

# Fix for gpg signing
export GPG_TTY=$TTY

# load z
[[ -e "/usr/local/etc/profile.d/z.sh" ]] && . /usr/local/etc/profile.d/z.sh
[[ -e "/opt/homebrew/etc/profile.d/z.sh" ]] && . /opt/homebrew/etc/profile.d/z.sh
