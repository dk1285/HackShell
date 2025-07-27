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

# Function to install package with error handling
install_package() {
    local package="$1"
    local installer="$2"
    
    echo -e "${cyan}Installing $package...${reset}"
    
    case $installer in
        "pkg")
            if pkg install "$package" -y; then
                echo -e "${green}✓ $package installed successfully${reset}"
                return 0
            else
                echo -e "${red}✗ Failed to install $package${reset}"
                return 1
            fi
            ;;
        "gem")
            if gem install "$package"; then
                echo -e "${green}✓ $package installed successfully${reset}"
                return 0
            else
                echo -e "${red}✗ Failed to install $package via gem${reset}"
                echo -e "${yellow}Trying alternative installation...${reset}"
                if pip install "$package"; then
                    echo -e "${green}✓ $package installed via pip${reset}"
                    return 0
                else
                    echo -e "${red}✗ Failed to install $package${reset}"
                    return 1
                fi
            fi
            ;;
        "pip")
            if pip install "$package"; then
                echo -e "${green}✓ $package installed successfully${reset}"
                return 0
            else
                echo -e "${red}✗ Failed to install $package${reset}"
                return 1
            fi
            ;;
    esac
}

# Install packages with error handling
failed_packages=()

install_package "ruby" "pkg" || failed_packages+=("ruby")
install_package "mpv" "pkg" || failed_packages+=("mpv")
install_package "figlet" "pkg" || failed_packages+=("figlet")
install_package "python" "pkg" || failed_packages+=("python")
install_package "lolcat" "gem" || failed_packages+=("lolcat")
install_package "termux-api" "pip" || failed_packages+=("termux-api")

if [ ${#failed_packages[@]} -eq 0 ]; then
    echo -e "$green
=====================================================
Successfully Installed All Packages
====================================================="
else
    echo -e "$yellow
=====================================================
Installation completed with warnings
Failed packages: ${failed_packages[*]}
HackShell will still work but some features may be limited
====================================================="
fi
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

# Verify installation
echo -e "$cyan
=====================================================
Verifying Installation...
====================================================="

verification_failed=false

# Check if theme files exist
if [ ! -d "$HOME/HackShell/themes" ] || [ -z "$(ls -A $HOME/HackShell/themes)" ]; then
    echo -e "${red}✗ Theme files not found${reset}"
    verification_failed=true
else
    echo -e "${green}✓ Theme files verified${reset}"
fi

# Check if scripts are executable
for script in config.sh install.sh rvt.sh; do
    if [ -x "$script" ]; then
        echo -e "${green}✓ $script is executable${reset}"
    else
        echo -e "${yellow}⚠ $script is not executable, fixing...${reset}"
        chmod +x "$script"
    fi
done

# Check if bash.bashrc was backed up
if [ -f "$HOME/HackShell/Revert/bash.bashrc" ]; then
    echo -e "${green}✓ Original bash.bashrc backed up${reset}"
else
    echo -e "${yellow}⚠ Original bash.bashrc backup not found${reset}"
fi

# Check if new bash.bashrc is in place
if [ -f "$PREFIX/etc/bash.bashrc" ]; then
    echo -e "${green}✓ HackShell theme applied${reset}"
else
    echo -e "${red}✗ Failed to apply HackShell theme${reset}"
    verification_failed=true
fi

if [ "$verification_failed" = true ]; then
    echo -e "$yellow
=====================================================
Installation completed with issues
Please run the installer again or report the problem
====================================================="
else
    echo -e "$green
=====================================================
Installation verified successfully!
====================================================="
fi
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