function myip {
	ip=$(ifconfig | grep 'inet 192' | cut -f 2 -d ' ')
	echo $ip | pbcopy
	echo $ip
}

function fssh {  # Fuzzy-find ssh host via ag and ssh into it
	ssh $(ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf --preview='' --prompt='SSH To > ' --height=40)
}

function bdig { # bulk dig
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
