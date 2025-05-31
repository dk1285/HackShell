#!/bin/bash

# HackShell v1.1 - Electric Circuit Theme
# A theme inspired by circuit boards and electrical components

# Theme information
THEME_NAME="Electric Circuit"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A theme inspired by circuit boards and electrical components"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="circuit"
WELCOME_SOUND=true

# Colors - Circuit palette
PRIMARY_COLOR='\033[1;38;5;28m'    # PCB green
SECONDARY_COLOR='\033[1;38;5;220m' # Gold/copper
ACCENT_COLOR='\033[1;38;5;33m'     # Electric blue
TEXT_COLOR='\033[1;38;5;254m'      # White/silver
PROMPT_COLOR='\033[1;38;5;40m'     # Bright green
reset='\033[0m'                    # Reset color

# Custom prompt style with circuit symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${SECONDARY_COLOR}\]⚡\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─∿ \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Circuit initialized, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Conducting electricity through silicon and code...${reset}"
  echo "⚡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━⚡" | lolcat -a -F 0.4
}

# Display welcome message
welcome_message

# Circuit-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "circuit")
      echo "
      ┌─────────────────────────────────────────────────┐
      │  ┌───┐       ┌───┐        ┌───┐       ┌───┐    │
      │  │   │       │   │        │   │       │   │    │
      │  └─┬─┘       └─┬─┘        └─┬─┘       └─┬─┘    │
      │    │           │            │           │      │
      │  ┌─┴─┐       ┌─┴─┐        ┌─┴─┐       ┌─┴─┐    │
      │  │   │       │   │        │   │       │   │    │
      │  └─┬─┘       └─┬─┘        └─┬─┘       └─┬─┘    │
      │    │           │            │           │      │
      │    │           │            │           │      │
      │  ┌─┴─┐       ┌─┴─┐        ┌─┴─┐       ┌─┴─┐    │
      │  │   │       │   │        │   │       │   │    │
      │  └───┘       └───┘        └───┘       └───┘    │
      └─────────────────────────────────────────────────┘
      " | lolcat -a -d 1 -F 0.3
      
      echo -e "${ACCENT_COLOR}
       ███████╗██╗     ███████╗ ██████╗████████╗██████╗ ██╗ ██████╗
       ██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝██╔══██╗██║██╔════╝
       █████╗  ██║     █████╗  ██║        ██║   ██████╔╝██║██║     
       ██╔══╝  ██║     ██╔══╝  ██║        ██║   ██╔══██╗██║██║     
       ███████╗███████╗███████╗╚██████╗   ██║   ██║  ██║██║╚██████╗
       ╚══════╝╚══════╝╚══════╝ ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚═╝ ╚═════╝
                                                                    
        ██████╗██╗██████╗  ██████╗██╗   ██╗██╗████████╗            
       ██╔════╝██║██╔══██╗██╔════╝██║   ██║██║╚══██╔══╝            
       ██║     ██║██████╔╝██║     ██║   ██║██║   ██║               
       ██║     ██║██╔══██╗██║     ██║   ██║██║   ██║               
       ╚██████╗██║██║  ██║╚██████╗╚██████╔╝██║   ██║               
        ╚═════╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝   ╚═╝               
      ${reset}"
      ;;
    *)
      # Fallback banner
      echo "
       _____ _           _        _       
      | ____| | ___  ___| |_ _ __(_) ___  
      |  _| | |/ _ \/ __| __| '__| |/ __| 
      | |___| |  __/ (__| |_| |  | | (__  
      |_____|_|\___|\___|\__|_|  |_|\___| 
                                          
       _____ _                _ _         
      / ____(_)              (_) |        
      | |     _ _ __ ___ _   _ _| |_      
      | |    | | '__/ __| | | | | __|     
      | |____| | | | (__| |_| | | |_      
      \_____|_|_|  \___|\__,_|_|\__|     
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Electrical and circuit quotes
custom_quotes=(
  "Resistance is futile, but impedance is complex."
  "There are 10 types of people in the world: those who understand binary, and those who don't."
  "Programming is not about typing, it's about thinking."
  "If debugging is the process of removing bugs, then programming must be the process of putting them in."
  "Electricity flows from point to point; code flows from mind to mind."
  "In a world full of resistors, be a superconductor."
  "A good circuit has no shorts; good code has no bugs."
  "When in doubt, follow Ohm's Law and keep your code's resistance low."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Circuit-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╔═════════ CIRCUIT DIAGNOSTICS ═════════╗${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}║ Clock.......: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    
    # Get memory usage with circuit meter
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual circuit meter for memory
    MEM_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 5 )) ]; then
        if [ $((i % 4)) -eq 0 ]; then
          MEM_BAR+="⚡"
        else
          MEM_BAR+="━"
        fi
      else
        MEM_BAR+="┄"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}║ RAM Voltage..: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info with circuit meter
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual circuit meter for storage
    STORAGE_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 5 )) ]; then
        if [ $((i % 4)) -eq 0 ]; then
          STORAGE_BAR+="⚡"
        else
          STORAGE_BAR+="━"
        fi
      else
        STORAGE_BAR+="┄"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}║ Storage Cap..: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info with circuit meter
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual circuit meter for battery
      BATT_BAR=""
      for ((i=0; i<20; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 5 )) ]; then
          if [ $((i % 4)) -eq 0 ]; then
            BATT_BAR+="⚡"
          else
            BATT_BAR+="━"
          fi
        else
          BATT_BAR+="┄"
        fi
      done
      
      echo -e "${SECONDARY_COLOR}║ Power Source.: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}%${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}║ Uptime......: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}║ Core Temp....: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get CPU load
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | xargs)
    echo -e "${SECONDARY_COLOR}║ Load Current.: ${TEXT_COLOR}${LOAD}${reset}"
    
    # Get IP if available
    if command -v ip &> /dev/null; then
      IP_ADDR=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v "127.0.0.1" | head -n 1)
      if [ -n "$IP_ADDR" ]; then
        echo -e "${SECONDARY_COLOR}║ Network Node.: ${TEXT_COLOR}${IP_ADDR}${reset}"
      fi
    fi
    
    # Get processes as "signals"
    PROCESSES=$(ps -e | wc -l)
    echo -e "${SECONDARY_COLOR}║ Signal Count.: ${TEXT_COLOR}${PROCESSES}${reset}"
    
    # Get user info
    USER=$(whoami)
    echo -e "${SECONDARY_COLOR}║ Circuit Admin: ${TEXT_COLOR}${USER}${reset}"
    
    echo -e "${PRIMARY_COLOR}╚════════════════════════════════════════╝${reset}"
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
