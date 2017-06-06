#! /bin/bash

flag=$[RANDOM % 2]
if [ flag = 1 ]; then
	echo heads
else
	echo tails
fi
