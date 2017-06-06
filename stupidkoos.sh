#!/bin/bash

foo=$*
flag="${foo// /+}"
echo $flag
m="lmgtfy.com/?q=$flag"
echo "$m"
curl -v http://textbelt.com/text -d number=8652439536 -d "message=foo\+bar"

