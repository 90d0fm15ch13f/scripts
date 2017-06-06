#!/bin/sh

search=$(xclip -o)
xdg-open https://www.google.com/search?q="${search}"
