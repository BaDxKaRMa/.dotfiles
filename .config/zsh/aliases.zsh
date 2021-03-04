alias cls="clear"
alias sshhosts="grep -w -i -E 'Host|HostName' ~/.ssh/config | sed 's/Host //' | sed 's/HostName //'"

# alias slog="script -a ~/logs/Terminal_Logging/$(date +"%Y_%m_%d_%I_%M_%p").log"

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

alias htop='sudo htop'

alias keka='open -a Keka'

alias brewlist="brew leaves | xargs brew deps --include-build --tree"

alias checkcert='CheckCert.sh -c'

alias vi='vim'

# Work
alias wz='whatzone.py'
alias f5='f5.py'
