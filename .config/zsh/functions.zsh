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
