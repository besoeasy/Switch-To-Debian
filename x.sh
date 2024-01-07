#!/bin/bash

DESKTOP_ENV=""

if [ -n "$XDG_CURRENT_DESKTOP" ]; then
    DESKTOP_ENV=$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')
fi

sudo apt update -y

sudo apt install flatpak snapd -y

if [ "$DESKTOP_ENV" = "gnome" ]; then
    echo "Its Gnome .............."

    sudo apt install gnome-software-plugin-flatpak -y
    sudo apt install gnome-software-plugin-snap -y
elif [ "$DESKTOP_ENV" = "kde" ]; then
    echo "Its KDE .............."

    sudo apt install plasma-discover-backend-flatpak -y
    sudo apt install plasma-discover-backend-snap -y
else
    echo "Desktop environment not recognized or not supported."
fi

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install nala
sudo apt install nala -y

# Install wget
sudo apt install wget -y

# Install curl
sudo apt install curl -y

# Install git
sudo apt install git -y

# Install vlc
sudo apt install vlc -y

# Install Neofetch
sudo apt install neofetch -y

# Snap Code
sudo snap install core

# Install Motrix from Snap
sudo snap install motrix

# Install Telegram Desktop
sudo snap install telegram-desktop

# Install VS Code
sudo snap install code --classic

# Install Spotify
sudo snap install spotify

# Install Discord
sudo snap install discord

# Install Node.js
sudo snap install node --classic

# Install Brave Browser
sudo snap install brave

# Install Tor Browser
sudo flatpak install flathub com.github.micahflee.torbrowser-launcher -y

# Check if Google Chrome is installed
if ! command -v google-chrome; then
    echo "Google Chrome is not installed. Proceeding with installation..."
    # Download Google Chrome .deb package
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp 
    sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

    # Install dependencies if there are any unmet dependencies
    sudo apt-get install -f -y
else
    echo "Google Chrome is already installed."
fi

# Display system information using Neofetch
echo -e "\n\n"
neofetch
echo -e "\n\n"
