#!/bin/bash

printf "\n"
printf "Please make sure you have updated your system before running this installation script."
printf "\n"
printf "Currently only Arch Linux is supported. Other Arch-based distros might work, but YMMV."
printf "\n"
if pacman -Qs paru > /dev/null;
    then echo "Paru installed - continuing with install."
    else echo "Paru not installed - downloading and installing Paru."
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
fi
#install desktop environment packages
paru -S hyprland hypridle hyprpaper hyprshot waybar swaync terminator nwg-drawer-bin xdg-desktop-portal-hyprland archlinux-xdg-menu terminus-font otf-font-awesome ttf-font-awesome qt6ct nwg-look papirus-icons papirus-folders mate-polkit sddm
