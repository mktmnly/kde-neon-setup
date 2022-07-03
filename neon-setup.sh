#! /usr/bin/env bash

# Enable Manual DB Auto-Update #
echo "Allowing MAN-DB to Auto-Update..."; sleep 3
sudo touch /var/lib/man-db/auto-update; sleep 3; clear

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

sleep 3; clear

# System Update #
echo "Bringing System Current..."; sleep 3
sudo apt update; sudo apt dist-upgrade; sleep 3; clear

# Enable Personal Package Archives (PPAs) #
echo "Enabling PPAs..."; sleep 3
sudo add-apt-repository ppa:damentz/liquorix
sudo add-apt-repository ppa:flatpak/stable
sudo add-apt-repository ppa:libretro/stable
sudo add-apt-repository ppa:obsproject/obs-studio
sleep 3; clear

# Enable Darktable Release Repo (OBS) ##
echo 'deb http://download.opensuse.org/repositories/graphics:/darktable/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/graphics:darktable.list
curl -fsSL https://download.opensuse.org/repositories/graphics:darktable/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/graphics_darktable.gpg > /dev/null
sudo apt update; sleep 3; clear

# System Update (Sanity Check) #
echo "Bringing System Current Again..."; sleep 3
sudo apt update; sudo apt dist-upgrade; sleep 3; clear

# Install Packages #
echo "Installing Packages..."; sleep 3
sudo apt update; sudo apt full-upgrade
sudo apt install ack argyll audacity build-essential darktable gimp gimp-gmic gimp-lensfun gimp-plugin-registry gimp-texturize htop inkscape inxi kate kdenlive krita ktorrent libreoffice neofetch obs-studio retroarch
sleep 3; clear

# Install Manual Packages #
echo "Installing Manual Packages..."; sleep 3
mkdir -p ManualPackages/; cd ManualPackages/
wget http://ftp.us.debian.org/debian/pool/main/p/pygtk/python-gtk2_2.24.0-5.1+b1_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/g/gimp/gimp-python_2.10.8-2_amd64.deb
wget https://www.hamrick.com/files/vuex6497.deb
sudo apt install ./*.deb
cd ..
sleep 3; clear

# Install/Enable Flatpaks #
echo "Installing/Enabling Flatpaks..."; sleep 3
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user \
com.fightcade.Fightcade \
com.valvesoftware.Steam \
com.valvesoftware.Steam.CompatibilityTool.Proton \
com.valvesoftware.Steam.CompatibilityTool.Proton-GE \
md.obsidian.Obsidian
sleep 3; clear

# Download Static Applications #
echo "Downloading Static Applications..."; sleep 3
mkdir -p StaticApplications/; cd StaticApplications/
wget 'https://www.argyllcms.com/Argyll_V2.3.1_linux_x86_64_bin.tgz' -O ArgyllCMS.tgz
cd ..; sleep 3; clear

# Install Liqourix Kernel #
echo "Installing Liquorix Kernel..."; sleep 3
sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64
sleep 3; clear

# Finishing Touches #
sudo apt autoremove
echo "Don't forget to Reboot!"
