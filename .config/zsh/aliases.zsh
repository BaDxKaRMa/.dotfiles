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
alias l='ls -lh'
alias la='ls -Ah'
alias lla='ls -lha'
alias lt='ls --tree'
alias lta='lt -a'
alias matrix='cmatrix -n -s 94 -l o'

alias htop='sudo htop'

if [[ "$OSTYPE" != "darwin"* ]]; then
	alias bat='batcat'
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
	alias keka='open -a Keka'
	alias dm='docker-machine'
	alias brewlist="brew leaves | xargs brew deps --include-build --tree"
fi

alias checkcert='CheckCert.sh -c'
alias readcert="openssl x509 -noout -dates -issuer -nameopt lname -nameopt sep_multiline -ext subjectAltName  | sed -e 's/com, DNS/com\n    DNS/g'"

alias vi='nvim'
alias scrap='vi ~/scrap'

alias up='python3 -m http.server'
alias nmapscan='nmap -sC -sV -v -oA nmap/initial --stylesheet /opt/nmapstyle.xsl'
alias toc="gh-md-toc"
alias lower='tr "[:upper:]" "[:lower:]"'
alias prettyjson='python -m json.tool'
alias wp='whatportis'
alias cyberchef='docker run -it -p 8080:80 ghcr.io/gchq/cyberchef:latest'

# jq json to csv with headers
alias jsontocsv="jq --raw-output '(map(keys) | add | unique) as \$cols | map(. as \$row | \$cols | map(\$row[.])) as \$rows | \$cols, \$rows[] | @csv'"

# Auto Complete Alias on TAB
zstyle ':completion:*' completer _expand_alias _complete _ignored

# pip update all outdated
alias pipupdateall='pip3 list -o | grep -v -i warning | cut -f1 -d" " | tr " " "\n" | awk "{if(NR>=3)print}" | cut -d" " -f1 | xargs -n1 pip3 install -U'

# CookieCutter
alias mkpython='cookiecutter https://github.com/badxkarma/python-bootstrap.git'

# Alias Search using grep
alias alias-ls="PS4='+%x:%I>' zsh -i -x -c '' |& grep"
