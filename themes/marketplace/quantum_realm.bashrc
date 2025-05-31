#!/bin/bash

# HackShell v1.1 - Quantum Realm Theme
# A subatomic-inspired theme with particle effects and quantum aesthetics

# Theme information
THEME_NAME="Quantum Realm"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A subatomic-inspired theme with particle effects and quantum aesthetics"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="quantum"
WELCOME_SOUND=true

# Colors - Quantum palette
PRIMARY_COLOR='\033[1;38;5;56m'    # Deep purple
SECONDARY_COLOR='\033[1;38;5;165m' # Magenta
ACCENT_COLOR='\033[1;38;5;51m'     # Bright cyan
TEXT_COLOR='\033[1;38;5;159m'      # Light cyan
PROMPT_COLOR='\033[1;38;5;135m'    # Medium purple
reset='\033[0m'                    # Reset color

# Custom prompt style with quantum symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${SECONDARY_COLOR}\]⚛\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─⚛ \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome to the ${SECONDARY_COLOR}Q${ACCENT_COLOR}u${SECONDARY_COLOR}a${ACCENT_COLOR}n${SECONDARY_COLOR}t${ACCENT_COLOR}u${SECONDARY_COLOR}m ${ACCENT_COLOR}R${SECONDARY_COLOR}e${ACCENT_COLOR}a${SECONDARY_COLOR}l${ACCENT_COLOR}m${TEXT_COLOR}, $CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to the ${SECONDARY_COLOR}Q${ACCENT_COLOR}u${SECONDARY_COLOR}a${ACCENT_COLOR}n${SECONDARY_COLOR}t${ACCENT_COLOR}u${SECONDARY_COLOR}m ${ACCENT_COLOR}R${SECONDARY_COLOR}e${ACCENT_COLOR}a${SECONDARY_COLOR}l${ACCENT_COLOR}m${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Where uncertainty is the only certainty...${reset}"
  echo "⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️ ⚛️" | lolcat -a -F 0.3
}

# Display welcome message
welcome_message

# Quantum-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "quantum")
      echo "
       .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-. 
      ( Q )( U )( A )( N )( T )( U )( M )( - )( R )( E )( A )( L )( M )( ! )( ! ) 
       \`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\`-\` 
      " | lolcat -a -d 1
      
      echo "
                                       .::.                             
                                     .:'  .:                            
         ,MMM8&&&.                 .'    .:'                            
        MMMMM88&&&&               .:.  .::'                             
       MMMMM88&&&&&&            .::'  .::'                              
       MMMMM88&&&&&&          .::'   .::'                               
       'MMMMM88&&&&         .::'    .::'                                
          'MMM8&&&        .::'     .::'                                 
            .::.   .:'   .::'      .:                                   
          .::'  .':.  .::'       .:'                              ..::  
        .::'   .::'  .:         ::..                          ..::::    
       .::'    .:   .:           ::.....                 ..::::         
      .::'     :   :.                :::::::::......::::::.             
      ::       :   :                                                     
      :                                                                  
      " | lolcat -a -d 2
      
      echo -e "${ACCENT_COLOR}
      ┌─┐ ┬ ┬┌─┐┌┐┌┌┬┐┬ ┬┌┬┐  ┬─┐┌─┐┌─┐┬  ┌┬┐
      │─┼┐│ │├─┤│││ │ │ ││││  ├┬┘├┤ ├─┤│  │││
      └─┘└└─┘┴ ┴┘└┘ ┴ └─┘┴ ┴  ┴└─└─┘┴ ┴┴─┘┴ ┴
      ${reset}" | lolcat -a -d 1
      ;;
    *)
      # Fallback banner
      echo "
      ▒█████   █    ██  ▄▄▄       ███▄    █ ▄▄▄█████▓ █    ██  ███▄ ▄███▓
      ▒██▒  ██▒ ██  ▓██▒▒████▄     ██ ▀█   █ ▓  ██▒ ▓▒ ██  ▓██▒▓██▒▀█▀ ██▒
      ▒██░  ██▒▓██  ▒██░▒██  ▀█▄  ▓██  ▀█ ██▒▒ ▓██░ ▒░▓██  ▒██░▓██    ▓██░
      ▒██   ██░▓▓█  ░██░░██▄▄▄▄██ ▓██▒  ▐▌██▒░ ▓██▓ ░ ▓▓█  ░██░▒██    ▒██ 
      ░ ████▓▒░▒▒█████▓  ▓█   ▓██▒▒██░   ▓██░  ▒██▒ ░ ▒▒█████▓ ▒██▒   ░██▒
      ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒  ▒▒   ▓▒█░░ ▒░   ▒ ▒   ▒ ░░   ░▒▓▒ ▒ ▒ ░ ▒░   ░  ░
        ░ ▒ ▒░ ░░▒░ ░ ░   ▒   ▒▒ ░░ ░░   ░ ▒░    ░    ░░▒░ ░ ░ ░  ░      ░
      ░ ░ ░ ▒   ░░░ ░ ░   ░   ▒      ░   ░ ░   ░       ░░░ ░ ░ ░      ░   
          ░ ░     ░           ░  ░         ░             ░            ░   
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Quantum physics quotes
custom_quotes=(
  "The universe is not only stranger than we imagine, it is stranger than we can imagine."
  "If quantum mechanics hasn't profoundly shocked you, you haven't understood it yet."
  "Everything we call real is made of things that cannot be regarded as real."
  "In the beginning there was nothing, which exploded."
  "The first principle is that you must not fool yourself — and you are the easiest person to fool."
  "Quantum physics tells us that nothing that is observed is unaffected by the observer."
  "The atoms or elementary particles themselves are not real; they form a world of potentialities or possibilities."
  "God does not play dice with the universe; He plays an ineffable game of His own devising."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Quantum-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╭───────── QUANTUM MEASUREMENTS ─────────╮${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}│ Time Dilation: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    echo -e "${SECONDARY_COLOR}│ Time Slice...: ${TEXT_COLOR}$(date +"%Y-%m-%d")${reset}"
    
    # Get memory usage with quantum state meter
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual particle bar for memory
    MEM_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 5 )) ]; then
        # Randomize particle appearance
        RAND=$((RANDOM % 4))
        if [ $RAND -eq 0 ]; then
          MEM_BAR+="⚛"
        elif [ $RAND -eq 1 ]; then
          MEM_BAR+="⚪"
        elif [ $RAND -eq 2 ]; then
          MEM_BAR+="⚫"
        else
          MEM_BAR+="∞"
        fi
      else
        MEM_BAR+="·"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ Wave Function: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info with quantum state meter
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual particle bar for storage
    STORAGE_BAR=""
    for ((i=0; i<20; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 5 )) ]; then
        # Randomize particle appearance
        RAND=$((RANDOM % 4))
        if [ $RAND -eq 0 ]; then
          STORAGE_BAR+="⚛"
        elif [ $RAND -eq 1 ]; then
          STORAGE_BAR+="⚪"
        elif [ $RAND -eq 2 ]; then
          STORAGE_BAR+="⚫"
        else
          STORAGE_BAR+="∞"
        fi
      else
        STORAGE_BAR+="·"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ Entanglement.: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info with quantum state meter
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual particle bar for battery
      BATT_BAR=""
      for ((i=0; i<20; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 5 )) ]; then
          # Randomize particle appearance
          RAND=$((RANDOM % 4))
          if [ $RAND -eq 0 ]; then
            BATT_BAR+="⚛"
          elif [ $RAND -eq 1 ]; then
            BATT_BAR+="⚪"
          elif [ $RAND -eq 2 ]; then
            BATT_BAR+="⚫"
          else
            BATT_BAR+="∞"
          fi
        else
          BATT_BAR+="·"
        fi
      done
      
      # Choose battery icon based on status
      if [ "$BATT_STATUS" == "Charging" ]; then
        BATT_ICON="⚡"
      else
        BATT_ICON="⚛"
      fi
      
      echo -e "${SECONDARY_COLOR}│ Energy State.: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}% ${BATT_ICON}${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}│ Planck Time...: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}│ Particle Heat.: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get CPU load
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | xargs)
    echo -e "${SECONDARY_COLOR}│ Uncertainty...: ${TEXT_COLOR}${LOAD}${reset}"
    
    # Get user info
    USER=$(whoami)
    echo -e "${SECONDARY_COLOR}│ Observer......: ${TEXT_COLOR}${USER}${reset}"
    
    echo -e "${PRIMARY_COLOR}╰────────────────────────────────────────╯${reset}"
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
