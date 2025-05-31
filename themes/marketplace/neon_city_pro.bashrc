#!/bin/bash

# HackShell v1.1 - Neon City Pro Theme
# An enhanced version of the popular Neon City theme

# Theme information
THEME_NAME="Neon City Pro"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="Enhanced cyberpunk city theme with vibrant neon colors and sleek design"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="neon"
WELCOME_SOUND=true

# Colors - Vibrant neon palette
PRIMARY_COLOR='\033[1;38;5;129m'   # Purple
SECONDARY_COLOR='\033[1;38;5;201m' # Pink
ACCENT_COLOR='\033[1;38;5;51m'     # Cyan
TEXT_COLOR='\033[1;38;5;231m'      # Bright white
PROMPT_COLOR='\033[1;38;5;118m'    # Neon green
reset='\033[0m'                    # Reset color

# Custom prompt style with neon aesthetics
PS1='\[${PRIMARY_COLOR}\]┌─[\[${SECONDARY_COLOR}\]\T\[${PRIMARY_COLOR}\]]─[\[${ACCENT_COLOR}\]N\[${SECONDARY_COLOR}\]E\[${ACCENT_COLOR}\]O\[${SECONDARY_COLOR}\]N\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─╼ \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${SECONDARY_COLOR}Welcome to ${ACCENT_COLOR}N${SECONDARY_COLOR}E${ACCENT_COLOR}O${SECONDARY_COLOR}N ${ACCENT_COLOR}C${SECONDARY_COLOR}I${ACCENT_COLOR}T${SECONDARY_COLOR}Y${ACCENT_COLOR}, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${SECONDARY_COLOR}Welcome to ${ACCENT_COLOR}N${SECONDARY_COLOR}E${ACCENT_COLOR}O${SECONDARY_COLOR}N ${ACCENT_COLOR}C${SECONDARY_COLOR}I${ACCENT_COLOR}T${SECONDARY_COLOR}Y${reset}"
  fi
  echo -e "${ACCENT_COLOR}The future is now.${reset}"
  echo "=======================================" | lolcat -a -d 2
}

# Display welcome message
welcome_message

# Neon-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "neon")
      echo "
      .------..------..------..------..------.     .------..------..------..------..------.
      |N.--. ||E.--. ||O.--. ||N.--. ||-.--. |.-.  |C.--. ||I.--. ||T.--. ||Y.--. ||-.--. |
      | :(): || (\/) || :/\: || :(): || (\/) ((5)) | :/\: || (\/) || :/\: || (\/) || (\/) |
      | ()() || :\/: || :\/: || ()() || :\/: |'-.-.| :\/: || :\/: || (__) || :\/: || :\/: |
      | '--'N|| '--'E|| '--'O|| '--'N|| '--'-'     | '--'C|| '--'I|| '--'T|| '--'Y|| '--'-'
      '------''------''------''------''------'     '------''------''------''------''------'
      " | lolcat -a -d 3 -s 40
      
      echo "
      ██████   ██████  ██████  ██████   ██████ 
     ░░██████ ██████  ███████ ░░██████ ██████  
      ░███░████░███  ░███░███  ░███░████░███   
      ░███░░██ ░███  ░███░███  ░███░░██ ░███   
      ░███ ░░  ░███  ░███░███  ░███ ░░  ░███   
      ░███     ░███  ░███░███  ░███     ░███   
      █████    █████ ███████████████    █████  
     ░░░░░    ░░░░░ ░░░░░░░░░░░░░░░    ░░░░░   
      " | lolcat -a -d 2
      ;;
    *)
      # Fallback banner
      echo "
       _   _  ____   ___  _   _    ____ ___ _______   __
      | \ | |/ ___| / _ \| \ | |  / ___|_ _|_   _\ \ / /
      |  \| | |    | | | |  \| | | |    | |  | |  \ V / 
      | |\  | |___ | |_| | |\  | | |___ | |  | |   | |  
      |_| \_|\____| \___/|_| \_|  \____|___| |_|   |_|  
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Cyberpunk/neon city quotes
custom_quotes=(
  "The sky above the city was the color of a monitor, tuned to a dead channel."
  "Neon lights, big city, dreams made, dreams broken."
  "In the shadows of neon lights, hackers rule the night."
  "Beyond the digital horizon lies unlimited potential."
  "The future is already here — it's just not evenly distributed."
  "Beneath the neon glow, data flows like a digital river."
  "The brightest lights cast the darkest shadows."
  "Hack the planet. Hack the future. Hack reality."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${SECONDARY_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Neon-themed system information with cyberpunk styling
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}┏━━━━━━━━━━ SYSTEM DIAGNOSTICS ━━━━━━━━━━┓${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}┃ Timestamp...: ${TEXT_COLOR}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
    
    # Get memory usage with neon bar
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    MEM_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 5 )) ]; then
        MEM_BAR+="█"
      else
        MEM_BAR+="░"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}┃ Memory......: ${ACCENT_COLOR}${MEM_BAR} ${TEXT_COLOR}${MEM_PERCENT}%${reset}"
    
    # Get storage info with neon bar
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    STORAGE_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 5 )) ]; then
        STORAGE_BAR+="█"
      else
        STORAGE_BAR+="░"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}┃ Storage.....: ${ACCENT_COLOR}${STORAGE_BAR} ${TEXT_COLOR}${STORAGE_PERCENT}%${reset}"
    
    # Get battery info with neon bar
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      BATT_BAR=""
      for ((i=0; i<20; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 5 )) ]; then
          BATT_BAR+="█"
        else
          BATT_BAR+="░"
        fi
      done
      
      # Choose battery icon based on status
      if [ "$BATT_STATUS" == "Charging" ]; then
        BATT_ICON="⚡"
      else
        BATT_ICON="🔋"
      fi
      
      echo -e "${SECONDARY_COLOR}┃ Battery.....: ${ACCENT_COLOR}${BATT_BAR} ${TEXT_COLOR}${BATT_CAPACITY}% ${BATT_ICON}${reset}"
    fi
    
    # Get network info if available
    if command -v ip &> /dev/null; then
      IP_ADDR=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v "127.0.0.1" | head -n 1)
      if [ -n "$IP_ADDR" ]; then
        echo -e "${SECONDARY_COLOR}┃ Network.....: ${TEXT_COLOR}${IP_ADDR}${reset}"
      fi
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}┃ Uptime......: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU load
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | xargs)
    echo -e "${SECONDARY_COLOR}┃ System Load.: ${TEXT_COLOR}${LOAD}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}┃ CPU Temp....: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get processes
    PROCESSES=$(ps -e | wc -l)
    echo -e "${SECONDARY_COLOR}┃ Processes...: ${TEXT_COLOR}${PROCESSES}${reset}"
    
    echo -e "${PRIMARY_COLOR}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${reset}"
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
