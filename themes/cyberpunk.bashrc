#!/bin/bash

# HackShell v1.1 - Cyberpunk Theme
# Created by Team ILLUSION || DK

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="cyberpunk"
WELCOME_SOUND=true

# Cyberpunk neon colors
magenta='\033[1;95m'
cyan='\033[1;96m'
yellow='\033[1;93m'
blue='\033[1;94m'
green='\033[1;92m'
red='\033[1;91m'
white='\033[1;97m'
reset='\033[0m'

# Custom prompt style with cyberpunk colors
PS1='\[\e[96m\]┌─[\[\e[93m\]\T\[\e[96m\]]─────\[\e[95m\][HackShell]\[\e[96m\]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[\e[96m\]──[\[\e[93m\]🔋'$BATT_CAPACITY'%\[\e[96m\]]'
fi

PS1+='\[\e[96m\]\n|\n\[\e[96m\]└─[\[\e[96m\]\[\e[93m\]\w\[\e[96m\]]────►\[\e[95m\] '

# Clear screen
clear

# Play welcome sound if enabled
if [ "$WELCOME_SOUND" = "true" ]; then
  mpv /$HOME/HackShell/welcome.mp3 >/dev/null 2>&1
fi

# Clear screen again
clear

# Show greeting with custom name if set
if [ -n "$CUSTOM_NAME" ]; then
  echo -e "${magenta}Netrunner ${yellow}$CUSTOM_NAME ${cyan}connected to the Net${reset}"
  echo "-----------------------------------" | lolcat -F 0.3
else
  echo -e "${magenta}Netrunner ${cyan}connected to the Net${reset}"
  echo "-----------------------------------" | lolcat -F 0.3
fi

# Show appropriate banner based on style setting
case "$BANNER_STYLE" in
  "default")
    echo "
██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██╗  ██╗███████╗██╗     ██╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██║  ██║██╔════╝██║     ██║ 
███████║███████║██║     █████╔╝ ███████╗███████║█████╗  ██║     ██║ 
██╔══██║██╔══██║██║     ██╔═██╗ ╚════██║██╔══██║██╔══╝  ██║     ██║ 
██║  ██║██║  ██║╚██████╗██║  ██╗███████║██║  ██║███████╗███████╗███████╗ 
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ 
    " | lolcat -F 0.3
    ;;
  "minimal")
    echo "
    ┌─────────────────────────────────────┐
    │           H A C K S H E L L         │
    │           Version 1.1               │
    └─────────────────────────────────────┘
    " | lolcat -F 0.3
    ;;
  "cyberpunk")
    echo -e "${cyan}
    ░█░█░█▀█░█▀▀░█░█░█▀▀░█░█░█▀▀░█░░░█░░
    ░█▀█░█▀█░█░░░█▀▄░▀▀█░█▀█░█▀▀░█░░░█░░
    ░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
    ${reset}" | lolcat -F 0.3
    ;;
  "matrix")
    echo "
    ╔═╗┌─┐┌┬┐┬─┐┬─┐┌─┐┌─┐┌┬┐┬┌┐┌┌─┐  
    ║  │ │ ││├┬┘├┬┘├─┤│   │ │││││ ┬  
    ╚═╝└─┘─┴┘┴└─┴└─┴ ┴└─┘ ┴ ┴┘└┘└─┘  
    ╔╦╗┬ ┬┌─┐  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐    
     ║ ├─┤├┤   ╚═╗└┬┘└─┐ │ ├┤ │││    
     ╩ ┴ ┴└─┘  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴    
    " | lolcat -F 0.3
    ;;
  "skull")
    echo "
       .-\"\"\"\"-.
      /        \
     /_        _\
    // \      / \\
    |\__\    /__/|
     \    ||    /
      \        /
       \  __  /  
        '.__.'
     H A C K S H E L L
    " | lolcat -F 0.3
    ;;
esac

# Cyberpunk quote
cyberpunk_quotes=(
  "The future is now, chrome."
  "Wake up samurai, we've got a city to burn."
  "Behind every screen is a soul waiting to be hacked."
  "In Night City, you can be anyone, anything."
  "Style over substance."
  "The best way to predict the future is to create it."
  "Reality is just electrons and data... interpreted."
)

rand=$((RANDOM % ${#cyberpunk_quotes[@]}))
echo -e "\n${magenta}${cyberpunk_quotes[$rand]}${reset}\n"

# Show system information if enabled
if [ "$SHOW_SYSINFO" = "true" ]; then
  echo ""
  echo -e "${cyan}╔════════════ SYSTEM INFO ════════════╗${reset}"
  echo -e "${magenta}▸ Date: ${yellow}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
  
  # Get memory usage
  MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
  MEM_USED=$(free -m | grep Mem | awk '{print $3}')
  MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
  
  echo -e "${magenta}▸ Memory: ${yellow}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
  
  # Get storage info
  STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
  STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
  STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
  
  echo -e "${magenta}▸ Storage: ${yellow}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
  
  # Get battery info if available
  if [ -e "/sys/class/power_supply/battery/capacity" ]; then
    BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
    BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
    echo -e "${magenta}▸ Battery: ${yellow}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
  fi
  
  # Get uptime
  UPTIME=$(uptime -p)
  echo -e "${magenta}▸ Uptime: ${yellow}${UPTIME}${reset}"
  
  # Get Termux version
  if [ -n "$(command -v termux-info)" ]; then
    TERMUX_VER=$(termux-info | grep "Termux version" | cut -d":" -f2 | xargs)
    echo -e "${magenta}▸ Termux: ${yellow}${TERMUX_VER}${reset}"
  fi
  
  echo -e "${cyan}╚════════════════════════════════════╝${reset}"
  echo ""
fi

# Command not found handler
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
  }
fi
