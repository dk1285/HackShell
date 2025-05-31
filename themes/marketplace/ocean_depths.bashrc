#!/bin/bash

# HackShell v1.1 - Ocean Depths Theme
# A deep blue ocean-inspired theme with aquatic elements

# Theme information
THEME_NAME="Ocean Depths"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="Deep blue theme inspired by the ocean depths"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="ocean"
WELCOME_SOUND=true

# Colors - Ocean blues and teals
PRIMARY_COLOR='\033[1;38;5;39m'    # Deep blue
SECONDARY_COLOR='\033[1;38;5;31m'  # Medium blue
ACCENT_COLOR='\033[1;38;5;45m'     # Light blue
TEXT_COLOR='\033[1;38;5;195m'      # White-blue
PROMPT_COLOR='\033[1;38;5;50m'     # Teal
reset='\033[0m'                    # Reset color

# Custom prompt style with wave symbols
PS1='\[${SECONDARY_COLOR}\]╭─[\[${ACCENT_COLOR}\]\T\[${SECONDARY_COLOR}\]]─[\[${PRIMARY_COLOR}\]~≈~\[${SECONDARY_COLOR}\]]─[\[${ACCENT_COLOR}\]\w\[${SECONDARY_COLOR}\]]\n'
PS1+='╰─≈ \[${PROMPT_COLOR}\]❱ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome aboard, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to the ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Dive deep into the digital ocean...${reset}"
  echo "~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~≈~" | lolcat -f
}

# Display welcome message
welcome_message

# Ocean-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "ocean")
      echo "
         .-\"\"\"\"--.
        /          \\
       /            \\
    .-'              '-.
   /                    \\
  ,'                      '.
 /                          \\        .----.
'                            '      /      \\
'                            '     (        )
|    ___________________     |      \\      /
|   |                   |    |       '----'
|   |                   |    |
|   |                   |    |
|   |                   |    |
|   |___________________|    |
|                            |
 \\                          /
  '.                      .'  
    '-.                .-'    
       '-.          .-'        
          '-.____.-'          
      " | lolcat -p -a -d 1
      echo -e "${SECONDARY_COLOR}  O C E A N   D E P T H S   H A C K S H E L L${reset}"
      ;;
    *)
      # Fallback banner
      echo "
      ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
        ___   __  ____    __    _  _    ____  ____  ___  _____  _  _  ____ 
       / __) /  \(  __)  (  )  ( \/ )  (    \(  __)/  _)(  _  )/ )( \/ ___)
      ( (_ \(  O )) _)   / (_/\ )  /    ) D ( ) _) \_  \ )(_)( ) __ (\___ \\
       \___/ \__/(____) (__/(__(__/    (____/(____)(___/(_____)\_)(_/(____/
      ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
      " | lolcat -p
      ;;
  esac
}

# Display banner
display_banner

# Ocean and nautical quotes
custom_quotes=(
  "The sea, once it casts its spell, holds one in its net of wonder forever."
  "Twenty thousand leagues under the code."
  "Life is like the ocean, it goes up and down."
  "The ocean is calling and I must go."
  "In the depth of data, we find the treasures of knowledge."
  "Calm seas never made a skilled sailor."
  "The cure for anything is salt water: sweat, tears, or the sea."
  "We are like islands in the sea, separate on the surface but connected in the deep."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Ocean-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╭───────────── NAVIGATION SYSTEMS ─────────────╮${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}│ Time............: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    echo -e "${SECONDARY_COLOR}│ Date............: ${TEXT_COLOR}$(date +"%Y-%m-%d")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    MEM_BAR=$(printf '█%.0s' $(seq 1 $(( MEM_PERCENT / 10 ))))
    MEM_SPACE=$(printf '░%.0s' $(seq 1 $(( 10 - MEM_PERCENT / 10 ))))
    
    echo -e "${SECONDARY_COLOR}│ Memory Depth....: ${TEXT_COLOR}${MEM_BAR}${MEM_SPACE} ${MEM_PERCENT}%${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    STORAGE_BAR=$(printf '█%.0s' $(seq 1 $(( STORAGE_PERCENT / 10 ))))
    STORAGE_SPACE=$(printf '░%.0s' $(seq 1 $(( 10 - STORAGE_PERCENT / 10 ))))
    
    echo -e "${SECONDARY_COLOR}│ Cargo Hold.....: ${TEXT_COLOR}${STORAGE_BAR}${STORAGE_SPACE} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      BATT_BAR=$(printf '█%.0s' $(seq 1 $(( BATT_CAPACITY / 10 ))))
      BATT_SPACE=$(printf '░%.0s' $(seq 1 $(( 10 - BATT_CAPACITY / 10 ))))
      
      echo -e "${SECONDARY_COLOR}│ Power Reserves..: ${TEXT_COLOR}${BATT_BAR}${BATT_SPACE} ${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}│ Voyage Duration.: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get IP address if available
    if command -v hostname &> /dev/null; then
      IP_ADDR=$(hostname -I 2>/dev/null | awk '{print $1}')
      if [ -n "$IP_ADDR" ]; then
        echo -e "${SECONDARY_COLOR}│ Coordinates.....: ${TEXT_COLOR}${IP_ADDR}${reset}"
      fi
    fi
    
    echo -e "${PRIMARY_COLOR}╰────────────────────────────────────────────╯${reset}"
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
