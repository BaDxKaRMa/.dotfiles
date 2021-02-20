# Welcome
echo -e '\033[1;30m'$(uname -nmsr)'\033[0m'
echo -e '\033[1;30m'$(uptime)'\033[0m'



fortune | pokemonsay

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
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    history-substring-search
    )

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vim'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS='-e --cycle --height 76% --border --layout=reverse'
export FZF_DEFAULT_OPTS="--ansi --multi --layout=reverse --bind ctrl-a:select-all+accept --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --no-ignore'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
bindkey "ç" fzf-cd-widget
export FZF_COMPLETION_TRIGGER='**'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm2 Shell Integration init
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf init
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
