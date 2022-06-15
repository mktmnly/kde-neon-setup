#! /usr/bin/env bash

# Fix MAN-DB Auto-Update #
echo "Allowing MAN-DB to Auto-Update..."; sleep 3
sudo touch /var/lib/man-db/auto-update; clear

# System Update #
echo "Bringing System Current..."; sleep3
sudo apt update; sudo apt dist-upgrade; clear

# Enable Backports #
echo "Enabling Backports..."; sleep 3
sudo tee -a /etc/apt/sources.list <<EOF
deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
EOF

sudo tee -a /etc/apt/preferences <<EOF
Package: *
Pin: release a=focal-backports
Pin-Priority: 500
EOF

clear

# Enable PPAs #
echo "Enabling PPAs..."; sleep 3
sudo add-apt-repository ppa:damentz/liquorix; clear # Liquorix Kernel
sudo apt-add-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:kisak/kisak-mesa; clear # Latest MESA Drivers
sudo add-apt-repository ppa:libretro/stable; clear # Latest RetroArch
sudo add-apt-repository ppa:nicotine-team/stable; clear # Nicotine+
sudo add-apt-repository ppa:ubuntustudio-ppa/backports; clear
sudo add-apt-repository ppa:wereturtle/ppa; clear # GhostWriter

# Enable i386 (Steam) #
echo "Enabling Multi-Arch Support for Steam"; sleep 3
sudo dpkg --add-architecture i386; clear

# System Update (Sanity Check) #
echo "Bringing System Current Again..."; sleep 3
sudo apt update; sudo apt dist-upgrade; clear

# CLI Packages #
echo "Installing Packages..."; sleep 3
sudo apt install ack argyll beets build-essential cmus dkms fish htop inxi neofetch p7zip-rar ttf-mscorefonts-installer; clear

# GUI Packages #
sudo apt install audacity blender darktable ghostwriter inkscape libreoffice libreoffice-qt5 nicotine obs-studio retroarch speedcrunch steam xterm-; clear

# KDE Packages #
sudo apt install kalendar kate kdenlive krita ktorrent; clear

# Misc Packages #
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O ~/Downloads/vscode.deb
wget 'https://www.hamrick.com/files/vuex6497.deb' -O ~/Downloads/vuescan.deb
sudo apt install ~/Downloads/*.deb; clear

# Liquorix Kernel #
echo "Installing Liquorix Kernel..."; sleep 3
sudo apt install linux-image-liquorix-amd64 linux-headers-liquorix-amd64; clear

# Post-Install #
echo "Don't forget to reboot!"
