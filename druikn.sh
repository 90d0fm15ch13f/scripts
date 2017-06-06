#! /bin/bash

fortune | cowsay > /tmp/message.txt
mutt -s "$1" $2 < /tmp/message.txt
