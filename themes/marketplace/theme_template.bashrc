#!/bin/bash

# HackShell v1.1 - Theme Template
# This is a template for creating custom themes for HackShell
# To create your own theme, copy this file and modify it as needed

# Theme information - Change these values
THEME_NAME="Custom Theme"
THEME_AUTHOR="Your Name"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A custom theme for HackShell"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="default"
WELCOME_SOUND=true

# Colors - Customize these to create your theme
# Common color codes:
# Black: \033[0;30m
# Red: \033[0;31m
# Green: \033[0;32m
# Yellow: \033[0;33m
# Blue: \033[0;34m
# Purple: \033[0;35m
# Cyan: \033[0;36m
# White: \033[0;37m
# Bold versions use 1 instead of 0, e.g: \033[1;31m for bold red
PRIMARY_COLOR='\033[1;36m'     # Main theme color
SECONDARY_COLOR='\033[1;35m'   # Secondary theme color
ACCENT_COLOR='\033[1;33m'      # Accent color for highlights
TEXT_COLOR='\033[1;37m'        # Regular text color
PROMPT_COLOR='\033[1;32m'      # Color for command prompt
reset='\033[0m'                # Reset color (don't change this)

# Custom prompt style - Modify this to your liking
PS1='\[${PRIMARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]\T\[${PRIMARY_COLOR}\]]─────\[${SECONDARY_COLOR}\][HackShell]\[${PRIMARY_COLOR}\]'

# Add battery status - You can customize this
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[${PRIMARY_COLOR}\]──[\[${ACCENT_COLOR}\]🔋'$BATT_CAPACITY'%\[${PRIMARY_COLOR}\]]'
fi

PS1+='\[${PRIMARY_COLOR}\]\n|\n\[${PRIMARY_COLOR}\]└─[\[${PRIMARY_COLOR}\]\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]────►\[${PROMPT_COLOR}\] '

# Clear screen
clear

# Play welcome sound if enabled - Leave this as is
if [ "$WELCOME_SOUND" = "true" ]; then
  mpv /$HOME/HackShell/welcome.mp3 >/dev/null 2>&1
fi

# Clear screen again
clear

# Custom welcome message - Customize this
welcome_message() {
  if [ -n "$CUSTOM_NAME" ]; then
    echo -e "${ACCENT_COLOR}Welcome, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Created by ${TEXT_COLOR}$THEME_AUTHOR${reset}"
  echo "-----------------------------------" | lolcat
}

# Display welcome message
welcome_message

# Show appropriate banner based on style setting - You can customize the banners
display_banner() {
  case "$BANNER_STYLE" in
    "default")
      echo "
██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██╗  ██╗███████╗██╗     ██╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██║  ██║██╔════╝██║     ██║ 
███████║███████║██║     █████╔╝ ███████╗███████║█████╗  ██║     ██║ 
██╔══██║██╔══██║██║     ██╔═██╗ ╚════██║██╔══██║██╔══╝  ██║     ██║ 
██║  ██║██║  ██║╚██████╗██║  ██╗███████║██║  ██║███████╗███████╗███████╗ 
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ 
      " | lolcat
      ;;
    "minimal")
      echo "
    ┌─────────────────────────────────────┐
    │           H A C K S H E L L         │
    │           Version 1.1               │
    └─────────────────────────────────────┘
      " | lolcat
      ;;
    "cyberpunk")
      echo "
    ░█░█░█▀█░█▀▀░█░█░█▀▀░█░█░█▀▀░█░░░█░░
    ░█▀█░█▀█░█░░░█▀▄░▀▀█░█▀█░█▀▀░█░░░█░░
    ░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
      " | lolcat
      ;;
    "matrix")
      echo "
    ╔═╗┌─┐┌┬┐┬─┐┬─┐┌─┐┌─┐┌┬┐┬┌┐┌┌─┐  
    ║  │ │ ││├┬┘├┬┘├─┤│   │ │││││ ┬  
    ╚═╝└─┘─┴┘┴└─┴└─┴ ┴└─┘ ┴ ┴┘└┘└─┘  
    ╔╦╗┬ ┬┌─┐  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐    
     ║ ├─┤├┤   ╚═╗└┬┘└─┐ │ ├┤ │││    
     ╩ ┴ ┴└─┘  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴    
      " | lolcat
      ;;
    "skull")
      echo "
       .-\"\"\"\"-.
      /        \\
     /_        _\\
    // \\      / \\\\
    |\\__\\    /__/|
     \\    ||    /
      \\        /
       \\  __  /  
        '.__.'
     H A C K S H E L L
      " | lolcat
      ;;
    # Add your custom banner style here
    "custom")
      echo "
      ===========================
      |     YOUR BANNER HERE    |
      ===========================
      " | lolcat
      ;;
  esac
}

# Display banner
display_banner

# Custom quotes - Add your own quotes here
custom_quotes=(
  "Your first custom quote"
  "Your second custom quote"
  "Your third custom quote"
  "Your fourth custom quote"
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}${custom_quotes[$rand]}${reset}\n"
fi

# Show system information if enabled - You can customize the display format
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╔════════════ SYSTEM INFO ════════════╗${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}▸ Date: ${TEXT_COLOR}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    echo -e "${SECONDARY_COLOR}▸ Memory: ${TEXT_COLOR}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
    
    echo -e "${SECONDARY_COLOR}▸ Storage: ${TEXT_COLOR}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
    
    # Get battery info if available
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      echo -e "${SECONDARY_COLOR}▸ Battery: ${TEXT_COLOR}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p)
    echo -e "${SECONDARY_COLOR}▸ Uptime: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get Termux version
    if [ -n "$(command -v termux-info)" ]; then
      TERMUX_VER=$(termux-info | grep "Termux version" | cut -d":" -f2 | xargs)
      echo -e "${SECONDARY_COLOR}▸ Termux: ${TEXT_COLOR}${TERMUX_VER}${reset}"
    fi
    
    # Add your custom system information here
    
    echo -e "${PRIMARY_COLOR}╚════════════════════════════════════╝${reset}"
    echo ""
  fi
}

# Display system information
display_sysinfo

# Command not found handler - Leave this as is
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
  }
fi
