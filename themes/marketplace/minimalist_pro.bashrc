#!/bin/bash

# HackShell v1.1 - Minimalist Pro Theme
# A clean, modern theme with minimal elements for focused work

# Theme information
THEME_NAME="Minimalist Pro"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A clean, modern theme with minimal elements for focused work"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="minimal"
WELCOME_SOUND=true

# Colors - Minimalist palette
PRIMARY_COLOR='\033[1;38;5;238m'   # Dark gray
SECONDARY_COLOR='\033[1;38;5;248m' # Medium gray
ACCENT_COLOR='\033[1;38;5;33m'     # Blue accent
TEXT_COLOR='\033[1;38;5;252m'      # Light gray
PROMPT_COLOR='\033[1;38;5;46m'     # Green
reset='\033[0m'                    # Reset color

# Custom prompt style - clean and minimal
PS1='\[${SECONDARY_COLOR}\][\[${ACCENT_COLOR}\]\w\[${SECONDARY_COLOR}\]] \[${PROMPT_COLOR}\]→ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Hello, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Focus on what matters.${reset}"
  echo "----------------------------------------" 
}

# Display welcome message
welcome_message

# Minimalist banner
display_banner() {
  case "$BANNER_STYLE" in
    "minimal")
      echo -e "${ACCENT_COLOR}
      ┌─┐┬┌┬┐┌─┐┬  ┌─┐
      └─┐│││││ ┬│  ├┤ 
      └─┘┴┴ ┴└─┘┴─┘└─┘
      ${reset}"
      ;;
    *)
      # Fallback banner - also minimal
      echo -e "${ACCENT_COLOR}
      ╔╦╗╦╔╗╔╦╔╦╗╔═╗╦  ╦╔═╗╔╦╗
      ║║║║║║║║║║║╠═╣║  ║╚═╗ ║ 
      ╩ ╩╩╝╚╝╩╩ ╩╩ ╩╩═╝╩╚═╝ ╩ 
      ${reset}"
      ;;
  esac
}

# Display banner
display_banner

# Minimalist quotes
custom_quotes=(
  "Simplicity is the ultimate sophistication."
  "Less is more."
  "Perfection is achieved not when there is nothing more to add, but when there is nothing left to take away."
  "Make it simple, but significant."
  "Simplicity is about subtracting the obvious and adding the meaningful."
  "Simplicity is not the absence of clutter, but rather the presence of the essential."
  "Everything should be made as simple as possible, but not simpler."
  "The ability to simplify means to eliminate the unnecessary so that the necessary may speak."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}${custom_quotes[$rand]}${reset}\n"
fi

# Minimalist system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}┌─ SYSTEM ─────────────────────────────────┐${reset}"
    
    # Get date/time in a minimal format
    echo -e "${SECONDARY_COLOR}│ ${TEXT_COLOR}$(date +"%Y-%m-%d %H:%M")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual bar for memory - minimalist style
    MEM_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 10 )) ]; then
        MEM_BAR+="▪"
      else
        MEM_BAR+="▫"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ RAM: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual bar for storage - minimalist style
    STORAGE_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 10 )) ]; then
        STORAGE_BAR+="▪"
      else
        STORAGE_BAR+="▫"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ Disk: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual bar for battery - minimalist style
      BATT_BAR=""
      for ((i=0; i<10; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 10 )) ]; then
          BATT_BAR+="▪"
        else
          BATT_BAR+="▫"
        fi
      done
      
      echo -e "${SECONDARY_COLOR}│ Batt: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}%${reset}"
    fi
    
    # Get uptime in a minimal format
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}│ Up: ${TEXT_COLOR}${UPTIME}${reset}"
    
    echo -e "${PRIMARY_COLOR}└────────────────────────────────────────┘${reset}"
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
