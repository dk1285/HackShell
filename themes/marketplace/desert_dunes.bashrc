#!/bin/bash

# HackShell v1.1 - Desert Dunes Theme
# A warm sand-colored theme inspired by desert landscapes

# Theme information
THEME_NAME="Desert Dunes"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A warm theme inspired by desert landscapes and sand dunes"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="desert"
WELCOME_SOUND=true

# Colors - Desert-inspired palette
PRIMARY_COLOR='\033[1;38;5;172m'   # Sandy orange
SECONDARY_COLOR='\033[1;38;5;137m' # Light brown
ACCENT_COLOR='\033[1;38;5;214m'    # Bright orange
TEXT_COLOR='\033[1;38;5;223m'      # Light sand
PROMPT_COLOR='\033[1;38;5;208m'    # Deep orange
reset='\033[0m'                    # Reset color

# Custom prompt style with desert symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]☀\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─✧ \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome to the dunes, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to the ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}The sands of time reveal many secrets...${reset}"
  echo "✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧✧" | lolcat -a
}

# Display welcome message
welcome_message

# Desert-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "desert")
      echo "
           .-.                                             
          /   \\         .-.                                
     .--.|     |  .--.  |                                  
    /    \\     / /    \\ |                               
   |      \\   / |      ||                             
   |   ___ \\|/  |   ___||    .-.                    
   \\  /   \\ |   \\  /   ||   /   \\    .-.        .-.   
    \\|     \\|    \\|     || .|     |   |         |     
     |     ||     |     || ||     |   |         |     
     |     ||     |     |\\  |     |   |         |     
     |     ||     |     | \\ |     |   |         |     
     |     ||     |     |  \\|     |   |         |     
     |     ||     |     |   |     |   |         |     
     |_____||_____|_____|   |_____|   |_________|     
      " | lolcat -p -a -d 1 -s 50
      echo -e "${ACCENT_COLOR}
        ██████╗ ███████╗███████╗███████╗██████╗ ████████╗    ██████╗ ██╗   ██╗███╗   ██╗███████╗███████╗
        ██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗╚══██╔══╝    ██╔══██╗██║   ██║████╗  ██║██╔════╝██╔════╝
        ██║  ██║█████╗  ███████╗█████╗  ██████╔╝   ██║       ██║  ██║██║   ██║██╔██╗ ██║█████╗  ███████╗
        ██║  ██║██╔══╝  ╚════██║██╔══╝  ██╔══██╗   ██║       ██║  ██║██║   ██║██║╚██╗██║██╔══╝  ╚════██║
        ██████╔╝███████╗███████║███████╗██║  ██║   ██║       ██████╔╝╚██████╔╝██║ ╚████║███████╗███████║
        ╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝       ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝
      ${reset}"
      ;;
    *)
      # Fallback banner
      echo "
      .      *    *           *.       *   .                      *     .
          .   *         .   .            .      .         .    *         *  .
 .    *            .                *        .       *    .               .
    .     *              .    .    *    .        .         .        *     .
 .      .         *         .      .         .   .        .     .     *     
    .  *       .              .       .      *         .         .         .
 .     .     .          *          .      .         .     .     *   .      *
    *     .    .   .     .     *        .      .    *  .        .         .
 .      .         .          .    *         *                 .       *    .
    .   *   .    .      .              .        .     *     .     .      . 
 .      .      .     .       .         *        .       .       *       .  
      ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄ 
     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
     ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ 
     ▐░▌          ▐░▌          ▐░▌          ▐░▌          ▐░▌       ▐░▌▐░▌          
     ▐░▌ ▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ 
     ▐░▌▐░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
     ▐░▌ ▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀█░█▀▀  ▀▀▀▀▀▀▀▀▀█░▌
     ▐░▌       ▐░▌▐░▌                    ▐░▌▐░▌          ▐░▌     ▐░▌            ▐░▌
     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌      ▐░▌ ▄▄▄▄▄▄▄▄▄█░▌
     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
      ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀ 
      " | lolcat -p -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Desert and sand quotes
custom_quotes=(
  "The desert is a natural extension of the inner silence of the body."
  "In the desert, you can remember your name."
  "All the secrets of the world are contained in books. Read at your own risk."
  "The desert tells a different story every time one ventures on it."
  "What makes the desert beautiful is that somewhere it hides a well."
  "I am a desert creature, a wanderer by nature."
  "The vastness of the desert can only be appreciated through experience."
  "In every grain of sand is a story of the earth."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Desert-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╭───────────── OASIS STATUS ─────────────╮${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}│ Sun Position: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    echo -e "${SECONDARY_COLOR}│ Day of Journey: ${TEXT_COLOR}$(date +"%A, %d %B %Y")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual bar for memory
    MEM_BAR=$(printf '▓%.0s' $(seq 1 $(( MEM_PERCENT / 5 ))))
    MEM_SPACE=$(printf '░%.0s' $(seq 1 $(( 20 - MEM_PERCENT / 5 ))))
    
    echo -e "${SECONDARY_COLOR}│ Water Supply: ${TEXT_COLOR}${MEM_BAR}${MEM_SPACE} ${MEM_PERCENT}%${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual bar for storage
    STORAGE_BAR=$(printf '▓%.0s' $(seq 1 $(( STORAGE_PERCENT / 5 ))))
    STORAGE_SPACE=$(printf '░%.0s' $(seq 1 $(( 20 - STORAGE_PERCENT / 5 ))))
    
    echo -e "${SECONDARY_COLOR}│ Provisions: ${TEXT_COLOR}${STORAGE_BAR}${STORAGE_SPACE} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual bar for battery
      BATT_BAR=$(printf '▓%.0s' $(seq 1 $(( BATT_CAPACITY / 5 ))))
      BATT_SPACE=$(printf '░%.0s' $(seq 1 $(( 20 - BATT_CAPACITY / 5 ))))
      
      echo -e "${SECONDARY_COLOR}│ Energy: ${TEXT_COLOR}${BATT_BAR}${BATT_SPACE} ${BATT_CAPACITY}%${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}│ Travel Duration: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      TEMP_C=$(echo "scale=1; $TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}│ Heat Level: ${TEXT_COLOR}${TEMP_C}°C${reset}"
    fi
    
    # Get processes
    PROCESSES=$(ps -e | wc -l)
    echo -e "${SECONDARY_COLOR}│ Caravan Size: ${TEXT_COLOR}${PROCESSES} members${reset}"
    
    echo -e "${PRIMARY_COLOR}╰─────────────────────────────────────────╯${reset}"
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
