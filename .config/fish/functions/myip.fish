function myip --description 'Return my IP'
    set -g ip (ifconfig | grep 'inet 10' | cut -f 2 -d ' ')
    echo $ip | pbcopy
    echo $ip
end
