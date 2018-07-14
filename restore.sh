#!/bin/sh

cp -r ~/git/dotfiles/home/tbejos/. ~/
cp -r ~/git/dotfles/home/tbejos/Wallpapers ~/Wallpapers
cp -r ~/git/dotfiles/home/tbejos/.config ~/
echo "sudo for /etc"
sudo cp -r ~/git/dotfiles/etc /etc
echo "sudo for /boot"
sudo cp -r ~/git/dotfiles/boot /boot
