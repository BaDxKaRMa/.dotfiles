# Cache completions for faster startup
autoload -Uz compinit
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -f "$zcompdump" ]] && [[ $(date +'%Y-%m-%d') != $(date -r "$zcompdump" +'%Y-%m-%d') ]]; then
  compinit
else
  compinit -C
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/.config/zsh/functions.zsh"

if command -v brew >/dev/null; then
  BREW_PREFIX=${BREW_PREFIX:-$(brew --prefix)}
  add_to_fpath "$BREW_PREFIX/share/zsh/site-functions"
fi

add_to_path "$HOME/bin"
add_to_path "/opt/homebrew/opt/node@16/bin"
add_to_path "/opt/homebrew/sbin"

add_to_fpath "${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src"


# plugins for oh-my-zsh
plugins=(
  zsh-defer
  git
  sublime
  zsh-completions
  fzf
  history-substring-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# Add time delay to prevent all deferred items from loading at once
zsh-defer -t 1.0 source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv/autoswitch_virtualenv.plugin.zsh"
zsh-defer -t 1.5 source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/ssh-agent/ssh-agent.plugin.zsh"
zsh-defer -t 2.0 source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab/fzf-tab.plugin.zsh"
zsh-defer -t 2.5 source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoupdate/autoupdate.plugin.zsh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iterm2 shell integration
zsh-defer 'test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"'

# z plugin
zsh-defer '[ -f /opt/homebrew/etc/profile.d/z.sh ] && source /opt/homebrew/etc/profile.d/z.sh'

# vault completion
zsh-defer '[ -f /opt/homebrew/bin/vault ] && complete -o nospace -C /opt/homebrew/bin/vault vault'


zsh-defer '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'
