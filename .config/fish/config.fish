# Bobthefish settings
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_date_format "+%Y-%m-%d %H:%M"

switch (uname)
    case Darwin
        alias "ls=ls -G"
    case Linux
        eval (dircolors -c ~/.dircolors/my.colors)
        alias "ls=ls --color=auto --group-directories-first"
        alias p="sudo pacman"
        if status --is-interactive
               keychain --eval --quiet -Q id_rsa | source
           end
    end

# Alias
alias sshhosts="grep -w -i -E 'Host|HostName' ~/.ssh/config | sed 's/Host //' | sed 's/HostName //'"
alias cls="clear"
alias slog="script -a ~/logs/Terminal_Logging/(date +"%Y_%m_%d_%I_%M_%p").log"
alias play="asciinema play ~/logs/(ls logs/ | fzf -q '.cast ')"
alias grep="grep -i"
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
  end

export FZF_DEFAULT_OPTS='-e -m --layout=reverse --bind ctrl-a:select-all+accept'
