#!/bin/bash

## Example locker script -- demonstrates how to use the --transfer-sleep-lock
## option with i3lock's forking mode to delay sleep until the screen is locked.
#
### CONFIGURATION ##############################################################
#
## Options to pass to i3lock
#i3lock_options="-I ${SCREEN_TIMEOUT} -nei ${TEMP_FILE} -R 2000 -F 69 -X 400 -Y 200 -O 0.0 -c '#101218' -o '#191d0f' -w '#572020' -l '#ffffff'"
#
#  TEMP_FILE=`mktemp --suffix '.png'`
#  RESOLUTION=`xdpyinfo | awk '/dimensions/{print $2}'`
#  DPMS_VALUES=`xset q | awk 'BEGIN{FPAT="[0-9]+"} /Standby.*Suspend.*Off/{print $1, $2, $3}'`
#  SCREEN_TIMEOUT=5
## Run before starting the locker
#pre_lock() {
#    #mpc pause
#
#    #convert ~/tmp/i3lock.png -filter Gaussian -resize 50% -define filter:sigma=2.5 -resize 200% ~/tmp/i3lock.png
#wait 1
#    ffmpeg -loglevel quiet -y -s "${RESOLUTION}" -f x11grab -i "${DISPLAY}" -vframes 1 -vf 'gblur=sigma=8' ~/tmp/i3lock.png
#wait 3
#    return
#}
#
## Run after the locker exits
#post_lock() {
#    rm -f "${TEMP_FILE}"
#    xset dpms ${DPMS_VALUES} 
#    return
#}
#
################################################################################
#
#pre_lock
#
## We set a trap to kill the locker if we get killed, then start the locker and
## wait for it to exit. The waiting is not that straightforward when the locker
## forks, so we use this polling only if we have a sleep lock to deal with.
#if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
#    kill_i3lock() {
#        pkill -xu $EUID "$@" i3lock
#    }
#
#    trap kill_i3lock TERM INT
#
#    # we have to make sure the locker does not inherit a copy of the lock fd
#    i3lock $i3lock_options {XSS_SLEEP_LOCK_FD}<&-
#
#    # now close our fd (only remaining copy) to indicate we're ready to sleep
#    exec {XSS_SLEEP_LOCK_FD}<&-
#
#    while kill_i3lock -0; do
#        sleep 0.5
#    done
#else
#    trap 'kill %%' TERM INT
#    i3lock $i3lock_options &
#    wait
#fi
#
#post_lock
# Example locker script -- demonstrates how to use the --transfer-sleep-lock
# option with i3lock's forking mode to delay sleep until the screen is locked.

## CONFIGURATION ##############################################################

# Run before starting the locker
pre_lock() {
    #mpc pause
    return
}

# Run after the locker exits
post_lock() {
    return
}

###############################################################################

pre_lock

# We set a trap to kill the locker if we get killed, then start the locker and
# wait for it to exit. The waiting is not that straightforward when the locker
# forks, so we use this polling only if we have a sleep lock to deal with.
if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
    kill_i3lock() {
        pkill -xu $EUID "$@" i3lock
    }

    trap kill_i3lock TERM INT

    # we have to make sure the locker does not inherit a copy of the lock fd
    i3lock-custom {XSS_SLEEP_LOCK_FD}<&-

    # now close our fd (only remaining copy) to indicate we're ready to sleep
    exec {XSS_SLEEP_LOCK_FD}<&-

    while kill_i3lock -0; do
        sleep 0.5
    done
else
    trap 'kill %%' TERM INT
    i3lock -n &
    wait
fi

post_lock
