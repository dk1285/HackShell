#!/bin/bash

# HackShell v1.1 - Hacker Theme
# Created by Team ILLUSION || DK

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="default"
WELCOME_SOUND=true

# Colors
green='\033[1;92m'
yellow='\033[1;93m'
red='\033[1;91m'
blue='\033[1;94m'
cyan='\033[1;96m'
white='\033[1;97m'
purple='\033[1;95m'
reset='\033[0m'

# Custom prompt style
PS1='\[\e[31m\]┌─[\[\e[37m\]\T\[\e[31m\]]─────\[\e[1;93m\][HackShell]\[\e[31m\]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[\e[31m\]──[\[\e[32m\]🔋'$BATT_CAPACITY'%\[\e[31m\]]'
fi

PS1+='\[\e[31m\]\n|\n\[\e[31m\]└─[\[\e[31m\]\[\e[0;35m\]\w\[\e[31m\]]────►\[\e[1;92m\] '

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
  echo -e "${green}Welcome back, ${yellow}$CUSTOM_NAME${reset}"
  echo "-----------------------------------" | lolcat
else
  echo -e "Created By \e[5m${yellow}Team ILLUSION || DK${reset}"
  echo "-----------------------------------" | lolcat
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
      /        \
     /_        _\
    // \      / \\
    |\__\    /__/|
     \    ||    /
      \        /
       \  __  /  
        '.__.'
     H A C K S H E L L
    " | lolcat
    ;;
esac

# Show system information if enabled
if [ "$SHOW_SYSINFO" = "true" ]; then
  echo ""
  echo -e "${yellow}╔════════════ SYSTEM INFO ════════════╗${reset}"
  echo -e "${cyan}▸ Date: ${white}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
  
  # Get memory usage
  MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
  MEM_USED=$(free -m | grep Mem | awk '{print $3}')
  MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
  
  echo -e "${cyan}▸ Memory: ${white}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
  
  # Get storage info
  STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
  STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
  STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
  
  echo -e "${cyan}▸ Storage: ${white}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
  
  # Get battery info if available
  if [ -e "/sys/class/power_supply/battery/capacity" ]; then
    BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
    BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
    echo -e "${cyan}▸ Battery: ${white}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
  fi
  
  # Get uptime
  UPTIME=$(uptime -p)
  echo -e "${cyan}▸ Uptime: ${white}${UPTIME}${reset}"
  
  # Get Termux version
  if [ -n "$(command -v termux-info)" ]; then
    TERMUX_VER=$(termux-info | grep "Termux version" | cut -d":" -f2 | xargs)
    echo -e "${cyan}▸ Termux: ${white}${TERMUX_VER}${reset}"
  fi
  
  echo -e "${yellow}╚════════════════════════════════════╝${reset}"
  echo ""
fi

# Command not found handler
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
  }
fi
