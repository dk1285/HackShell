#!/bin/bash

# HackShell v1.1 - Midnight Theme
# Created by Team ILLUSION || DK

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="default"
WELCOME_SOUND=true

# Colors
blue='\033[1;94m'
dark_blue='\033[0;34m'
light_blue='\033[0;94m'
cyan='\033[1;96m'
white='\033[1;97m'
yellow='\033[1;93m'
reset='\033[0m'

# Custom prompt style with midnight colors
PS1='\[\e[34m\]┌─[\[\e[94m\]\T\[\e[34m\]]─────\[\e[96m\][HackShell]\[\e[34m\]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[\e[34m\]──[\[\e[94m\]🔋'$BATT_CAPACITY'%\[\e[34m\]]'
fi

PS1+='\[\e[34m\]\n|\n\[\e[34m\]└─[\[\e[34m\]\[\e[94m\]\w\[\e[34m\]]────►\[\e[96m\] '

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
  echo -e "${blue}Welcome to the night, ${cyan}$CUSTOM_NAME${reset}"
  echo "-----------------------------------" | lolcat
else
  echo -e "${blue}Welcome to the ${cyan}Midnight Terminal${reset}"
  echo "-----------------------------------" | lolcat
fi

# Show appropriate banner based on style setting
case "$BANNER_STYLE" in
  "default")
    echo "${blue}
██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██╗  ██╗███████╗██╗     ██╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██║  ██║██╔════╝██║     ██║ 
███████║███████║██║     █████╔╝ ███████╗███████║█████╗  ██║     ██║ 
██╔══██║██╔══██║██║     ██╔═██╗ ╚════██║██╔══██║██╔══╝  ██║     ██║ 
██║  ██║██║  ██║╚██████╗██║  ██╗███████║██║  ██║███████╗███████╗███████╗ 
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ 
    ${reset}" | lolcat
    ;;
  "minimal")
    echo "${blue}
    ┌─────────────────────────────────────┐
    │           H A C K S H E L L         │
    │           Version 1.1               │
    └─────────────────────────────────────┘
    ${reset}" | lolcat
    ;;
  "cyberpunk")
    echo "${blue}
    ░█░█░█▀█░█▀▀░█░█░█▀▀░█░█░█▀▀░█░░░█░░
    ░█▀█░█▀█░█░░░█▀▄░▀▀█░█▀█░█▀▀░█░░░█░░
    ░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
    ${reset}" | lolcat
    ;;
  "matrix")
    echo "${blue}
    ╔═╗┌─┐┌┬┐┬─┐┬─┐┌─┐┌─┐┌┬┐┬┌┐┌┌─┐  
    ║  │ │ ││├┬┘├┬┘├─┤│   │ │││││ ┬  
    ╚═╝└─┘─┴┘┴└─┴└─┴ ┴└─┘ ┴ ┴┘└┘└─┘  
    ╔╦╗┬ ┬┌─┐  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐    
     ║ ├─┤├┤   ╚═╗└┬┘└─┐ │ ├┤ │││    
     ╩ ┴ ┴└─┘  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴    
    ${reset}" | lolcat
    ;;
  "skull")
    echo "${blue}
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
    ${reset}" | lolcat
    ;;
esac

# Midnight quotes
midnight_quotes=(
  "The night is darkest just before the dawn."
  "In the darkness, we find ourselves."
  "Shadows hide the secrets of the digital world."
  "Stars are the eternal witnesses of our midnight code."
  "Night brings clarity to those who seek."
  "The quiet of midnight is when the best code is written."
)

rand=$((RANDOM % ${#midnight_quotes[@]}))
echo -e "\n${cyan}${midnight_quotes[$rand]}${reset}\n"

# Show system information if enabled
if [ "$SHOW_SYSINFO" = "true" ]; then
  echo ""
  echo -e "${dark_blue}╔════════════ SYSTEM INFO ════════════╗${reset}"
  echo -e "${cyan}▸ Date: ${light_blue}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
  
  # Get memory usage
  MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
  MEM_USED=$(free -m | grep Mem | awk '{print $3}')
  MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
  
  echo -e "${cyan}▸ Memory: ${light_blue}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
  
  # Get storage info
  STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
  STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
  STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
  
  echo -e "${cyan}▸ Storage: ${light_blue}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
  
  # Get battery info if available
  if [ -e "/sys/class/power_supply/battery/capacity" ]; then
    BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
    BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
    echo -e "${cyan}▸ Battery: ${light_blue}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
  fi
  
  # Get uptime
  UPTIME=$(uptime -p)
  echo -e "${cyan}▸ Uptime: ${light_blue}${UPTIME}${reset}"
  
  # Get Termux version
  if [ -n "$(command -v termux-info)" ]; then
    TERMUX_VER=$(termux-info | grep "Termux version" | cut -d":" -f2 | xargs)
    echo -e "${cyan}▸ Termux: ${light_blue}${TERMUX_VER}${reset}"
  fi
  
  echo -e "${dark_blue}╚════════════════════════════════════╝${reset}"
  echo ""
fi

# Command not found handler
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
  }
fi
