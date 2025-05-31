#!/bin/bash

# HackShell v1.1 Installation Script
# Created By Team ILLUSION || DK

# Colors
green='\033[1;92m'
yellow='\033[1;93m'
white='\033[1;97m'
cyan='\033[1;96m'
red='\033[1;91m'
blue='\033[1;94m'
purple='\033[1;95m'
reset='\033[0m'

# Display header
echo -e "$yellow
=====================================================
Created By Team ILLUSION || DK
====================================================="
echo ""
echo -e "$green
=====================================================
Installing Termux HackShell v1.1
====================================================="
echo ""

# Install required packages
echo -e "$yellow
=====================================================
Installing Required Packages
====================================================="
pkg install ruby mpv figlet python -y
gem install lolcat
pip install termux-api

echo -e "$green
=====================================================
Successfully Installed Packages
====================================================="
echo ""

# Create required directories
echo -e "$cyan
=====================================================
Setting Up Configuration
====================================================="

# Create themes directory if it doesn't exist
if [ ! -d "$HOME/HackShell/themes" ]; then
    mkdir -p "$HOME/HackShell/themes"
fi

# Copy theme files
cp -r themes/* "$HOME/HackShell/themes/"

# Make scripts executable
chmod +x config.sh
chmod +x themes/*.bashrc

# Backup original bashrc
echo -e "$blue
=====================================================
Initializing...
====================================================="
if [ -f "$PREFIX/etc/bash.bashrc" ]; then
    if [ ! -d "$HOME/HackShell/Revert" ]; then
        mkdir -p "$HOME/HackShell/Revert"
    fi
    mv "$PREFIX/etc/bash.bashrc" "$HOME/HackShell/Revert/"
fi

# Copy default theme (hacker)
cp "$HOME/HackShell/themes/hacker.bashrc" "$PREFIX/etc/bash.bashrc"

# Create default configuration
echo "# HackShell Configuration" > "$HOME/HackShell/config.conf"
echo "THEME=\"hacker\"" >> "$HOME/HackShell/config.conf"
echo "SHOW_SYSINFO=\"true\"" >> "$HOME/HackShell/config.conf"
echo "CUSTOM_NAME=\"\"" >> "$HOME/HackShell/config.conf"
echo "BANNER_STYLE=\"default\"" >> "$HOME/HackShell/config.conf"
echo "WELCOME_SOUND=\"true\"" >> "$HOME/HackShell/config.conf"

# Installation complete
echo -e "$green
=====================================================
All Files Are Done
====================================================="
clear
echo -e "$yellow
======================================================
HackShell v1.1 Successfully Installed!
======================================================"
echo -e "$yellow
GitHub : https://github.com/dk1285
======================================================"
echo ""
echo -e "$cyan
======================================================
What's New in v1.1:
- Multiple themes (hacker, matrix, cyberpunk, midnight, blood)
- System information display
- Custom user greeting
- Interactive configuration menu
- Battery status indicator
- New ASCII art banner options
======================================================"
echo ""
echo -e "$green
======================================================
To configure HackShell, run:
bash $HOME/HackShell/config.sh

Now Type 'exit' & Restart Termux to see the changes!
======================================================"
echo ""
echo -e "$reset"