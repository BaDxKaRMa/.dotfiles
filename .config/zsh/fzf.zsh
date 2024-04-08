# Setup fzf
# ---------

# Check for M1
if [ -d "/opt/homebrew/" ]; then
	if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
		add_to_path "/opt/homebrew/opt/fzf/bin"
	fi
	[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2>/dev/null
	source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
fi

# Check for Intel
if [ -d "/usr/local/Homebrew/" ]; then
	if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
		add_to_path "/usr/local/opt/fzf/bin"
	fi
	[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2>/dev/null
	source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

export FZF_DEFAULT_OPTS='-i -m'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --color=always --group-dirs first $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
