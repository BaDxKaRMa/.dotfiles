function fssh {  # Fuzzy-find ssh host via ag and ssh into it
	ssh $(ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf --preview='' --prompt='SSH To > ' --height=40)
}

function bdig { # bulk dig
	[[ -f ~/scrap ]] ||  { echo "~/scrap does not exist."; return 1; }
	for item in $(readfile ~/scrap); do 
		if [[ $item =~ ^[[:digit:]] ]] ; then
			dig -x $item
		else
			dig $item
		fi
	done
}

function readfile {
	while IFS= read -r line; do
		echo $line
	done < "$1"
}

function myip {
    local ip=$(ifconfig | grep 'inet 10' | cut -f 2 -d ' ')
    echo $ip | pbcopy
    echo $ip
}

function rec {
    if test -z "$argv" ; then
        asciinema rec ~/logs/$(date +%F_%T%Z).cast
    else
        asciinema rec ~/logs/$argv.cast
	fi
}

function makegif {
    if test -z "$argv" ; then
        asciicast2gif ~/logs/$(ls logs/ | fzf -q ".cast ") ~/logs/gifs/latest.gif
    else
        asciicast2gif ~/logs/$(ls logs/ | fzf -q ".cast ") ~/logs/gifs/$argv.gif
	fi
}

function play {
	asciinema play ~/logs/$(ls ~/logs/ | fzf -q '.cast ' --preview='' --height=40 --prompt='Which file >')
}
