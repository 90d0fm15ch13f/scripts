grep $1 /proc/net/wireless | awk '{ print int($3 * 100 / 70) }'
