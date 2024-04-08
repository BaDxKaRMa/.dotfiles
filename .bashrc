# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

if [ -t 1 ]; then
	export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"
fi

# du with mount exclude and sort
function dusort () {
    DIR=$(echo $1 | sed 's#\/$##')
    du -scxh $(mount | awk '{print $3}' | sort | uniq \
     | sed 's#/# --  exclude=/#') $DIR/* | sort -h
}

alias sshhosts="grep -w -i -E 'Host|HostName' ~/.ssh/config | sed 's/Host //' | sed 's/HostName //'"
alias cls="clear"
alias la='ls -lah'
alias ..='cd ..'
alias grep='grep --color=auto'
alias wz='whatzone.py'

# Extracts any archive(s) (if unp isn't installed)
extract () {
    for archive in $*; do
        if [ -f $archive ] ; then
            case $archive in
                *.tar.bz2)   tar xvjf $archive    ;;
                *.tar.gz)    tar xvzf $archive    ;;
                *.bz2)       bunzip2 $archive     ;;
                *.rar)       rar x $archive       ;;
                *.gz)        gunzip $archive      ;;
                *.tar)       tar xvf $archive     ;;
                *.tbz2)      tar xvjf $archive    ;;
                *.tgz)       tar xvzf $archive    ;;
                *.zip)       unzip $archive       ;;
                *.Z)         uncompress $archive  ;;
                *.7z)        7z x $archive        ;;
                *)           echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
