#!/bin/bash

# HackShell v1.1 - Tokyo Night Theme
# A cyberpunk-inspired theme with Tokyo night cityscape colors

# Theme information
THEME_NAME="Tokyo Night"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="Cyberpunk-inspired theme with Tokyo night cityscape colors"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="tokyo"
WELCOME_SOUND=true

# Colors - Tokyo night-inspired palette
PRIMARY_COLOR='\033[1;38;5;61m'    # Blue-purple
SECONDARY_COLOR='\033[1;38;5;97m'  # Purple
ACCENT_COLOR='\033[1;38;5;207m'    # Pink
TEXT_COLOR='\033[1;38;5;189m'      # Light lavender
PROMPT_COLOR='\033[1;38;5;219m'    # Light pink
reset='\033[0m'                    # Reset color

# Custom prompt style with neon symbols
PS1='\[${PRIMARY_COLOR}\]┌[\[${ACCENT_COLOR}\]東京\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─ \[${PROMPT_COLOR}\]❯❯❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}ようこそ, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}The neon lights guide your path...${reset}"
  echo "⟢⟣⟢⟣⟢⟣⟢⟣⟢⟣⟢⟣⟢⟣⟢⟣⟢⟣⟢⟣⟢⟣⟢⟣" | lolcat -a
}

# Display welcome message
welcome_message

# Tokyo-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "tokyo")
      echo "
      ▄▄▄█████▓ ▒█████   ██ ▄█▀▓██   ██▓ ▒█████      ███▄    █  ██▓  ▄████  ██░ ██ ▄▄▄█████▓
      ▓  ██▒ ▓▒▒██▒  ██▒ ██▄█▒  ▒██  ██▒▒██▒  ██▒    ██ ▀█   █ ▓██▒ ██▒ ▀█▒▓██░ ██▒▓  ██▒ ▓▒
      ▒ ▓██░ ▒░▒██░  ██▒▓███▄░   ▒██ ██░▒██░  ██▒   ▓██  ▀█ ██▒▒██▒▒██░▄▄▄░▒██▀▀██░▒ ▓██░ ▒░
      ░ ▓██▓ ░ ▒██   ██░▓██ █▄   ░ ▐██▓░▒██   ██░   ▓██▒  ▐▌██▒░██░░▓█  ██▓░▓█ ░██ ░ ▓██▓ ░ 
        ▒██▒ ░ ░ ████▓▒░▒██▒ █▄  ░ ██▒▓░░ ████▓▒░   ▒██░   ▓██░░██░░▒▓███▀▒░▓█▒░██▓  ▒██▒ ░ 
        ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▒ ▓▒   ██▒▒▒ ░ ▒░▒░▒░    ░ ▒░   ▒ ▒ ░▓   ░▒   ▒  ▒ ░░▒░▒  ▒ ░░   
          ░      ░ ▒ ▒░ ░ ░▒ ▒░ ▓██ ░▒░   ░ ▒ ▒░    ░ ░░   ░ ▒░ ▒ ░  ░   ░  ▒ ░▒░ ░    ░    
        ░      ░ ░ ░ ▒  ░ ░░ ░  ▒ ▒ ░░  ░ ░ ░ ▒        ░   ░ ░  ▒ ░░ ░   ░  ░  ░░ ░  ░      
                  ░ ░  ░  ░    ░ ░         ░ ░              ░  ░        ░  ░  ░  ░           
      " | lolcat -a -d 1
      ;;
    *)
      # Fallback banner
      echo "
             :::     ::::::::: ::::::::::: ::::::::::: ::::::::::: :::::::::: :::    :::
            :+:     :+:    :+:    :+:         :+:         :+:     :+:        :+:    :+:
           +:+     +:+    +:+    +:+         +:+         +:+     +:+        +:+    +:+
          +#+     +#++:++#+     +#+         +#+         +#+     +#++:++#   +#++:++#++
         +#+     +#+    +#+    +#+         +#+         +#+     +#+        +#+    +#+
        #+#     #+#    #+#    #+#         #+#         #+#     #+#        #+#    #+#
       ########## #########     ###     ###########     ###     ########## ###    ###
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Tokyo and cyberpunk quotes
custom_quotes=(
  "The city never sleeps, only powers down temporarily."
  "Neon dreams in a digital stream."
  "Lost in translation, found in code."
  "Memory is merely a record. You just have to rewrite that record."
  "The future is already here — it's just not very evenly distributed."
  "The sky above the port was the color of television, tuned to a dead channel."
  "All those moments will be lost in time, like tears in rain."
  "It's not about the destination, it's about the synthtribe."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Tokyo-themed system information with neon styling
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}┏━━━━━━━━━━━ SYSTEM STATUS ━━━━━━━━━━━┓${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}┃ DateTime...: ${TEXT_COLOR}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual neon bar for memory
    MEM_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 10 )) ]; then
        MEM_BAR+="■"
      else
        MEM_BAR+="□"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}┃ RAM Usage..: ${TEXT_COLOR}${MEM_BAR} ${MEM_USED}MB/${MEM_TOTAL}MB${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
    
    # Get storage percent as number
    STORAGE_NUM=$(echo $STORAGE_PERCENT | tr -d '%')
    
    # Create a visual neon bar for storage
    STORAGE_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( STORAGE_NUM / 10 )) ]; then
        STORAGE_BAR+="■"
      else
        STORAGE_BAR+="□"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}┃ Disk.......: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_USED}/${STORAGE_TOTAL}${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Choose battery icon based on status
      if [ "$BATT_STATUS" == "Charging" ]; then
        BATT_ICON="⚡"
      else
        BATT_ICON="🔋"
      fi
      
      # Create a visual neon bar for battery
      BATT_BAR=""
      for ((i=0; i<10; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 10 )) ]; then
          BATT_BAR+="■"
        else
          BATT_BAR+="□"
        fi
      done
      
      echo -e "${SECONDARY_COLOR}┃ Battery....: ${TEXT_COLOR}${BATT_BAR} ${BATT_ICON} ${BATT_CAPACITY}%${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}┃ Uptime.....: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get processes
    PROCESSES=$(ps -e | wc -l)
    echo -e "${SECONDARY_COLOR}┃ Processes..: ${TEXT_COLOR}${PROCESSES}${reset}"
    
    # Get IP if available
    if command -v ip &> /dev/null; then
      IP_ADDR=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v "127.0.0.1" | head -n 1)
      if [ -n "$IP_ADDR" ]; then
        echo -e "${SECONDARY_COLOR}┃ Network....: ${TEXT_COLOR}${IP_ADDR}${reset}"
      fi
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
