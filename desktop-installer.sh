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
    cd ..
fi

#install desktop environment packages
paru -S --needed hyprland hypridle hyprpaper hyprshot waybar swaync terminator nwg-drawer-bin xdg-desktop-portal-hyprland archlinux-xdg-menu noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra terminus-font otf-font-awesome ttf-font-awesome qt6ct papirus-icon-theme papirus-folders mate-polkit sddm network-manager-applet dolphin dolphin-plugins breeze breeze-gtk breeze-icons breeze5 qqc2-breeze-style nwg-look pavucontrol kwallet archlinux-themes-sddm

systemctl enable sddm
sudo cp sddm-conf/sddm.conf /etc/sddm.conf

#copy configs
cp -r conf/* ~/.config
cp .gtkrc-2.0 ~/.gtkrc-2.0
papirus-folders -C red
./apply-gtk-settings-from-configs.sh

#install additional software
paru -S --needed firefox kate mpv mission-center
