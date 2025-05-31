#!/bin/bash

# HackShell v1.1 - Jungle Adventure Theme
# A lush rainforest theme with vibrant greens and earth tones

# Theme information
THEME_NAME="Jungle Adventure"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A lush rainforest theme with vibrant greens and earth tones"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="jungle"
WELCOME_SOUND=true

# Colors - Jungle palette
PRIMARY_COLOR='\033[1;38;5;22m'    # Dark green
SECONDARY_COLOR='\033[1;38;5;70m'  # Medium green
ACCENT_COLOR='\033[1;38;5;226m'    # Bright yellow
TEXT_COLOR='\033[1;38;5;230m'      # Off-white
PROMPT_COLOR='\033[1;38;5;118m'    # Bright green
reset='\033[0m'                    # Reset color

# Custom prompt style with jungle-themed symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${SECONDARY_COLOR}\]🌿\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─🌴 \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome to the jungle, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Where wild code runs free...${reset}"
  echo "🌴🌿🌱🍃🌴🌿🌱🍃🌴🌿🌱🍃🌴🌿🌱🍃🌴🌿🌱🍃" | lolcat -a
}

# Display welcome message
welcome_message

# Jungle-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "jungle")
      echo "
       . _                                           .x+=:.        s                        ..           
      .@^%                                         z'    ^%      :8                     .:x88:  5.      
     .@' '9                                           .   <k    .88                   :8888'   '8.     
    .@'   9                                      .+>    .x8x    888:       .u       888R      u%     
   .@'     9        u           .         u     @88>  :888'8   ^888:    ud8888.   8888R     z8F      
  .@'       9     us888u.    .udR88N    us888u.'@88> d888  '8    888R :888'8888. ''888R    :d88L .udR88N  
 .@'         9  .@88 '8888' <888'888k .@88 '8888@88>8888   <*     888R d888 '88%'   888R    ''Y88><888'888k
.@'           9 9888  9888  9888 'Y'  9888  9888@88>8888          888R 8888.+'      888R       Y88 9888 'Y' 
@'------------6 9888  9888  9888      9888  9888@88>8888          888R 8888L       .888B .   '888* 9888     
               9 9888  9888  9888      9888  9888@88>8888          888R '8888c. .+  ^*888%    ^Y'  9888     
               9 9888  9888  ?8888u../ ?8888u../ %888>8888       '888B  '88888%      '%       /    ?8888u../ 
               9 '888*''888'  '8888P'   '8888P'   '888 '%888.      ^888     'YP'         /     '8888P'   
               9   ''Y' 'Y'     'P'       'P'      ''    'YP'       888                /        'P'       
               9                                                    ^88>              /                    
               ^---------------------------------------------      J8%              '                    
                                                                    @%                                  
      " | lolcat -a -d 2
      ;;
    *)
      # Fallback banner
      echo "
       ____ ____ ____ ____ ____ ____ ____ ____ 
      ||J |||U |||N |||G |||L |||E |||! |||! ||
      ||__|||__|||__|||__|||__|||__|||__|||__||
      |/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Jungle and adventure quotes
custom_quotes=(
  "In the jungle, the mighty jungle, the coder sleeps tonight."
  "Life is a great adventure, code is the map."
  "The jungle is alive. It's a living, breathing organism with its own rules."
  "In the heart of the jungle, there's a path only the brave can follow."
  "Code like a vine - always growing, always adapting."
  "The most beautiful things in the world cannot be seen or touched, they are felt with the heart."
  "Adventure awaits those who are willing to explore the unknown."
  "The jungle teaches us that even in chaos, there is pattern and purpose."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Jungle-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╭─── JUNGLE EXPEDITION REPORT ────╮${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}│ Day......: ${TEXT_COLOR}$(date +"%A")${reset}"
    echo -e "${SECONDARY_COLOR}│ Time.....: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual jungle canopy bar for memory
    MEM_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 10 )) ]; then
        MEM_BAR+="🌿"
      else
        MEM_BAR+="·"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ Memory...: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual jungle floor bar for storage
    STORAGE_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 10 )) ]; then
        STORAGE_BAR+="🌱"
      else
        STORAGE_BAR+="·"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ Storage..: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual fruit bar for battery
      BATT_BAR=""
      for ((i=0; i<10; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 10 )) ]; then
          BATT_BAR+="🍋"
        else
          BATT_BAR+="·"
        fi
      done
      
      echo -e "${SECONDARY_COLOR}│ Energy...: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}%${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}│ Journey..: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}│ Heat.....: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get IP if available
    if command -v ip &> /dev/null; then
      IP_ADDR=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v "127.0.0.1" | head -n 1)
      if [ -n "$IP_ADDR" ]; then
        echo -e "${SECONDARY_COLOR}│ Location.: ${TEXT_COLOR}${IP_ADDR}${reset}"
      fi
    fi
    
    # Get user info
    USER=$(whoami)
    echo -e "${SECONDARY_COLOR}│ Explorer.: ${TEXT_COLOR}${USER}${reset}"
    
    echo -e "${PRIMARY_COLOR}╰───────────────────────────────────╯${reset}"
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
