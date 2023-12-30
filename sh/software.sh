#!/bin/bash

DESKTOP_ENV=""
# Detect desktop environment
if [ -n "$XDG_CURRENT_DESKTOP" ]; then
    DESKTOP_ENV=$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')
fi

# Install Flatpak and Snapd
sudo apt update -y
sudo apt install flatpak snapd -y
sudo apt install nala wget curl vlc -y

# Install corresponding Flatpak backend for the detected desktop environment
if [ "$DESKTOP_ENV" = "gnome" ]; then
    sudo apt install gnome-software-plugin-flatpak -y
elif [ "$DESKTOP_ENV" = "kde" ]; then
    sudo apt install plasma-discover-backend-flatpak -y
else
    echo "Desktop environment not recognized or not supported."
    exit 1
fi

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Add Snap Store repository
sudo snap install core
sudo snap install snap-store
