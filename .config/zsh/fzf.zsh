# Setup fzf
# ---------

# Check for M1
if [ -d "/opt/homebrew/" ] 
then
	if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
		export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
	fi
	[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null
	source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
fi

# Check for Intel
if [ -d "/usr/local/Homebrew/" ] 
then
	if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
		export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
	fi
	[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
	source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

