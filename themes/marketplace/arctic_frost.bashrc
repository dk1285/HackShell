#!/bin/bash

# HackShell v1.1 - Arctic Frost Theme
# A cool icy theme with blue and white colors

# Theme information
THEME_NAME="Arctic Frost"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A cool icy theme with glacier blues and frost whites"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="frost"
WELCOME_SOUND=true

# Colors - Icy palette
PRIMARY_COLOR='\033[1;38;5;39m'    # Bright blue
SECONDARY_COLOR='\033[1;38;5;45m'  # Light blue
ACCENT_COLOR='\033[1;38;5;87m'     # Ice blue
TEXT_COLOR='\033[1;38;5;195m'      # White-blue
PROMPT_COLOR='\033[1;38;5;51m'     # Cyan
reset='\033[0m'                    # Reset color

# Custom prompt style with ice crystal symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]❄\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─❄ \[${PROMPT_COLOR}\]❯ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome to the frozen north, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Stay frosty and keep your code cool...${reset}"
  echo "❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅❄❅" | lolcat -a
}

# Display welcome message
welcome_message

# Arctic-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "frost")
      echo "
      ❄️   *       ❄️          *         ❄️      *     ❄️           *      ❄️  
     *     ❄️        *      ❄️      *        ❄️     *       ❄️    *         
         *      ❄️       *          ❄️  *        ❄️       *     ❄️      *    
    ❄️        *         ❄️    *            *  ❄️        *        ❄️   *     
     *    ❄️      *         ❄️    *      ❄️      *   ❄️       *         ❄️   
        *      ❄️       *       ❄️   *        ❄️      *    ❄️        *      
    ❄️      *        ❄️     *        ❄️    *         ❄️    *       ❄️     *  
      " | lolcat -a -d 2
      echo -e "${ACCENT_COLOR}
        █████╗ ██████╗  ██████╗████████╗██╗ ██████╗    ███████╗██████╗  ██████╗ ███████╗████████╗
       ██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║██╔════╝    ██╔════╝██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝
       ███████║██████╔╝██║        ██║   ██║██║         █████╗  ██████╔╝██║   ██║███████╗   ██║   
       ██╔══██║██╔══██╗██║        ██║   ██║██║         ██╔══╝  ██╔══██╗██║   ██║╚════██║   ██║   
       ██║  ██║██║  ██║╚██████╗   ██║   ██║╚██████╗    ██║     ██║  ██║╚██████╔╝███████║   ██║   
       ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   
      ${reset}"
      ;;
    *)
      # Fallback banner
      echo "
         .     *            *         .           *               .       *       .
              .       *                        .                                         
       .                  *       .                      *               .         *    
                    .                  .            *            .                       
        *    .             .          *      .                                 .        
                                    .                     .          *                  
      .              *                             .                            .      *
                  .        *           .     *                 .        *              
                                             .                                        
       *                   .                                                 *         
             .                         *             .          *                   .   
                           .                                                           
             *                                 .         *             .               
      " | lolcat -a -d 1
      echo "
      ╔═╗╦═╗╔═╗╔╦╗╦╔═╗  ╔═╗╦═╗╔═╗╔═╗╔╦╗
      ╠═╣╠╦╝║   ║ ║║    ╠╣ ╠╦╝║ ║╚═╗ ║ 
      ╩ ╩╩╚═╚═╝ ╩ ╩╚═╝  ╚  ╩╚═╚═╝╚═╝ ╩ 
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Arctic and ice quotes
custom_quotes=(
  "In the midst of winter, I found there was, within me, an invincible summer."
  "What good is the warmth of summer, without the cold of winter to give it sweetness."
  "When everything is white and smooth and even, as far as the eye can see."
  "The frost performs its secret ministry, unhelped by any wind."
  "Winter is not a season, it's a celebration."
  "Cold hands, warm heart."
  "Snowflakes are winter's butterflies."
  "If you listen carefully, the silence of snow falling is one of the most beautiful sounds."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Arctic-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╭─────────── GLACIER METRICS ───────────╮${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}│ Time........: ${TEXT_COLOR}$(date +"%H:%M:%S")${reset}"
    echo -e "${SECONDARY_COLOR}│ Date........: ${TEXT_COLOR}$(date +"%Y-%m-%d")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    # Create a visual ice bar for memory
    MEM_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( MEM_PERCENT / 10 )) ]; then
        MEM_BAR+="■"
      else
        MEM_BAR+="□"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ Ice Density..: ${TEXT_COLOR}${MEM_BAR} ${MEM_PERCENT}%${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Create a visual ice bar for storage
    STORAGE_BAR=""
    for ((i=0; i<10; i++)); do
      if [ $i -lt $(( STORAGE_PERCENT / 10 )) ]; then
        STORAGE_BAR+="■"
      else
        STORAGE_BAR+="□"
      fi
    done
    
    echo -e "${SECONDARY_COLOR}│ Snow Depth...: ${TEXT_COLOR}${STORAGE_BAR} ${STORAGE_PERCENT}%${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      # Create a visual ice bar for battery
      BATT_BAR=""
      for ((i=0; i<10; i++)); do
        if [ $i -lt $(( BATT_CAPACITY / 10 )) ]; then
          BATT_BAR+="■"
        else
          BATT_BAR+="□"
        fi
      done
      
      echo -e "${SECONDARY_COLOR}│ Energy......: ${TEXT_COLOR}${BATT_BAR} ${BATT_CAPACITY}%${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}│ Freeze Time..: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get CPU temperature if available
    if [ -e "/sys/class/thermal/thermal_zone0/temp" ]; then
      CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
      CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP/1000" | bc)
      echo -e "${SECONDARY_COLOR}│ Temperature..: ${TEXT_COLOR}${CPU_TEMP_C}°C${reset}"
    fi
    
    # Get user info
    USER=$(whoami)
    echo -e "${SECONDARY_COLOR}│ Explorer.....: ${TEXT_COLOR}${USER}${reset}"
    
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
