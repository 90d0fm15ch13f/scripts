#!/usr/bin/expect -f

#ssh into imagine and immediately into the bbbox to print
spawn ssh -t lhondorf@imagine.mines.edu "ssh lhondorf@bb136-22"
expect "$ "
send "lp -d bb136-printer ~/tmp/toprint\r"
expect "$ "
send "exit\r"

exit
