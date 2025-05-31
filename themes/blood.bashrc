#!/bin/bash

# HackShell v1.1 - Blood Theme
# Created by Team ILLUSION || DK

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="default"
WELCOME_SOUND=true

# Colors
red='\033[1;91m'
dark_red='\033[0;31m'
light_red='\033[0;91m'
white='\033[1;97m'
yellow='\033[1;93m'
reset='\033[0m'

# Custom prompt style with blood colors
PS1='\[\e[31m\]┌─[\[\e[91m\]\T\[\e[31m\]]─────\[\e[97m\][HackShell]\[\e[31m\]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[\e[31m\]──[\[\e[91m\]🔋'$BATT_CAPACITY'%\[\e[31m\]]'
fi

PS1+='\[\e[31m\]\n|\n\[\e[31m\]└─[\[\e[31m\]\[\e[91m\]\w\[\e[31m\]]────►\[\e[97m\] '

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
  echo -e "${red}Blood protocol activated, ${white}$CUSTOM_NAME${reset}"
  echo "-----------------------------------" | lolcat
else
  echo -e "${red}Blood protocol ${white}activated${reset}"
  echo "-----------------------------------" | lolcat
fi

# Show appropriate banner based on style setting
case "$BANNER_STYLE" in
  "default")
    echo "${red}
██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██╗  ██╗███████╗██╗     ██╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██║  ██║██╔════╝██║     ██║ 
███████║███████║██║     █████╔╝ ███████╗███████║█████╗  ██║     ██║ 
██╔══██║██╔══██║██║     ██╔═██╗ ╚════██║██╔══██║██╔══╝  ██║     ██║ 
██║  ██║██║  ██║╚██████╗██║  ██╗███████║██║  ██║███████╗███████╗███████╗ 
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ 
    ${reset}" | lolcat
    ;;
  "minimal")
    echo "${red}
    ┌─────────────────────────────────────┐
    │           H A C K S H E L L         │
    │           Version 1.1               │
    └─────────────────────────────────────┘
    ${reset}" | lolcat
    ;;
  "cyberpunk")
    echo "${red}
    ░█░█░█▀█░█▀▀░█░█░█▀▀░█░█░█▀▀░█░░░█░░
    ░█▀█░█▀█░█░░░█▀▄░▀▀█░█▀█░█▀▀░█░░░█░░
    ░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
    ${reset}" | lolcat
    ;;
  "matrix")
    echo "${red}
    ╔═╗┌─┐┌┬┐┬─┐┬─┐┌─┐┌─┐┌┬┐┬┌┐┌┌─┐  
    ║  │ │ ││├┬┘├┬┘├─┤│   │ │││││ ┬  
    ╚═╝└─┘─┴┘┴└─┴└─┴ ┴└─┘ ┴ ┴┘└┘└─┘  
    ╔╦╗┬ ┬┌─┐  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐    
     ║ ├─┤├┤   ╚═╗└┬┘└─┐ │ ├┤ │││    
     ╩ ┴ ┴└─┘  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴    
    ${reset}" | lolcat
    ;;
  "skull")
    echo "${red}
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

# Blood quotes
blood_quotes=(
  "Code flows like blood through the digital veins."
  "Every system has its vulnerabilities."
  "In the digital realm, we are the predators."
  "The red glow of code is the lifeblood of our work."
  "We paint our victories in red."
  "Behind every encrypted wall lies a beating heart."
)

rand=$((RANDOM % ${#blood_quotes[@]}))
echo -e "\n${light_red}${blood_quotes[$rand]}${reset}\n"

# Show system information if enabled
if [ "$SHOW_SYSINFO" = "true" ]; then
  echo ""
  echo -e "${dark_red}╔════════════ SYSTEM INFO ════════════╗${reset}"
  echo -e "${red}▸ Date: ${light_red}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
  
  # Get memory usage
  MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
  MEM_USED=$(free -m | grep Mem | awk '{print $3}')
  MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
  
  echo -e "${red}▸ Memory: ${light_red}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
  
  # Get storage info
  STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
  STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
  STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
  
  echo -e "${red}▸ Storage: ${light_red}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
  
  # Get battery info if available
  if [ -e "/sys/class/power_supply/battery/capacity" ]; then
    BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
    BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
    echo -e "${red}▸ Battery: ${light_red}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
  fi
  
  # Get uptime
  UPTIME=$(uptime -p)
  echo -e "${red}▸ Uptime: ${light_red}${UPTIME}${reset}"
  
  # Get Termux version
  if [ -n "$(command -v termux-info)" ]; then
    TERMUX_VER=$(termux-info | grep "Termux version" | cut -d":" -f2 | xargs)
    echo -e "${red}▸ Termux: ${light_red}${TERMUX_VER}${reset}"
  fi
  
  echo -e "${dark_red}╚════════════════════════════════════╝${reset}"
  echo ""
fi

# Command not found handler
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
  }
fi
