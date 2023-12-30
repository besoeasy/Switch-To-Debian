#!/bin/bash

DESKTOP_ENV=""

if [ -n "$XDG_CURRENT_DESKTOP" ]; then
    DESKTOP_ENV=$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')
fi

sudo apt update -y

sudo apt install flatpak snapd -y
sudo apt install nala wget curl git -y

if [ "$DESKTOP_ENV" = "gnome" ]; then
    sudo apt install gnome-software-plugin-flatpak -y
    sudo apt install gnome-software-plugin-snap -y
elif [ "$DESKTOP_ENV" = "kde" ]; then
    sudo apt install plasma-discover-backend-flatpak -y
    sudo apt install plasma-discover-backend-snap -y
else
    echo "Desktop environment not recognized or not supported."
    exit 1
fi

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo snap install core
