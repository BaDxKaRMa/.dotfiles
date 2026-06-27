# Setup fzf
# ---------
# Mac (brew): /opt/homebrew/opt/fzf/  -- Linux (apt fzf): /usr/share/doc/fzf/examples/
# Source whichever exists; tolerate fzf not installed at all.
if [[ -d /opt/homebrew/opt/fzf ]]; then
  if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
  fi
  [[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]] && source /opt/homebrew/opt/fzf/shell/completion.zsh
  [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
elif [[ -d /usr/share/doc/fzf/examples ]]; then
  [[ -f /usr/share/doc/fzf/examples/completion.zsh ]] && source /usr/share/doc/fzf/examples/completion.zsh
  [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]] && source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

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
--preview '([[ -f {} ]] && (${BAT_CMD:-bat} --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS='-i -e --cycle --height 50% --border --layout=reverse --preview='''
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --no-ignore'
bindkey "ç" fzf-cd-widget
export FZF_COMPLETION_TRIGGER='**'

# load z
[[ -e "/usr/local/etc/profile.d/z.sh" ]] && . /usr/local/etc/profile.d/z.sh
[[ -e "/opt/homebrew/etc/profile.d/z.sh" ]] && . /opt/homebrew/etc/profile.d/z.sh
