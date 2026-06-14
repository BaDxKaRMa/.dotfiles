MYUNAME=$(uname -nmsr)
MYUPTIME=$(uptime)
OUTPUT=$(echo -e "$MYUNAME\n$MYUPTIME")
if command -v pokemonsay >/dev/null 2>&1; then
  echo $OUTPUT | pokemonsay
else
  echo $OUTPUT
fi
