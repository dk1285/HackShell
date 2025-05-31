#!/bin/bash

# HackShell v1.1 - Industrial Tech Theme
# A rugged industrial-inspired theme with mechanical aesthetics

# Theme information
THEME_NAME="Industrial Tech"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A rugged industrial-inspired theme with mechanical aesthetics"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="industrial"
WELCOME_SOUND=true

# Colors - Industrial palette
PRIMARY_COLOR='\033[1;38;5;94m'    # Rust brown
SECONDARY_COLOR='\033[1;38;5;137m' # Brass
ACCENT_COLOR='\033[1;38;5;214m'    # Amber/warning
TEXT_COLOR='\033[1;38;5;250m'      # Steel gray
PROMPT_COLOR='\033[1;38;5;208m'    # Orange
reset='\033[0m'                    # Reset color

# Custom prompt style with industrial symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]⚙\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─⚡ \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome to the machine floor, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Building the future with steel and code...${reset}"
  echo "=================================================" | lolcat -a -F 0.5
}

# Display welcome message
welcome_message

# Industrial-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "industrial")
      echo -e "${SECONDARY_COLOR}
       ██▓ ███▄    █ ▓█████▄  █    ██   ██████ ▄▄▄█████▓ ██▀███   ██▓ ▄▄▄       ██▓    
      ▓██▒ ██ ▀█   █ ▒██▀ ██▌ ██  ▓██▒▒██    ▒ ▓  ██▒ ▓▒▓██ ▒ ██▒▓██▒▒████▄    ▓██▒    
      ▒██▒▓██  ▀█ ██▒░██   █▌▓██  ▒██░░ ▓██▄   ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██▒▒██  ▀█▄  ▒██░    
      ░██░▓██▒  ▐▌██▒░▓█▄   ▌▓▓█  ░██░  ▒   ██▒░ ▓██▓ ░ ▒██▀▀█▄  ░██░░██▄▄▄▄██ ▒██░    
      ░██░▒██░   ▓██░░▒████▓ ▒▒█████▓ ▒██████▒▒  ▒██▒ ░ ░██▓ ▒██▒░██░ ▓█   ▓██▒░██████▒
      ░▓  ░ ▒░   ▒ ▒  ▒▒▓  ▒ ░▒▓▒ ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░   ░ ▒▓ ░▒▓░░▓   ▒▒   ▓▒█░░ ▒░▓  ░
       ▒ ░░ ░░   ░ ▒░ ░ ▒  ▒ ░░▒░ ░ ░ ░ ░▒  ░ ░    ░      ░▒ ░ ▒░ ▒ ░  ▒   ▒▒ ░░ ░ ▒  ░
       ▒ ░   ░   ░ ░  ░ ░  ░  ░░░ ░ ░ ░  ░  ░    ░        ░░   ░  ▒ ░  ░   ▒     ░ ░   
       ░           ░    ░       ░           ░              ░      ░        ░  ░    ░  ░
                      ░                                                                
      ${reset}"
      
      echo "
      ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙
        ╔╦╗╔═╗╔═╗╦ ╦   ╔═╗╔═╗╔═╗╔╦╗╔═╗╦═╗╦ ╦         
         ║ ║╣ ║  ╠═╣   ╚═╗║╣ ║   ║ ║ ║╠╦╝╚╦╝         
         ╩ ╚═╝╚═╝╩ ╩   ╚═╝╚═╝╚═╝ ╩ ╚═╝╩╚═ ╩          
      ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙ ⚙
      " | lolcat -a -F 0.4
      ;;
    *)
      # Fallback banner
      echo "
       __   __  __   __  ______   __   __  _______  _______  ______    ___   _______  ___     
      |  | |  ||  \ |  ||      \ |  | |  ||       ||       ||    _ |  |   | |   _   ||   |    
      |  |_|  ||   \|  ||  _    ||  | |  ||  _____||_     _||   | ||  |   | |  |_|  ||   |    
      |       ||       ||  |_|  ||  |_|  || |_____   |   |  |   |_||_ |   | |       ||   |    
      |       ||  _    ||       ||       ||_____  |  |   |  |    __  ||   | |       ||   |___ 
      |   _   || | |   ||  _   | |       | _____| |  |   |  |   |  | ||   | |   _   ||       |
      |__| |__||_|  |__|| |_|   ||_______||_______|  |___|  |___|  |_||___| |__| |__||_______|
      " | lolcat -a -F 0.3
      ;;
  esac
}

# Display banner
display_banner

# Industrial and mechanical quotes
custom_quotes=(
  "Build it stronger. Code it better. Make it work."
  "Where steel meets silicon, innovation thrives."
  "The machine doesn't care about excuses. Only results."
  "The sound of productivity is the grinding of gears and the clicking of keys."
  "First solve the problem, then write the code."
  "Heavy machinery requires precision engineering. So does good code."
  "Industry and persistence are the engines of success."
  "Infrastructure as code. Hardware as software. The future is now."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Industrial-themed system information with mechanical styling
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╔════════ SYSTEM DIAGNOSTICS ════════╗${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}║ Timestamp...: ${TEXT_COLOR}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
    
    # Get memory usage with industrial gauge
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    MEM_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 5 )) ]; then
        if [ $i -lt 14 ]; then
          MEM_BAR+="■"
        elif [ $i -lt 18 ]; then
          MEM_BAR+="\033[1;38;5;208m■\033[1;38;5;137m"
        else
          MEM_BAR+="\033[1;38;5;196m■\033[1;38;5;137m"
        fi
      else
        MEM_BAR+="□"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}║ Memory Gauge: ${MEM_BAR} ${TEXT_COLOR}${MEM_PERCENT}%${reset}"
    
    # Get storage info with industrial gauge
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    STORAGE_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 5 )) ]; then
        if [ $i -lt 14 ]; then
          STORAGE_BAR+="■"
        elif [ $i -lt 18 ]; then
          STORAGE_BAR+="\033[1;38;5;208m■\033[1;38;5;137m"
        else
          STORAGE_BAR+="\033[1;38;5;196m■\033[1;38;5;137m"
        fi
      else
        STORAGE_BAR+="□"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}║ Storage Gauge: ${STORAGE_BAR} ${TEXT_COLOR}${STORAGE_PERCENT}%${reset}"
    
    # Get battery info with industrial gauge
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      BATT_BAR=""
      for ((i=0; i<20; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 5 )) ]; then
          if [ $i -lt 4 ]; then
            BATT_BAR+="\033[1;38;5;196m■\033[1;38;5;137m"
          elif [ $i -lt 10 ]; then
            BATT_BAR+="\033[1;38;5;208m■\033[1;38;5;137m"
          else
            BATT_BAR+="■"
          fi
        else
          BATT_BAR+="□"
        fi
      done
      
      # Choose battery icon based on status
      if [ "$BATT_STATUS" == "Charging" ]; then
        BATT_ICON="⚡"
      else
        BATT_ICON="⚙"
      fi
      
      echo -e "${SECONDARY_COLOR}║ Power Supply.: ${BATT_BAR} ${TEXT_COLOR}${BATT_CAPACITY}% ${BATT_ICON}${reset}"
    fi
    
    # Get CPU load
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | xargs)
    echo -e "${SECONDARY_COLOR}║ Engine Load..: ${TEXT_COLOR}${LOAD}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}║ Core Temp....: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}║ Runtime......: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get processes
    PROCESSES=$(ps -e | wc -l)
    echo -e "${SECONDARY_COLOR}║ Active Tasks..: ${TEXT_COLOR}${PROCESSES}${reset}"
    
    # Get IP address if available
    if command -v ip &> /dev/null; then
      IP_ADDR=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v "127.0.0.1" | head -n 1)
      if [ -n "$IP_ADDR" ]; then
        echo -e "${SECONDARY_COLOR}║ Machine ID....: ${TEXT_COLOR}${IP_ADDR}${reset}"
      fi
    fi
    
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
