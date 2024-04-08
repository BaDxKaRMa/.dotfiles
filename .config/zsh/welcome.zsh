clear
MYUNAME=$(uname -nmsr)
MYUPTIME=$(uptime)
OUTPUT=$(echo -e "$MYUNAME\n$MYUPTIME")
echo $OUTPUT | pokemonsay
