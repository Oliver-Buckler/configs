#!/bin/bash
runlevel=$(id -u)

if [ $runlevel != "0" ]; then
    echo "We need root!" >&2
    exit 1
fi
     
echo -e "Starting my post-OS installation script...\n"

echo -e "\n#==> System upgrade..."
dnf -y upgrade

echo -e "\n#==> Installing Graphical applications..."
# Graphical
dnf -y install tmux thunderbird firefox thunar vlc xfce4-terminal libreoffice gimp

echo -e "\n#==> Installing Non-Graphical applications..."
# Non-Graphical
dnf -y install vim git python php nmap figlet mc

echo -e "\n#==> Installing PIP applications..."
pip install pyradio 

echo -e "\n#==> Installing Group packages..."
# Groups
dnf -y groupinstall "C Development Tools and Libraries" "Administration Tools" "Development Tools"

#Fonts
echo -e "\n#==> Installing fonts..."
dnf -y install google-droid-*-fonts

#Configs
echo -e "\n#==> Installing my custom rpms..."
#rpm -ivh 

echo -e "\n#==> All finished!"
