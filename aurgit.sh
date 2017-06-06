#! /bin/bash

cd ~/builds
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/"${1}".tar.gz
tar -xvf "${1}".tar.gz
cd "${1}"
makepkg -sri
read -r -p "Would you like to update other aur packages? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
    yaourt -Syu --aur
fi
