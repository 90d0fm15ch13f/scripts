#!/bin/sh

#for multiple copies, we don't want to scp the file like a billion times
if [ $# -eq 1 ]; then
	flag=1
else
	flag="${2}"
fi

cp "${1}" ~/tmp/toprint
/home/loki/Documents/scripts/print.sh

COUNTER=0
while [ $COUNTER -lt $flag ]; do
	/home/loki/Documents/scripts/actualprint.sh
	let COUNTER=COUNTER+1
done
echo -e "\n"
