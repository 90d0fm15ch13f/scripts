#!/bin/bash

#define history file
#HISTFILE=~/.bash_history
#set -o history
#history | tail -n5 
tail -n1 ${HOME}/.bash_history

#xdg-open https://www.google.com/search?q="$(tail -n1 ${HOME}/.bash_history)"
