#!/bin/bash

# HackShell v1.1 - Hacker Elite Theme
# A green-on-black classic hacker theme with matrix-inspired elements

# Theme information
THEME_NAME="Hacker Elite"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="Classic green-on-black hacker theme with matrix-inspired elements"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="matrix"
WELCOME_SOUND=true

# Colors - Classic hacker green palette
PRIMARY_COLOR='\033[1;38;5;46m'    # Bright green
SECONDARY_COLOR='\033[1;38;5;34m'  # Medium green
ACCENT_COLOR='\033[1;38;5;76m'     # Light green
TEXT_COLOR='\033[1;38;5;40m'       # Neon green
PROMPT_COLOR='\033[1;38;5;118m'    # Pale green
reset='\033[0m'                    # Reset color

# Custom prompt style with ASCII characters
PS1='\[${PRIMARY_COLOR}\][$(date +%H:%M:%S)] \[${SECONDARY_COLOR}\]root@matrix\[${PRIMARY_COLOR}\]:\[${ACCENT_COLOR}\]\w\[${PRIMARY_COLOR}\]# \[${reset}\]'

# Clear screen
clear

# Play welcome sound if enabled
if [ "$WELCOME_SOUND" = "true" ]; then
  mpv /$HOME/HackShell/welcome.mp3 >/dev/null 2>&1
fi

# Clear screen again
clear

# Custom welcome message
welcome_message() {
  if [ -n "$CUSTOM_NAME" ]; then
    echo -e "${PRIMARY_COLOR}System breach successful. Welcome, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${PRIMARY_COLOR}System breach successful. Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Follow the white rabbit...${reset}"
  echo "======================================" | lolcat -f
}

# Display welcome message
welcome_message

# Matrix-inspired banner
display_banner() {
  case "$BANNER_STYLE" in
    "matrix")
      echo -e "${PRIMARY_COLOR}
      ╔╦╗╔═╗╔╦╗╦═╗╦═╗ ╦  ╦╔═╗╔═╗╦╔═╔═╗╦═╗
       ║ ╠═╣ ║ ╠╦╝║═╬╗║  ║╔═╝╠═╣╠╩╗║╣ ╠╦╝
       ╩ ╩ ╩ ╩ ╩╚═╩═╝╚╝  ╩╚═╝╩ ╩╩ ╩╚═╝╩╚═
      ┌──────────────────────────────────┐
      │ SYSTEM SECURITY BREACH DETECTED  │
      └──────────────────────────────────┘
      ${reset}"
      ;;
    *)
      # Fallback to alternative banner
      echo -e "${PRIMARY_COLOR}
      ┏┓┏┓┏┓┏┓┏┓┏┓┏┓  ┏┓┏┓┏┓┏┓┏┓
      ┣┫┣┫┃┃┣┫┣┫┗┓┣┫  ┣┫┗┓┗┓┣┫┣┫
      ┛┗┛┗┗┛┛┗┛┗┗┛┛┗  ┛┗┗┛┗┛┛┗┛┗
      ${reset}"
      ;;
  esac
  
  # Simulate falling matrix code
  echo -e "${PRIMARY_COLOR}"
  for i in {1..3}; do
    line=""
    for j in {1..60}; do
      r=$((RANDOM % 2))
      if [ $r -eq 0 ]; then
        line="${line}$(( RANDOM % 2 ))"
      else
        line="${line} "
      fi
    done
    echo "$line"
  done
  echo -e "${reset}"
}

# Display banner
display_banner

# Hacker quotes
custom_quotes=(
  "There is no spoon."
  "The Matrix has you..."
  "Never send a human to do a machine's job."
  "Free your mind."
  "Ignorance is bliss."
  "I know kung fu."
  "Hack the planet!"
  "Knowledge is freedom."
  "There's a difference between knowing the path and walking the path."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Matrix-style system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo -e "${PRIMARY_COLOR}
┌─── SYSTEM DIAGNOSTICS ───────────────────┐${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}│ Date......: ${TEXT_COLOR}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    echo -e "${SECONDARY_COLOR}│ Memory....: ${TEXT_COLOR}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
    
    echo -e "${SECONDARY_COLOR}│ Storage...: ${TEXT_COLOR}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      echo -e "${SECONDARY_COLOR}│ Battery...: ${TEXT_COLOR}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p)
    echo -e "${SECONDARY_COLOR}│ Uptime....: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get processes
    PROCESSES=$(ps -e | wc -l)
    echo -e "${SECONDARY_COLOR}│ Processes.: ${TEXT_COLOR}${PROCESSES}${reset}"
    
    # Get username
    USERNAME=$(whoami)
    echo -e "${SECONDARY_COLOR}│ User......: ${TEXT_COLOR}${USERNAME}${reset}"
    
    echo -e "${PRIMARY_COLOR}└───────────────────────────────────────┘${reset}"
    echo ""
  fi
}

# Display system information
display_sysinfo

# Command not found handler
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
  }
fi
