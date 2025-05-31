#!/bin/bash

# HackShell v1.1 - Matrix Theme
# Created by Team ILLUSION || DK

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="matrix"
WELCOME_SOUND=true

# Colors
green='\033[1;92m'
light_green='\033[0;92m'
dark_green='\033[0;32m'
yellow='\033[1;93m'
red='\033[1;91m'
blue='\033[1;94m'
cyan='\033[1;96m'
white='\033[1;97m'
purple='\033[1;95m'
reset='\033[0m'

# Custom prompt style with matrix-themed colors
PS1='\[\e[32m\]┌─[\[\e[92m\]\T\[\e[32m\]]─────\[\e[92m\][HackShell]\[\e[32m\]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[\e[32m\]──[\[\e[92m\]🔋'$BATT_CAPACITY'%\[\e[32m\]]'
fi

PS1+='\[\e[32m\]\n|\n\[\e[32m\]└─[\[\e[32m\]\[\e[0;92m\]\w\[\e[32m\]]────►\[\e[1;92m\] '

# Clear screen
clear

# Play welcome sound if enabled
if [ "$WELCOME_SOUND" = "true" ]; then
  mpv /$HOME/HackShell/welcome.mp3 >/dev/null 2>&1
fi

# Clear screen again
clear

# Matrix-style text effect function
matrix_text() {
  text=$1
  for (( i=0; i<${#text}; i++ )); do
    echo -ne "${dark_green}${text:$i:1}${reset}"
    sleep 0.01
  done
  echo ""
}

# Show greeting with custom name if set
if [ -n "$CUSTOM_NAME" ]; then
  matrix_text "Welcome to the Matrix, $CUSTOM_NAME"
  echo "-----------------------------------" | lolcat -f
else
  matrix_text "Welcome to the Matrix"
  echo "-----------------------------------" | lolcat -f
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
    " | lolcat -f -F 0.01
    ;;
  "minimal")
    echo "
    ┌─────────────────────────────────────┐
    │           H A C K S H E L L         │
    │           Version 1.1               │
    └─────────────────────────────────────┘
    " | lolcat -f -F 0.01
    ;;
  "cyberpunk")
    echo "
    ░█░█░█▀█░█▀▀░█░█░█▀▀░█░█░█▀▀░█░░░█░░
    ░█▀█░█▀█░█░░░█▀▄░▀▀█░█▀█░█▀▀░█░░░█░░
    ░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
    " | lolcat -f -F 0.01
    ;;
  "matrix")
    echo "${dark_green}
    ╔═╗┌─┐┌┬┐┬─┐┬─┐┌─┐┌─┐┌┬┐┬┌┐┌┌─┐  
    ║  │ │ ││├┬┘├┬┘├─┤│   │ │││││ ┬  
    ╚═╝└─┘─┴┘┴└─┴└─┴ ┴└─┘ ┴ ┴┘└┘└─┘  
    ╔╦╗┬ ┬┌─┐  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐    
     ║ ├─┤├┤   ╚═╗└┬┘└─┐ │ ├┤ │││    
     ╩ ┴ ┴└─┘  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴    
    ${reset}" 
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
    " | lolcat -f -F 0.01
    ;;
esac

# Matrix quote
matrix_quotes=(
  "There is no spoon."
  "Follow the white rabbit."
  "The Matrix has you..."
  "Wake up, Neo."
  "Knock, knock, Neo."
  "Welcome to the desert of the real."
  "Free your mind."
)

rand=$((RANDOM % ${#matrix_quotes[@]}))
echo -e "\n${light_green}${matrix_quotes[$rand]}${reset}\n"

# Show system information if enabled
if [ "$SHOW_SYSINFO" = "true" ]; then
  echo ""
  echo -e "${dark_green}╔════════════ SYSTEM INFO ════════════╗${reset}"
  echo -e "${green}▸ Date: ${light_green}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
  
  # Get memory usage
  MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
  MEM_USED=$(free -m | grep Mem | awk '{print $3}')
  MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
  
  echo -e "${green}▸ Memory: ${light_green}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
  
  # Get storage info
  STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
  STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
  STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
  
  echo -e "${green}▸ Storage: ${light_green}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
  
  # Get battery info if available
  if [ -e "/sys/class/power_supply/battery/capacity" ]; then
    BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
    BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
    echo -e "${green}▸ Battery: ${light_green}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
  fi
  
  # Get uptime
  UPTIME=$(uptime -p)
  echo -e "${green}▸ Uptime: ${light_green}${UPTIME}${reset}"
  
  # Get Termux version
  if [ -n "$(command -v termux-info)" ]; then
    TERMUX_VER=$(termux-info | grep "Termux version" | cut -d":" -f2 | xargs)
    echo -e "${green}▸ Termux: ${light_green}${TERMUX_VER}${reset}"
  fi
  
  echo -e "${dark_green}╚════════════════════════════════════╝${reset}"
  echo ""
fi

# Command not found handler
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
  }
fi
