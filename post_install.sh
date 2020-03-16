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
sudo snap install spotify
echo "...Finished"

echo "Installing Pocket Casts"
sudo snap install pocket-casts
echo "...Finished"

echo "Installing Odio"
sudo snap install odio
echo "...Finished."

echo "Installing Visual Studio Code"
sudo snap install code --classic
echo "...Finished."

echo "Installing Rambox"
sudo snap install rambox
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

echo "Installing Postman"
sudo snap install postman
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

echo "Installing Slack"
sudo snap install slack --classic
echo "...Finished"

echo "Installing GIMP"
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt-get update -y 
sudo apt-get install -y gimp
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

echo "Installing Todoist Desktop"

echo "Installing Slack"

echo "Installing Dropbox"

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
# Look into writing tests to make sure that everything installed correct

# TODO
# Maybe add GUI using curses or ncurses if feeling fancy...

echo "Post install script complete"















