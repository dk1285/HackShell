#!/bin/bash

# HackShell v1.1 - Minimalist Theme
# A clean, minimal theme for distraction-free terminal work

# Theme information
THEME_NAME="Minimalist"
THEME_AUTHOR="Team ILLUSION"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A clean, minimal theme for distraction-free terminal work"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="minimal"
WELCOME_SOUND=true

# Colors
PRIMARY_COLOR='\033[0;37m'     # Light Gray
SECONDARY_COLOR='\033[1;30m'   # Dark Gray
ACCENT_COLOR='\033[0;36m'      # Cyan
TEXT_COLOR='\033[1;37m'        # White
PROMPT_COLOR='\033[0;32m'      # Green
reset='\033[0m'                # Reset

# Custom prompt style (minimal)
PS1='\[${PRIMARY_COLOR}\][\[${ACCENT_COLOR}\]\W\[${PRIMARY_COLOR}\]] \[${PROMPT_COLOR}\]λ \[${reset}\]'

# Clear screen
clear

# Play welcome sound if enabled
if [ "$WELCOME_SOUND" = "true" ]; then
  mpv /$HOME/HackShell/welcome.mp3 >/dev/null 2>&1
fi

# Clear screen again
clear

# Custom welcome message (simple)
welcome_message() {
  if [ -n "$CUSTOM_NAME" ]; then
    echo -e "${ACCENT_COLOR}Welcome, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}HackShell${reset}"
  fi
  echo ""
}

# Display welcome message
welcome_message

# Show minimal banner
display_banner() {
  echo "${PRIMARY_COLOR}
  ┌───────────────────────────────────┐
  │           HackShell v1.1          │
  │    Simple. Efficient. Powerful.   │
  └───────────────────────────────────┘
  ${reset}"
}

# Display banner
display_banner

# Display date and time
echo -e "\n${SECONDARY_COLOR}$(date +"%A, %B %d, %Y - %H:%M")${reset}\n"

# Show system information if enabled (simplified)
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
    
    # Get battery info if available
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      BATT_INFO="${BATT_CAPACITY}% (${BATT_STATUS})"
    else
      BATT_INFO="N/A"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    
    # Print in a minimal format
    echo -e "${SECONDARY_COLOR}Memory: ${TEXT_COLOR}${MEM_PERCENT}%  ${SECONDARY_COLOR}Storage: ${TEXT_COLOR}${STORAGE_PERCENT}  ${SECONDARY_COLOR}Battery: ${TEXT_COLOR}${BATT_INFO}  ${SECONDARY_COLOR}Uptime: ${TEXT_COLOR}${UPTIME}${reset}"
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
