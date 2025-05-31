#!/bin/bash

# HackShell v1.1 Revert Script
# Created By Team ILLUSION || DK

# Colors
green='\033[1;92m'
yellow='\033[1;93m'
red='\033[1;91m'
reset='\033[0m'

echo -e "${yellow}
=====================================================
Reverting HackShell...
=====================================================${reset}"

# Check if backup exists
if [ -f "$HOME/HackShell/Revert/bash.bashrc" ]; then
    # Remove current bash.bashrc
    rm -f "$PREFIX/etc/bash.bashrc"
    
    # Restore original bash.bashrc
    cp "$HOME/HackShell/Revert/bash.bashrc" "$PREFIX/etc/"
    
    echo -e "${green}
=====================================================
Reverted Successfully!
=====================================================${reset}"
else
    echo -e "${red}
=====================================================
Error: Backup file not found!
=====================================================${reset}"
    exit 1
fi

# Ask if user wants to remove HackShell completely
echo -e "${yellow}
Do you want to completely remove HackShell? (y/n)${reset}"
read -r choice

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    # Remove HackShell directory
    echo -e "${yellow}
Removing HackShell files...${reset}"
    rm -rf "$HOME/HackShell"
    echo -e "${green}HackShell has been completely removed!${reset}"
fi

clear
echo -e "${green}
=====================================================
Termux has been restored to default settings
=====================================================${reset}"
echo -e "${yellow}Thanks For Using HackShell${reset}"
echo -e "${yellow}Created By Team ILLUSION || DK${reset}"
echo -e "${yellow}Please restart Termux to apply changes${reset}"
