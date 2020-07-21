#!/bin/sh

# Updating to retrieve latest pacakges

echo "Updating and Upgrading"
apt-get update && sudo apt-get upgrade -y

echo "Finished updating and upgrading packages"

# Installing snapd so that snaps can be used later

echo "Making sure snaps can be installed"
sudo apt install snapd

# Installing Flatpak so that Flatpak applications can be used later

echo "Making sure Flatpak applications can be installed"

sudo apt-get install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Installing wget if not already installed
sudo apt-get install wget

echo "Starting applications installation"

echo "Installing Simplenote"
sudo snap install simplenote
echo "...Finished."

echo "Installing Bitwarden"
sudo snap install bitwarden
echo "...Finished."

echo "Installing Typora"
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora
echo "...Finished."

echo "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo "...Finished."

echo "Installing Spotify"
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
echo "...Finished"

echo "Installing Pocket Casts"
sudo snap install pocket-casts
echo "...Finished"

echo "Installing Dropbox" # Need to figure this one out
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

echo "...Finished"


echo "Installing Odio"
sudo snap install odio
echo "...Finished."

echo "Installing Visual Studio Code"
sudo snap install code --classic
echo "...Finished."

echo "Installing Rambox" # Need to tidy up
export VER="0.6.4"
wget https://github.com/ramboxapp/community-edition/releases/download/$VER/Rambox-$VER-linux-amd64.deb
sudo apt install  gconf-service gconf-service-backend gconf2 gconf2-common libappindicator1  libgconf-2-4 libindicator7
sudo dpkg -i Rambox-$VER-linux-amd64.deb
sudo apt -f install
echo "...Finished"

echo "Installing Etcher"
echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee/etc/apt/sources.list.d/etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt-get update
sudo apt-get install etcher-electron
echo "...Finished"

echo "Installing Anki"
sudo snap install anki-woodrow
echo "...Finished"

echo "Installing Darktable"
sudo snap install darktable
echo "...Finished"

echo "Installing TablePlus Alpha"
wget -O - -q http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
sudo apt update -y
sudo apt install tableplus -y
echo "...Finished"

echo "Installing Zeal Docs"
sudo add-apt-repository ppa:zeal-developers/ppa
sudo apt-get update -y
sudo apt-get install zeal -y
echo "...Finished"

echo "Installing Byte Music Player"
flatpak install flathub com.github.alainm23.byte
echo "...Finished"

echo "Installing Draw.io"
sudo snap install drawio
echo "...Finished"

echo "Installing Gnome Sushi"
sudo apt-get update -y
sudo apt-get install -y gnome-sushi
echo "...Finished"

echo "Installing Ulauncher"
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update && sudo apt upgrade -y
sudo apt install ulauncher
echo "...Finished"


echo "Installing Figma Linux"
sudo add-apt-repository ppa:chrdevs/figma -y
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 70F3445E637983CC
sudo apt install figma-linux -y
echo "...Finished"

echo "Installing Okular PDF Viewer"
sudo snap install okular
echo "...Finished"

echo "Installing GIMP"
flatpak install flathub org.gimp.GIMP
echo "...Finished"

echo "Installing Steam"
flatpak install flathub com.valvesoftware.Steam
echo "...Finished"

echo "Installing Krita"
flatpak install flathub org.kde.krita
echo "...Finished"

echo "Installing Inkscape"
flatpak install flathub org.inkscape.Inkscape
echo "...Finished"

echo "Installing Darktable"
flatpak install flathub org.darktable.Darktable
echo "...Finished"

echo "Installing Byte Music Player"
flatpak install flathub com.github.alainm23.byte
echo "...Finished"

echo "Installing Kdenlive Video Editor"
flatpak install flathub org.kde.kdenlive
echo "...Finished"

echo "Installing Scribus"
flatpak install flathub net.scribus.Scribus
echo "...Finished"

echo "Installing XMind 8"
flatpak install flathub net.xmind.XMind8
echo "...Finished"

echo "Installing Postman"
flatpak install flathub com.getpostman.Postman
echo "...Finished"

echo "Installing NordVPN"
wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo dpkg -i /Home/jack/Hentet/nordvpn-release_1.0.0_all.deb
sudo apt-get update
sudo apt-get install nordvpn

echo "Installing TLP"
sudo apt-get update -y
sudo apt-get install tlp -y
sudo apt-get install acpi-call-dkms # Needed specifically for ThinkPad 
sudo tlp start
echo "...Finished"

echo "Installing htop"
sudo apt update && sudo apt upgrade -y
sudo apt install htop
echo "...Finished"

# Needed to correct GTK+ settings for Scrivener later

echo "Installing Qt4 Config"
sudo apt install qt4-qtconfig -y
echo "...Finished"



# TODO
# 1. Visit URL and download zip
# 2. Unzip and move to separate folder within /Hentet
# 3. Create appropriate .desktop files and autofill necessary fields (e.g. StartUpWMClass, Icon directory, etc)

echo "Installing Trello Desktop"
wget https://github.com/Racle/trello-desktop/releases/download/v0.2.0/Trello-linux-0.2.0.zip -O trello.zip
sudo mkdir /opt/trello
sudo unzip trello.zip -d /opt/trello/
sudo ln -sf /opt/trello/Trello /usr/bin/trello
echo -e '[Desktop Entry]\n Version=1.0\n Name=Trello\n Exec=/usr/bin/trello\n Icon=/opt/trello/resources/app/static/Icon.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/trello.desktop
sudo chmod +x /usr/share/applications/trello.desktop
echo "...Finished"

echo "Installing Todoist Desktop"

echo "Installing Slack"
https://downloads.slack-edge.com/linux_releases/slack-desktop-7.4.0-amd64.deb
sudo apt install ./slack-desktop-*.deb
echo "...Finished"

echo "Installing Scrivener"

echo "Installing Pennywise"

echo "Installing Gnome Tweak Tool"
sudo apt-get install gnome-tweak-tool -y

# Adding Gnome Shell Host Connector for extensions
sudo apt install chrome-gnome-shell -y

# TODO
# 1. Look into  retrieving and installing gnome shell extensions via commmand line
# 2. ???

# TODO
# Look into writing tests to make sure that everything installed correctly

# TODO
# Maybe add GUI using curses or ncurses to allow for selection of applications to be installed

# Installing Microsoft fonts for improved compatibility with MS Office documents and Libre Office
sudo apt install -y ttf-mscorefonts-installer

echo "Post install script complete"















