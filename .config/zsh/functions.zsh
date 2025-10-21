function fssh { # Fuzzy-find ssh host via ag and ssh into it
  ssh $(ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf --preview='' --prompt='SSH To > ' --height=20 --border)
}

function bdig { # bulk dig
  [[ -f ~/scrap ]] || {
    echo "~/scrap does not exist."
    return 1
  }
  for item in $(readfile ~/scrap); do
    if [[ $item =~ ^[[:digit:]] ]]; then
      res=$(dig -x $item +short)
    else
      res=$(dig $item +short)
    fi
    paste <(printf %s "$item") <(printf %s "$res")
  done
}

function bwz { # bulk dig
  [[ -f ~/scrap ]] || {
    echo "~/scrap does not exist."
    return 1
  }
  for item in $(readfile ~/scrap); do
    if [[ $item =~ ^[[:digit:]] ]]; then
      whatzone.py $item
    fi
  done
}

function readfile {
  while IFS= read -r line; do
    echo $line
  done <"$1"
}

function myip {
  local ip=$(ifconfig | grep 'inet 10' | cut -f 2 -d ' ')
  echo $ip | pbcopy
  echo $ip
}

function rec {
  if test -z "$argv"; then
    asciinema rec ~/logs/casts/$(date +%F_%T%Z).cast
  else
    asciinema rec ~/logs/casts/$argv.cast
  fi
}

function makegif {
  if test -z "$argv"; then
    agg --font-dir=~/Library/Fonts/ --font-family "MonaspiceKr NFM" ~/logs/casts/$(ls ~/logs/casts/ | fzf -q ".cast ") ~/logs/gifs/latest.gif
  else
    agg --font-dir=~/Library/Fonts/ --font-family "MonaspiceKr NFM" ~/logs/casts/$(ls ~/logs/casts/ | fzf -q ".cast ") ~/logs/gifs/$argv.gif
  fi
}

function play {
  asciinema play ~/logs/casts/$(ls ~/logs/casts/ | fzf -q '.cast ' --preview='' --height=40 --prompt='Which file >')
}

function slog {
  [[ -d ~/logs/slogs ]] || {
    echo "~/logs/slogs/ does not exist."
    return 1
  }
  script -a ~/logs/slogs/$(date +"%Y_%m_%d_%I_%M_%p").log
}

function compare {
  cmp --silent $1 $2 && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'
}

function quser {
  dscl "/Active Directory/lab.local/All Domains/" -read /Users/$argv RecordName RealName JobTitle dsAttrTypeNative:ou EMailAddress | sed 's/dsAttrTypeNative:ou:/Department/g' | sed 's/EMailAddress:/EMailAddress:\n/g' | sed 's/RecordName:/RecordName:\n/g'
}

function qemail {
  dscl "/Active Directory/lab.local/All Domains/" -search /Users EMailAddress "$argv" | awk '{ print $1 }' | sed 's/[")]//g' | xargs
}

function qgroups {
  dscl "/Active Directory/lab.local/All Domains/" -read /Users/$argv dsAttrTypeNative:memberOf
}

function git-list-config {
  git config --list | awk -F '=' '{line[$1]=$0} END {for (key in line) print line[key]}'
}

# functions to set and clear docker env variables
function docker-set-env {
  export DOCKER_TLS_VERIFY="0"
  export DOCKER_HOST="ssh://photon"
  export DOCKER_MACHINE_NAME="photon"
  export DOCKER_CERT_PATH="/Users/karma/.docker/machine/certs"
}

function docker-clear-env {
  unset DOCKER_TLS_VERIFY
  unset DOCKER_HOST
  unset DOCKER_CERT_PATH
  unset DOCKER_MACHINE_NAME
}
