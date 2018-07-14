#!/bin/sh

########## .config ##########

cp -r ~/.config/bspwm ~/git/dotfiles/home/tbejos/.config
cp -r ~/.config/sxhkd ~/git/dotfiles/home/tbejos/.config
cp -r ~/.config/polybar ~/git/dotfiles/home/tbejos/.config
cp -r ~/.config/pulse/daemon.conf ~/git/dotfiles/home/tbejos/.config
cp -r ~/.config/compton.conf ~/git/dotfiles/home/tbejos/.config

########## home ##########

cp -r ~/.xbindkeysrc ~/git/dotfiles/home/tbejos/
cp -r ~/.xinitrc ~/git/dotfiles/home/tbejos/
cp -r ~/.Xresources ~/git/dotfiles/home/tbejos/
cp -r ~/.vimrc ~/git/dotfiles/home/tbejos/
cp -r ~/.fehbg ~/git/dotfiles/home/tbejos/
cp -r ~/Wallpapers/city.jpg ~/git/dotfiles/home/tbejos/Wallpapers

########## boot ##########

cp -r /boot/loader/entries ~/git/dotfiles/boot/loader/

########## etc ##########

cp -r /etc/X11/xorg.conf.d/10-invertscroll.conf ~/git/dotfiles/etc/X11/xorg.conf.d/
