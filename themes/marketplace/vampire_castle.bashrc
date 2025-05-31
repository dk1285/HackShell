#!/bin/bash

# HackShell v1.1 - Vampire Castle Theme
# A gothic-inspired dark theme with blood red accents

# Theme information
THEME_NAME="Vampire Castle"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A gothic-inspired dark theme with blood red accents and vampire aesthetic"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="castle"
WELCOME_SOUND=true

# Colors - Vampire-inspired palette
PRIMARY_COLOR='\033[1;38;5;52m'    # Dark blood red
SECONDARY_COLOR='\033[1;38;5;88m'  # Medium red
ACCENT_COLOR='\033[1;38;5;196m'    # Bright red
TEXT_COLOR='\033[1;38;5;188m'      # Light gray
PROMPT_COLOR='\033[1;38;5;160m'    # Crimson
reset='\033[0m'                    # Reset color

# Custom prompt style with gothic symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]✝\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─[\[${ACCENT_COLOR}\]†\[${PRIMARY_COLOR}\]]→ \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome to the castle, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to the ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}The night is dark and full of terrors...${reset}"
  echo "†•†•†•†•†•†•†•†•†•†•†•†•†•†•†•†•†•†•†•†" | lolcat -a -d 1
}

# Display welcome message
welcome_message

# Gothic castle banner
display_banner() {
  case "$BANNER_STYLE" in
    "castle")
      echo "
                /\\                              /\\
               /  \\                            /  \\
              /    \\                          /    \\
             /      \\                        /      \\
            /        \\                      /        \\
           /    /\\    \\                    /    /\\    \\
          /    /  \\    \\                  /    /  \\    \\
         /    /    \\    \\                /    /    \\    \\
        /    /      \\    \\              /    /      \\    \\
       /____/        \\____\\            /____/        \\____\\
       |    |        |    |            |    |        |    |
       |    |        |    |            |    |        |    |
       |____|________|____|____________|____|________|____|
      /                                                    \\
     /                                                      \\
    /                                                        \\
   /          ____                  ____                      \\
  /          /    \\                /    \\                      \\
 /          /      \\              /      \\                      \\
/          /        \\            /        \\                      \\
|         |    __    |          |    __    |                     |
|         |   |  |   |          |   |  |   |                     |
|         |   |  |   |          |   |  |   |                     |
|_________|___|  |___|__________|___|  |___|_____________________|
      " | lolcat -a -d 1 -s 70
      echo -e "${ACCENT_COLOR}
   ▄█    █▄   ▄██████▄     ▄████████   ▄▄▄▄███▄▄▄▄      ▄███████▄  ▄█     ▄████████    ▄████████ 
  ███    ███ ███    ███   ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ███    ███    ███   ███    ███ 
  ███    ███ ███    ███   ███    █▀  ███   ███   ███   ███    ███ ███▌   ███    █▀    ███    █▀  
 ▄███▄▄▄▄███▄ ███    ███  ▄███▄▄▄     ███   ███   ███   ███    ███ ███▌  ▄███▄▄▄      ▄███▄▄▄     
▀▀███▀▀▀▀███▀ ███    ███ ▀▀███▀▀▀     ███   ███   ███ ▀█████████▀  ███▌ ▀▀███▀▀▀     ▀▀███▀▀▀     
  ███    ███ ███    ███   ███    █▄  ███   ███   ███   ███        ███    ███    █▄    ███    █▄  
  ███    ███ ███    ███   ███    ███ ███   ███   ███   ███        ███    ███    ███   ███    ███ 
  ███    █▀   ▀██████▀    ██████████  ▀█   ███   █▀   ▄████▀      █▀     ██████████   ██████████ 
      ${reset}"
      ;;
    *)
      # Fallback banner
      echo "
      ██╗   ██╗ █████╗ ███╗   ███╗██████╗ ██╗██████╗ ███████╗
      ██║   ██║██╔══██╗████╗ ████║██╔══██╗██║██╔══██╗██╔════╝
      ██║   ██║███████║██╔████╔██║██████╔╝██║██████╔╝█████╗  
      ╚██╗ ██╔╝██╔══██║██║╚██╔╝██║██╔═══╝ ██║██╔══██╗██╔══╝  
       ╚████╔╝ ██║  ██║██║ ╚═╝ ██║██║     ██║██║  ██║███████╗
        ╚═══╝  ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Gothic and vampire quotes
custom_quotes=(
  "What is a man? A miserable little pile of secrets!"
  "The blood is the life!"
  "Listen to them, the children of the night. What music they make!"
  "I have crossed oceans of time to find you."
  "It is the darkness that is the light."
  "There is no life in the void, only death."
  "We are creatures of the underworld. We can't afford to love."
  "The oldest and strongest emotion of mankind is fear, and the oldest and strongest kind of fear is fear of the unknown."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Gothic-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╔══════════════ CASTLE STATUS ══════════════╗${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}║ Night.......: ${TEXT_COLOR}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    echo -e "${SECONDARY_COLOR}║ Soul Essence: ${TEXT_COLOR}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
    
    echo -e "${SECONDARY_COLOR}║ Crypt Space.: ${TEXT_COLOR}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Choose icon based on battery level
      if [ $BATT_CAPACITY -gt 80 ]; then
        BATT_ICON="❦"
      elif [ $BATT_CAPACITY -gt 40 ]; then
        BATT_ICON="❧"
      else
        BATT_ICON="†"
      fi
      
      echo -e "${SECONDARY_COLOR}║ Blood Level.: ${TEXT_COLOR}${BATT_ICON} ${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}║ Awake For...: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU load if available
    if [ -e "/proc/loadavg" ]; then
      CPU_LOAD=$(cat /proc/loadavg | awk '{print $1 " " $2 " " $3}')
      echo -e "${SECONDARY_COLOR}║ Death Toll..: ${TEXT_COLOR}${CPU_LOAD}${reset}"
    fi
    
    # Get hostname and username
    HOST=$(hostname 2>/dev/null || echo "unknown")
    USER=$(whoami 2>/dev/null || echo "unknown")
    echo -e "${SECONDARY_COLOR}║ Vessel......: ${TEXT_COLOR}${USER}@${HOST}${reset}"
    
    echo -e "${PRIMARY_COLOR}╚═════════════════════════════════════════╝${reset}"
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
