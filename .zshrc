if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    git
    sublime
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    zsh-history-substring-search
    )

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vim'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='-e --multi --cycle --height 75% --border --layout=reverse --bind ctrl-a:select-all+accept'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --no-ignore'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls="clear"
alias sshhosts="grep -w -i -E 'Host|HostName' ~/.ssh/config | sed 's/Host //' | sed 's/HostName //'"
alias slog="script -a ~/logs/Terminal_Logging/(date +"%Y_%m_%d_%I_%M_%p").log"
alias play="asciinema play ~/logs/(ls ~/logs/ | fzf -q '.cast ')"
alias grep="grep -i"
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='lsd --group-dirs first'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias htop='sudo htop'
alias keka='open -a Keka'
alias brewlist="brew leaves | xargs brew deps --include-build --tree"
alias checkcert='CheckCert.sh -c'

# OMZ Plug ins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
