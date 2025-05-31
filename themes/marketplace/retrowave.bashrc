#!/bin/bash

# HackShell v1.1 - Retrowave Theme
# A vibrant 80s inspired theme with neon colors

# Theme information
THEME_NAME="Retrowave"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="Synthwave/retrowave theme with vibrant neon colors from the 80s"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="retro"
WELCOME_SOUND=true

# Colors - Vibrant retrowave palette
PRIMARY_COLOR='\033[1;38;5;205m'   # Hot pink
SECONDARY_COLOR='\033[1;38;5;51m'  # Cyan
ACCENT_COLOR='\033[1;38;5;219m'    # Light purple
TEXT_COLOR='\033[1;38;5;225m'      # Light pink
PROMPT_COLOR='\033[1;38;5;118m'    # Neon green
reset='\033[0m'                    # Reset color

# Custom prompt style with retrowave flair
PS1='\[${PRIMARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]\T\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]RetroShell\[${PRIMARY_COLOR}\]]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[${PRIMARY_COLOR}\]─[\[${ACCENT_COLOR}\]⚡'$BATT_CAPACITY'%\[${PRIMARY_COLOR}\]]'
fi

PS1+='\[${PRIMARY_COLOR}\]\n└──╼ \[${PROMPT_COLOR}\]● \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome to the Grid, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Press RETURN to enter the Cyberspace${reset}"
  echo "======================================" | lolcat -a -d 3
}

# Display welcome message
welcome_message

# Retrowave banner
display_banner() {
  case "$BANNER_STYLE" in
    "retro")
      echo "
██████╗ ███████╗████████╗██████╗  ██████╗     ██╗    ██╗ █████╗ ██╗   ██╗███████╗
██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗    ██║    ██║██╔══██╗██║   ██║██╔════╝
██████╔╝█████╗     ██║   ██████╔╝██║   ██║    ██║ █╗ ██║███████║██║   ██║█████╗  
██╔══██╗██╔══╝     ██║   ██╔══██╗██║   ██║    ██║███╗██║██╔══██║╚██╗ ██╔╝██╔══╝  
██║  ██║███████╗   ██║   ██║  ██║╚██████╔╝    ╚███╔███╔╝██║  ██║ ╚████╔╝ ███████╗
╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝      ╚══╝╚══╝ ╚═╝  ╚═╝  ╚═══╝  ╚══════╝
                                                                                  
      " | lolcat -a -d 3 -s 50
      ;;
    *)
      # Fallback banner
      echo "
       ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄ 
      ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
      ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ 
      ▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌          
      ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄ 
      ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
      ▐░█▀▀▀▀█░█▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌ ▀▀▀▀▀▀▀▀▀█░▌
      ▐░▌     ▐░▌  ▐░▌          ▐░▌       ▐░▌▐░▌       ▐░▌          ▐░▌
      ▐░▌      ▐░▌ ▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌ ▄▄▄▄▄▄▄▄▄█░▌
      ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
       ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀ 
      " | lolcat -a -d 2
      ;;
  esac
}

# Display banner
display_banner

# 80s and synthwave inspired quotes
custom_quotes=(
  "The future is now, old man."
  "Welcome to the digital frontier."
  "Where we're going, we don't need roads."
  "Life moves pretty fast. If you don't stop and look around once in a while, you could miss it."
  "Hack the planet!"
  "A world of neon dreams and digital realities."
  "Stay rad and keep hacking."
  "Power glove activated. It's so bad."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}${custom_quotes[$rand]}${reset}\n"
fi

# Show system information with retrowave styling
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╔═══════════ SYSTEM STATUS ═══════════╗${reset}"
    
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
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      echo -e "${SECONDARY_COLOR}▸ Battery: ${TEXT_COLOR}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p)
    echo -e "${SECONDARY_COLOR}▸ Uptime: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}▸ CPU Temp: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    echo -e "${PRIMARY_COLOR}╚════════════════════════════════════╝${reset}"
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
