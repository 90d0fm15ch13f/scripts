#!/usr/bin/expect -f

#should ssh into a bb136 box and then print a file
spawn scp /home/loki/tmp/toprint lhondorf@imagine.mines.edu:~/tmp
expect "100%"

#now ssh into imagine and place the file on a bbbox
spawn ssh lhondorf@imagine.mines.edu
expect "$ "
send "scp ~/tmp/toprint lhondorf@bb136-22:~/tmp\r"
expect "100%"
send "exit\r"

exit
