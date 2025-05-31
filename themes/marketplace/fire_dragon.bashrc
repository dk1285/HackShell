#!/bin/bash

# HackShell v1.1 - Fire Dragon Theme
# A powerful flame-inspired theme with fiery colors and dragon imagery

# Theme information
THEME_NAME="Fire Dragon"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A powerful flame-inspired theme with fiery colors and dragon imagery"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="dragon"
WELCOME_SOUND=true

# Colors - Fiery palette
PRIMARY_COLOR='\033[1;38;5;160m'   # Deep red
SECONDARY_COLOR='\033[1;38;5;208m' # Orange
ACCENT_COLOR='\033[1;38;5;220m'    # Yellow
TEXT_COLOR='\033[1;38;5;255m'      # Bright white
PROMPT_COLOR='\033[1;38;5;196m'    # Bright red
reset='\033[0m'                    # Reset color

# Custom prompt style with dragon and flame symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${SECONDARY_COLOR}\]🔥\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─🐉 \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${SECONDARY_COLOR}Welcome, Dragon Tamer ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${SECONDARY_COLOR}Welcome to ${ACCENT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Ignite your terminal with the power of the dragon...${reset}"
  echo "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥" | lolcat -a -F 0.5
}

# Display welcome message
welcome_message

# Dragon-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "dragon")
      echo -e "${SECONDARY_COLOR}
                /\     /\\
               (  \___/  )
                \       /
                 \     /
                 (     )
                 /     \\
                /       \\
               /         \\
              /           \\
             /|    ___    |\\
            ( |   /   \   | )
            / |   \___/   | \\
           / /             \ \\
          / /               \ \\
         /  \               /  \\
        /    \             /    \\
       /     |\\___________/|     \\
      /      |             |      \\
    /        |             |        \\
  /          |             |          \\
 (____________)           (____________)
      ${reset}"
      
      echo -e "${PRIMARY_COLOR}
      ▒█▀▀▀ ▀█▀ █▀▀█ █▀▀ 　 ▒█▀▀▄ █▀▀█ █▀▀█ █▀▀▀ █▀▀█ █▀▀▄ 
      ▒█▀▀▀ ▒█░ █▄▄▀ █▀▀ 　 ▒█░▒█ █▄▄▀ █▄▄█ █░▀█ █░░█ █░░█ 
      ▒█░░░ ▄█▄ ▀░▀▀ ▀▀▀ 　 ▒█▄▄▀ ▀░▀▀ ▀░░▀ ▀▀▀▀ ▀▀▀▀ ▀░░▀
      ${reset}" | lolcat -a -d 1
      ;;
    *)
      # Fallback banner
      echo "
      (                 )  
      |\               /|  
      | \             / |  
      |  \           /  |  
      |   \         /   |  
      |    \       /    |  
      |     \     /     |  
      |      \   /      |  
      |       \ /       |  
      |        X        |  
      |       / \       |  
      |      /   \      |  
      |     /     \     |  
      |    /       \    |  
      |   /         \   |  
      |  /           \  |  
      | /             \ |  
      |/               \|  
      (                 )  
      " | lolcat -a -d 1
      
      echo "
       _______ _____ _____  ______   _____  _____          _____  ____  _   _ 
      |__   __|_   _|  __ \|  ____| |  __ \|  __ \   /\   / ____|/ __ \| \ | |
         | |    | | | |__) | |__    | |  | | |__) | /  \ | |  __| |  | |  \| |
         | |    | | |  _  /|  __|   | |  | |  _  / / /\ \| | |_ | |  | | . ` |
         | |   _| |_| | \ \| |____  | |__| | | \ \/ ____ \ |__| | |__| | |\  |
         |_|  |_____|_|  \_\______| |_____/|_|  \_\/    \_\_____|\____/|_| \_|
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Dragon and fire quotes
custom_quotes=(
  "May your code burn bright and your bugs turn to ash."
  "Not all dragons breathe fire, but all programmers debug."
  "From the ashes of crashed code, the phoenix of solutions rises."
  "Let the fire of inspiration fuel your coding journey."
  "Sometimes you need to burn the whole codebase down and start fresh."
  "In the realm of fire, only the strongest code survives."
  "When facing a dragon-sized problem, approach one scale at a time."
  "The flame that burns twice as bright burns half as long, except for well-optimized code."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Dragon-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╔══════════ DRAGON VITALS ══════════╗${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}║ Time of Day..: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    
    # Get memory usage with flame meter
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual flame meter for memory
    MEM_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 10 )) ]; then
        MEM_BAR+="🔥"
      else
        MEM_BAR+="·"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}║ Flame Power..: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info with flame meter
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual flame meter for storage
    STORAGE_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 10 )) ]; then
        STORAGE_BAR+="🔥"
      else
        STORAGE_BAR+="·"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}║ Hoard Size...: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info with flame meter
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual flame meter for battery
      BATT_BAR=""
      for ((i=0; i<10; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 10 )) ]; then
          BATT_BAR+="🔥"
        else
          BATT_BAR+="·"
        fi
      done
      
      # Choose battery icon based on status
      if [ "$BATT_STATUS" == "Charging" ]; then
        BATT_ICON="⚡"
      else
        BATT_ICON="🐉"
      fi
      
      echo -e "${SECONDARY_COLOR}║ Dragon Energy: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}% ${BATT_ICON}${reset}"
    fi
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}║ Breath Temp..: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}║ Awake For....: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU load
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | xargs)
    echo -e "${SECONDARY_COLOR}║ Battle Fatigue: ${TEXT_COLOR}${LOAD}${reset}"
    
    # Get user name
    USER=$(whoami)
    echo -e "${SECONDARY_COLOR}║ Dragon Rider.: ${TEXT_COLOR}${USER}${reset}"
    
    echo -e "${PRIMARY_COLOR}╚══════════════════════════════════════╝${reset}"
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
