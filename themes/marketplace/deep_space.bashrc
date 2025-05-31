#!/bin/bash

# HackShell v1.1 - Deep Space Theme
# A cosmic space-themed terminal with dark void colors and stars

# Theme information
THEME_NAME="Deep Space"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A cosmic space-themed terminal with dark void colors and stars"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="space"
WELCOME_SOUND=true

# Colors - Space palette
PRIMARY_COLOR='\033[1;38;5;17m'    # Deep blue
SECONDARY_COLOR='\033[1;38;5;61m'  # Purple blue
ACCENT_COLOR='\033[1;38;5;141m'    # Light purple
TEXT_COLOR='\033[1;38;5;189m'      # Light blue-white
PROMPT_COLOR='\033[1;38;5;39m'     # Blue
reset='\033[0m'                    # Reset color

# Custom prompt style with space symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${SECONDARY_COLOR}\]✨\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─🚀 \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome, Astronaut ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Venturing into the infinite void...${reset}"
  echo "✨🌟⭐✨🌟⭐✨🌟⭐✨🌟⭐✨🌟⭐✨🌟⭐✨" | lolcat -a -F 0.3
}

# Display welcome message
welcome_message

# Space-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "space")
      echo "
      .              +   .                .   . .     .  .
                   .                    .       .     *
        .       *                        . . . .  .   .  + .
                  .   .               .   .  +  . . .
      .                     .   .   .   .   . . .     . .
              .       .     . + .  .  .  .. +  .
            *         .      .   .   .      .  .  ..  *  .
           .      .   . .    .    .    . .  .    + . 
              . . .  .   .  +   .  .  +  . . .  .  .  +  . .
            .       .   .   .   . .  +   .   .   +  .   .
              .       .   .     .       .       . +
         + . + .  .  .  . .  +   .  .  .  .     .  +  . +  .
        .      .   . .    .   .   .  .   .    .   .      . .
          . .  .  .   .  . . . .   .  .   .   .    .  +   .
            *    .  .   . . .    .   .  .   .     .   . .  .
             .      .     .    .      . . .    .       .  .
          .     .     . .   . . .   .    .  .   .    . . . .
           .   .   .      .     .     . +  .    +    .     .
             .   .   .     .      .   .      .    .   .
           .      .    .    .  .    .    .   .  .  +  . .
             . .  .  .  . .  .  . . .  . . +.    .   .
              .   .    .     . .   . .   .   .   .    .  +  .
             .  .    . . .     .  .   .  +  . . . .  *  . .
        *   .  .    . .        . . .  .         .    . +  
      " | lolcat -a -d 2
      
      echo -e "${ACCENT_COLOR}
       ██████╗ ███████╗███████╗██████╗     ███████╗██████╗  █████╗  ██████╗███████╗
       ██╔══██╗██╔════╝██╔════╝██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝
       ██║  ██║█████╗  █████╗  ██████╔╝    ███████╗██████╔╝███████║██║     █████╗  
       ██║  ██║██╔══╝  ██╔══╝  ██╔═══╝     ╚════██║██╔═══╝ ██╔══██║██║     ██╔══╝  
       ██████╔╝███████╗███████╗██║         ███████║██║     ██║  ██║╚██████╗███████╗
       ╚═════╝ ╚══════╝╚══════╝╚═╝         ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚══════╝
      ${reset}"
      ;;
    *)
      # Fallback banner
      echo "
      *      .       .    *    .       .      .     *     .     .
          .   .          .          .    *        .           .
        .           *             .         .            .
         .                      .         .         .        .
       .    *         .              .       .     *
      .         .            .    .     .        .        .
            .    .      .                   .
         .           .            .        .            .
        .     *                .     .      .        .
      .                 .                    .        .     .
            .        .         .          *         .        .
      " | lolcat -a -d 1
      
      echo "
       _____                  _____                    
      |  __ \                / ____|                   
      | |  | | ___  ___ _ __| (___  _ __   __ _  ___ ___ 
      | |  | |/ _ \/ _ \ '_ \\___ \| '_ \ / _\` |/ __/ _ \\
      | |__| |  __/  __/ |_) |___) | |_) | (_| | (_|  __/
      |_____/ \___|\___| .__/|____/| .__/ \__,_|\___\___|
                       | |         | |                   
                       |_|         |_|                   
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Space exploration quotes
custom_quotes=(
  "Space: the final frontier."
  "Across the sea of space, the stars are other suns."
  "The universe is under no obligation to make sense to you."
  "Not all those who wander in cyberspace are lost."
  "We are made of star stuff."
  "The cosmos is within us. We are a way for the universe to know itself."
  "The stars don't look bigger, but they do look brighter."
  "I'm sure the universe is full of intelligent life. It's just been too intelligent to come here."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Space-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}┏━━━━━━━━━━ SPACECRAFT TELEMETRY ━━━━━━━━━━┓${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}┃ Stardate....: ${TEXT_COLOR}$(date +"%Y.%m.%d-%H.%M")${reset}"
    
    # Get memory usage with space meter
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual star bar for memory
    MEM_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 10 )) ]; then
        MEM_BAR+="★"
      else
        MEM_BAR+="☆"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}┃ Life Support.: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info with space meter
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual star bar for storage
    STORAGE_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 10 )) ]; then
        STORAGE_BAR+="★"
      else
        STORAGE_BAR+="☆"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}┃ Cargo Bay....: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info with space meter
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual star bar for battery
      BATT_BAR=""
      for ((i=0; i<10; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 10 )) ]; then
          BATT_BAR+="★"
        else
          BATT_BAR+="☆"
        fi
      done
      
      # Choose battery icon based on status
      if [ "$BATT_STATUS" == "Charging" ]; then
        BATT_ICON="⚡"
      else
        BATT_ICON="🔋"
      fi
      
      echo -e "${SECONDARY_COLOR}┃ Reactor Power: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}% ${BATT_ICON}${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}┃ Mission Time.: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}┃ Core Temp....: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get CPU load
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | xargs)
    echo -e "${SECONDARY_COLOR}┃ Grav. Field..: ${TEXT_COLOR}${LOAD}${reset}"
    
    # Get IP if available
    if command -v ip &> /dev/null; then
      IP_ADDR=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v "127.0.0.1" | head -n 1)
      if [ -n "$IP_ADDR" ]; then
        echo -e "${SECONDARY_COLOR}┃ Coordinates..: ${TEXT_COLOR}${IP_ADDR}${reset}"
      fi
    fi
    
    # Get user info
    USER=$(whoami)
    echo -e "${SECONDARY_COLOR}┃ Commander....: ${TEXT_COLOR}${USER}${reset}"
    
    echo -e "${PRIMARY_COLOR}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${reset}"
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
