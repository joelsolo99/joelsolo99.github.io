#!/usr/bin/env bash
set -Eeuo pipefail

export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export NEEDRESTART_MODE=a

if command -v sudo >/dev/null 2>&1; then
    SUDO=sudo
elif [ "$(id -u)" -eq 0 ]; then
    SUDO=
else
    echo "Error: sudo is required."
    exit 1
fi

$SUDO apt-get update -y
$SUDO apt-get install -y flatpak python3 python3-pip pipx

# Flatpak / Flathub / jamovi
$SUDO flatpak remote-add \
    --if-not-exists \
    flathub \
    https://dl.flathub.org/repo/flathub.flatpakrepo

$SUDO flatpak install \
    --system \
    --noninteractive \
    flathub \
    org.jamovi.jamovi

# OpenSesame + extensions
pipx ensurepath

export PATH="$HOME/.local/bin:$PATH"

pipx install opensesame-core

pipx inject opensesame-core \
    opensesame-extension-sigmund \
    opensesame-extension-osweb \
    opensesame-extension-updater \
    opensesame-plugin-psychopy \
    opensesame-plugin-media_player_mpy \
    pygame

echo
echo "Installation complete."
echo
echo "OpenSesame: opensesame"
echo "jamovi:     flatpak run org.jamovi.jamovi"
echo
echo "If 'opensesame' isn't found, open a new terminal."
