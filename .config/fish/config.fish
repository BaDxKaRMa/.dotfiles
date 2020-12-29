# OS Specific stuff
switch (uname)
    case Darwin
        #MAC
    case Linux
        #eval (dircolors -c ~/.dircolors/my.colors)
        #alias "ls=ls --color=auto --group-directories-first"
        #alias p="sudo pacman"
        #alias pp="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
        #if status --is-interactive
        #       keychain --eval --quiet -Q id_rsa | source
        #   end
    end

# Alias
alias sshhosts="grep -w -i -E 'Host|HostName' ~/.ssh/config | sed 's/Host //' | sed 's/HostName //'"
alias cls="clear"
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

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
  end

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='-e --multi --cycle --height 75% --border --layout=reverse --bind ctrl-a:select-all+accept'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --no-ignore'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

