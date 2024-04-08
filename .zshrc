if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set zsh-autoswitch-virtualenv to store venv in project directory
export AUTOSWITCH_VIRTUAL_ENV_DIR=".virtualenv"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh"

# functions for pathing
# FPATH function
function add_to_fpath() {
    for dir; do
        if [[ -d "$dir" ]] && [[ ":${fpath[*]}:" != *":$dir:"* ]]; then
            fpath=("$dir" $fpath)
        fi
    done
}

# PATH function
function add_to_path() {
    for dir; do
        if [[ -d "$dir" ]] && [[ ":${path[*]}:" != *":$dir:"* ]]; then
            path=("$dir" $path)
        fi
    done
}

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || add_to_path "$PYENV_ROOT/bin"
eval "$(pyenv init -)"

add_to_fpath "${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src"
command -v brew >/dev/null || add_to_fpath "$(brew --prefix)/share/zsh/site-functions"

# plugins for oh-my-zsh
plugins=(
  aws
  fzf-tab
  fzf
  zsh-completions
  zsh-autosuggestions
  git
  sublime
	docker
  history-substring-search
	autoswitch_virtualenv $plugins
  autoupdate
  ssh-agent
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# aws-vault and pipx completion
eval "$(register-python-argcomplete pipx)"
if command -v aws-vault &> /dev/null
then
    eval "$(aws-vault --completion-script-zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# z plugin
[ -f /opt/homebrew/etc/profile.d/z.sh ] && source /opt/homebrew/etc/profile.d/z.sh

# vault completion
[ -f /opt/homebrew/bin/vault ] && complete -o nospace -C /opt/homebrew/bin/vault vault

# more path stuff
add_to_path "$HOME/bin"
add_to_path "/opt/homebrew/opt/node@16/bin"
add_to_path "/opt/homebrew/sbin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
