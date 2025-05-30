#!/bin/bash

# HackShell v1.1 - Neon City Theme
# A vibrant cyberpunk-inspired theme with neon colors

# Theme information
THEME_NAME="Neon City"
THEME_AUTHOR="Team ILLUSION"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A vibrant cyberpunk-inspired theme with neon colors"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="cyberpunk"
WELCOME_SOUND=true

# Colors
PRIMARY_COLOR='\033[1;36m'     # Cyan
SECONDARY_COLOR='\033[1;35m'   # Magenta
ACCENT_COLOR='\033[1;33m'      # Yellow
TEXT_COLOR='\033[1;37m'        # White
PROMPT_COLOR='\033[1;92m'      # Bright Green
reset='\033[0m'                # Reset

# Custom prompt style
PS1='\[${PRIMARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]\T\[${PRIMARY_COLOR}\]]─────\[${SECONDARY_COLOR}\][NeonCity]\[${PRIMARY_COLOR}\]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[${PRIMARY_COLOR}\]──[\[${ACCENT_COLOR}\]⚡'$BATT_CAPACITY'%\[${PRIMARY_COLOR}\]]'
fi

PS1+='\[${PRIMARY_COLOR}\]\n|\n\[${PRIMARY_COLOR}\]└─[\[${PRIMARY_COLOR}\]\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]────►\[${PROMPT_COLOR}\] '

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
    echo -e "${ACCENT_COLOR}Welcome to Night City, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}Night City${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Created by ${TEXT_COLOR}Team ILLUSION${reset}"
  echo "-----------------------------------" | lolcat -F 0.5
}

# Display welcome message
welcome_message

# Show banner
display_banner() {
  echo "${PRIMARY_COLOR}
  ███╗   ██╗███████╗ ██████╗ ███╗   ██╗     ██████╗██╗████████╗██╗   ██╗
  ████╗  ██║██╔════╝██╔═══██╗████╗  ██║    ██╔════╝██║╚══██╔══╝╚██╗ ██╔╝
  ██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║    ██║     ██║   ██║    ╚████╔╝ 
  ██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║    ██║     ██║   ██║     ╚██╔╝  
  ██║ ╚████║███████╗╚██████╔╝██║ ╚████║    ╚██████╗██║   ██║      ██║   
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝╚═╝   ╚═╝      ╚═╝   
  ${reset}" | lolcat -F 0.3
}

# Display banner
display_banner

# Custom quotes
custom_quotes=(
  "The city lights hide the darkest secrets."
  "In this city, technology is both savior and destroyer."
  "The neon never sleeps, and neither do the hackers."
  "Behind every bright light is a shadow worth exploring."
  "When the system fails, the underground thrives."
  "Reality is just a matter of perception and code."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}${custom_quotes[$rand]}${reset}\n"
fi

# Show system information if enabled
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╔══════════════ SYSTEM INFO ══════════════╗${reset}"
    
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
    
    # Get network info
    WIFI_IP=$(ifconfig wlan0 2>/dev/null | grep -E "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -v "127.0.0.1" | awk '{print $2}' | cut -d: -f2)
    if [ ! -z "$WIFI_IP" ]; then
      echo -e "${SECONDARY_COLOR}▸ Network: ${TEXT_COLOR}WiFi ($WIFI_IP)${reset}"
    else
      DATA_IP=$(ifconfig rmnet0 2>/dev/null | grep -E "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -v "127.0.0.1" | awk '{print $2}' | cut -d: -f2)
      if [ ! -z "$DATA_IP" ]; then
        echo -e "${SECONDARY_COLOR}▸ Network: ${TEXT_COLOR}Mobile Data ($DATA_IP)${reset}"
      else
        echo -e "${SECONDARY_COLOR}▸ Network: ${TEXT_COLOR}Not connected${reset}"
      fi
    fi
    
    echo -e "${PRIMARY_COLOR}╚════════════════════════════════════════╝${reset}"
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
