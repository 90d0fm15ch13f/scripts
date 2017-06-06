#!/bin/bash

#stop and disable netctl auto
sudo systemctl stop netctl-auto@wlp2s0.service
sudo systemctl disable netctl-auto@wlp2s0.service

#be sure to connect phone
echo "make sure to connect phone"
read $foo

#remove current -wl package
sudo pacman -Rns broadcom-wl-dkms

#connect to android tether
sudo dhcpcd enp0s20u1

#install new -wl package
/home/loki/Documents/scripts/aurgit.sh broadcom-wl-dkms
sudo rmmod b43 b43legacy ssb bcm43xx brcm80211 brcmfmac brcmsmac bcma wl
sudo modprobe wl

#reconnect wifi
sudo wifi-menu wlp2s0

#restart and reenable netctl auto
sudo systemctl start netctl-auto@wlp2s0.service
sudo systemctl enable netctl-auto@wlp2s0.service
