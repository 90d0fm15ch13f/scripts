#! /bin/bash

ques="$*"
flag=$[RANDOM % 20]

case $flag in
0)
    echo -e "It is certain" ;;
1)
    echo -e "It is decidedly so" ;;
2)
    echo -e "Without a doubt" ;;
3)
    echo -e "Yes, definitely" ;;
4)
    echo -e "You may rely on it" ;;
5)
    echo -e "As I see it, yes" ;;
6)
    echo -e "Most likely" ;;
7)
    echo -e "Outlook good" ;;
8)
	echo -e "Yes" ;;
9)
    echo -e "Signs point to yes" ;;
10)
	echo Reply hazy try again ;;
11)
    echo Ask again later ;;
12)
    echo Better not tell you now ;;
13)
    echo Cannot predict now ;;
14)
    echo Concentrate and ask again ;;
15)
    echo -e "Don\'t count on it" ;;
16)
    echo -e "My reply is no" ;;
17)
    echo -e "My sources say no" ;;
18)
    echo -e "Outlook not so good" ;;
19)
    echo -e "Very doubtful" ;;
esac 
