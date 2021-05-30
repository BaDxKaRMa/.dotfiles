alias cls="clear"
alias sshhosts="grep -w -i -E 'Host|HostName' ~/.ssh/config | sed 's/Host //' | sed 's/HostName //'"

alias grep="grep -i"

alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dcam='dot commit -a -m'
alias dst='dot status'
alias dl='dot pull'
alias dp='dot push'
alias da='dot add'

alias ls='lsd --group-dirs first'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias lta='lt -a'
alias matrix='cmatrix -n -s 94 -l o'

alias htop='sudo htop'
alias dm='docker-machine'

alias keka='open -a Keka'

alias brewlist="brew leaves | xargs brew deps --include-build --tree"

alias checkcert='CheckCert.sh -c'

alias vi='vim'
alias scrap='vi ~/scrap'

alias up='python3 -m http.server'

# Auto Complete Alias on TAB
zstyle ':completion:*' completer _expand_alias _complete _ignored
