# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

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

# load z
[[ -e "/usr/local/etc/profile.d/z.sh" ]] && . /usr/local/etc/profile.d/z.sh
[[ -e "/opt/homebrew/etc/profile.d/z.sh" ]] && . /opt/homebrew/etc/profile.d/z.sh
