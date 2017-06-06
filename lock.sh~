# !/bin/bash

#IMAGE=/tmp/i3lock.png
#SCREENSHOT="scrot $IMAGE" # 0.46s
#
##BLURTYPE="0x5" # 7.52s
##BLURTYPE="0x2" # 4.39s
##BLURTYPE="5x2" # 3.80s
##BLURTYPE="2x8" # 2.90s
#BLURTYPE="2x3" # 2.92s
#
#$SCREENSHOT
#
#convert $IMAGE -filter Gaussian -resize 50% \
#         -define filter:sigma=2.5 -resize 200%  /tmp/i3lock.png
#
#i3lock -n -i $IMAGE -R 2000 -F 69 -X 400 -Y 200 -O 0.0 -c '#101218' -o '#191d0f' -w '#572020' -l '#ffffff' -e
#rm $IMAGE

TEMP_FILE=`mktemp --suffix '.png'`
RESOLUTION=`xdpyinfo | awk '/dimensions/{print $2}'`
DPMS_VALUES=`xset q | awk 'BEGIN{FPAT="[0-9]+"} /Standby.*Suspend.*Off/{print $1, $2, $3}'`
SCREEN_TIMEOUT=10

clean_up() {
    rm -f "${TEMP_FILE}"
    xset dpms ${DPMS_VALUES}
}

trap clean_up SIGHUP SIGINT SIGTERM

ffmpeg -loglevel quiet -y -s "${RESOLUTION}" -f x11grab -i "${DISPLAY}" -vframes 1 -vf 'gblur=sigma=8' "${TEMP_FILE}"
xset +dpms dpms "${SCREEN_TIMEOUT}" "${SCREEN_TIMEOUT}" "${SCREEN_TIMEOUT}"
convert "${TEMP_FILE}" -fill '#1f222d' -draw "rectangle 1320,770,1720,970" "${TEMP_FILE}"
convert "${TEMP_FILE}" -fill none -stroke '#383C4A' -strokewidth 5 -draw "rectangle 1320,770,1720,970" "${TEMP_FILE}"
i3lock -I "${SCREEN_TIMEOUT}" -nei "${TEMP_FILE}" -R 2000 -F 69 -X 400 -Y 200 -O 0.0 -c '#101218' -o '#191d0f' -w '#572020' -l '#ffffff' 
clean_up
