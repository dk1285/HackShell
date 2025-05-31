#!/bin/bash

# HackShell v1.1 - Dark Forest Theme
# A theme inspired by dark forests and nature

# Theme information
THEME_NAME="Dark Forest"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A nature-inspired dark theme with forest colors and elements"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="forest"
WELCOME_SOUND=true

# Colors - Natural forest palette
PRIMARY_COLOR='\033[1;38;5;22m'    # Dark green
SECONDARY_COLOR='\033[1;38;5;28m'  # Medium green
ACCENT_COLOR='\033[1;38;5;70m'     # Light green
TEXT_COLOR='\033[1;38;5;193m'      # Pale green
PROMPT_COLOR='\033[1;38;5;35m'     # Bright green
reset='\033[0m'                    # Reset color

# Custom prompt style with leaf symbols
PS1='\[${SECONDARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]\T\[${SECONDARY_COLOR}\]]─[\[${PRIMARY_COLOR}\]⚘\[${SECONDARY_COLOR}\]]─[\[${ACCENT_COLOR}\]\w\[${SECONDARY_COLOR}\]]\n'
PS1+='\[${SECONDARY_COLOR}\]└─⊣ \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome to the forest, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to the ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}The trees are alive with secrets...${reset}"
  echo "~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~⚘~" | lolcat -f
}

# Display welcome message
welcome_message

# Forest-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "forest")
      echo -e "${PRIMARY_COLOR}
      |\\
      ||
      ||
      ||                    .
      ||                   /|\\
      ||          ,--.    / | \\
     ,|||.       |    |   | | |
    .;||||;.     |    |   | | |
     ;|||||;     |____|   | | |  __                           _
      \\|||/            \\__/ /   /  \\  _    _    ,_ ____  ___, / \\_
       |||                  /   | || | |  | || /  /  _ \\|  _/|    \\
       |||                 /    | || | |  | ||/  /| |_) | |  | () |
       |||                /     | \\/ /\\/\\/ / |  / |  __/| |_ |    /
       |||              ./       \\__/\\____/  |_/  |_|   \\___\\\\_/\\_\\
       |||             /
       |||          __/
       |||         /
       ||\\\\_______/
     __||_|_|_|_|__
    |_|_|_|_|_|_|_|      " | lolcat -a -d 1
      ;;
    *)
      # Fallback banner
      echo -e "${PRIMARY_COLOR}
       _____               _      _____                     _   
      |   | |___ ___ _____|_|    |   __|___ ___ ___ ___ ___| |_ 
      | | | | .'|  _|     | |    |   __|  _| . |  _| -_|_ -|  _|
      |_|___|__,|_| |_|_|_|_|    |__|  |_| |___|_| |___|___|_|  
                                                              ${reset}"
      ;;
  esac
}

# Display banner
display_banner

# Nature and forest quotes
custom_quotes=(
  "The clearest way into the Universe is through a forest wilderness."
  "The forest is a peculiar organism of unlimited kindness."
  "In every walk with nature one receives far more than one seeks."
  "Between every two pines is a doorway to a new world."
  "The earth has music for those who listen."
  "Look deep into nature, and then you will understand everything better."
  "Nature does not hurry, yet everything is accomplished."
  "The mountains are calling and I must go."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Nature-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}┏━━━━━━━━━━ ECOSYSTEM VITALS ━━━━━━━━━━┓${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}┃ Season.....: ${TEXT_COLOR}$(date +"%B")${reset}"
    echo -e "${SECONDARY_COLOR}┃ Day........: ${TEXT_COLOR}$(date +"%A, %d %B %Y")${reset}"
    echo -e "${SECONDARY_COLOR}┃ Time.......: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual bar for memory
    MEM_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 10 )) ]; then
        MEM_BAR+="■"
      else
        MEM_BAR+="□"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}┃ Nutrients...: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual bar for storage
    STORAGE_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 10 )) ]; then
        STORAGE_BAR+="■"
      else
        STORAGE_BAR+="□"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}┃ Growth.....: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual bar for battery
      BATT_BAR=""
      for ((i=0; i<10; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 10 )) ]; then
          BATT_BAR+="■"
        else
          BATT_BAR+="□"
        fi
      done
      
      echo -e "${SECONDARY_COLOR}┃ Sunlight...: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}%${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}┃ Age........: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get weather if possible
    if command -v curl &> /dev/null && command -v jq &> /dev/null; then
      TEMP=$(curl -s wttr.in/?format="%t" 2>/dev/null || echo "Unknown")
      echo -e "${SECONDARY_COLOR}┃ Weather....: ${TEXT_COLOR}${TEMP}${reset}"
    fi
    
    echo -e "${PRIMARY_COLOR}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${reset}"
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
