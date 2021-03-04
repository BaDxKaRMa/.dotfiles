function myip {
	ip=$(ifconfig | grep 'inet 192' | cut -f 2 -d ' ')
	echo $ip | pbcopy
	echo $ip
}

function fssh {  # Fuzzy-find ssh host via ag and ssh into it
	ssh $(ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf --preview='' --prompt='SSH To > ' --height=40)
}

function bdig { # bulk dig
	str=$(cat ~/scrap)
	if [[ ${str:0:1} == "1" ]] ; then
		for ip in $str ; do
			echo -n $ip,
			dig -x $ip
		done
	else
		for host in $str ; do
			dig $host
		done
	fi
}
