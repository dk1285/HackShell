#!/bin/bash

# HackShell v1.1 - Retro Arcade Theme
# A nostalgic arcade game inspired theme with pixel art aesthetics

# Theme information
THEME_NAME="Retro Arcade"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A nostalgic arcade game inspired theme with pixel art aesthetics"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="arcade"
WELCOME_SOUND=true

# Colors - Arcade palette
PRIMARY_COLOR='\033[1;38;5;27m'    # Blue
SECONDARY_COLOR='\033[1;38;5;196m' # Red
ACCENT_COLOR='\033[1;38;5;226m'    # Yellow
TEXT_COLOR='\033[1;38;5;231m'      # White
PROMPT_COLOR='\033[1;38;5;46m'     # Green
reset='\033[0m'                    # Reset color

# Custom prompt style with game symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${SECONDARY_COLOR}\]🎮\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─👾 \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}PLAYER ONE: ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}WELCOME TO ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}INSERT COIN TO CONTINUE...${reset}"
  echo "🎮 🕹️ 👾 🎮 🕹️ 👾 🎮 🕹️ 👾 🎮 🕹️ 👾 🎮 🕹️ 👾" | lolcat -a -F 0.5
}

# Display welcome message
welcome_message

# Arcade-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "arcade")
      echo -e "${PRIMARY_COLOR}
       █████╗ ██████╗  ██████╗ █████╗ ██████╗ ███████╗
      ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝
      ███████║██████╔╝██║     ███████║██║  ██║█████╗  
      ██╔══██║██╔══██╗██║     ██╔══██║██║  ██║██╔══╝  
      ██║  ██║██║  ██║╚██████╗██║  ██║██████╔╝███████╗
      ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚══════╝
      ${reset}" | lolcat -a -d 1
      
      echo "
      ┌─────────────────────────────────┐
      │  ┌───┬───┬───┬───┬───┬───┬───┐  │
      │  │   │   │   │   │   │   │   │  │
      │  ├───┼───┼───┼───┼───┼───┼───┤  │
      │  │   │   │   │   │   │   │   │  │
      │  ├───┼───┼───┼───┼───┼───┼───┤  │
      │  │   │   │   │   │   │   │   │  │
      │  ├───┼───┼───┼───┼───┼───┼───┤  │
      │  │   │   │   │   │   │   │   │  │
      │  ├───┼───┼───┼───┼───┼───┼───┤  │
      │  │   │   │   │   │   │   │   │  │
      │  └───┴───┴───┴───┴───┴───┴───┘  │
      │                                 │
      │         HIGH SCORE: 9999        │
      │          LEVEL: 42              │
      │         LIVES: ♥ ♥ ♥            │
      │                                 │
      └─────────────────────────────────┘
      " | lolcat -a -d 2
      ;;
    *)
      # Fallback banner
      echo "
       _____     _               ___                   _      
      |  __ \   | |             / _ \                 | |     
      | |__) |__| |_ _ __ ___  / /_\ \_ __ ___ __ _  _| | ___ 
      |  _  / _ \ __| '__/ _ \ |  _  | '__/ __/ _\` |/ / |/ _ \\
      | | \ \  __/ |_| | | (_) || | | | | | (_| (_| | | |  __/
      |_|  \_\___|\__|_|  \___/ \_| |_/_|  \___\__,_|\_\_|\___|
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Arcade and gaming quotes
custom_quotes=(
  "Game Over? Just insert another coin!"
  "Winners don't use cheats, except when they do."
  "Life is a game, level up accordingly."
  "All your base are belong to us."
  "Stay a while and listen..."
  "It's dangerous to code alone! Take this terminal."
  "The cake is a lie, but the code is real."
  "Up, Up, Down, Down, Left, Right, Left, Right, B, A, Start!"
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Arcade-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}┌─────────── GAME STATISTICS ───────────┐${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}│ GAME TIME....: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    
    # Get memory usage with pixel bar
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual pixel bar for memory
    MEM_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 5 )) ]; then
        MEM_BAR+="█"
      else
        MEM_BAR+="░"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ MEMORY.......: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info with pixel bar
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual pixel bar for storage
    STORAGE_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 5 )) ]; then
        STORAGE_BAR+="█"
      else
        STORAGE_BAR+="░"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ DISK SPACE...: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info with pixel bar
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual pixel bar for battery
      BATT_BAR=""
      for ((i=0; i<20; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 5 )) ]; then
          BATT_BAR+="█"
        else
          BATT_BAR+="░"
        fi
      done
      
      # Create visual lives based on battery percentage
      LIVES=""
      for ((i=0; i<5; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 20 )) ]; then
          LIVES+="♥ "
        else
          LIVES+="♡ "
        fi
      done
      
      echo -e "${SECONDARY_COLOR}│ POWER LEVEL..: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}%${reset}"
      echo -e "${SECONDARY_COLOR}│ LIVES........: ${TEXT_COLOR}${LIVES}${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}│ PLAY TIME....: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU load
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | xargs)
    echo -e "${SECONDARY_COLOR}│ CPU LOAD.....: ${TEXT_COLOR}${LOAD}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}│ SYSTEM HEAT..: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get processes as "enemies"
    PROCESSES=$(ps -e | wc -l)
    echo -e "${SECONDARY_COLOR}│ ENEMIES......: ${TEXT_COLOR}${PROCESSES}${reset}"
    
    # Get username as "player"
    USER=$(whoami)
    echo -e "${SECONDARY_COLOR}│ PLAYER.......: ${TEXT_COLOR}${USER}${reset}"
    
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
