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
alias matrix='/Users/xrxh140/Library/Python/2.7/bin/unimatrix -n -s 94 -l o -f'

alias htop='sudo htop'

alias keka='open -a Keka'

alias brewlist="brew leaves | xargs brew deps --include-build --tree"

alias checkcert='CheckCert.sh -c'

alias vi='vim'

# Work
alias wz='whatzone.py'
alias f5='f5.py'
alias scrap='vi ~/scrap'
alias ipdb='IPDB.py'

# Auto Complete Alias on TAB
zstyle ':completion:*' completer _expand_alias _complete _ignored
