#!/bin/bash

# HackShell v1.1 - Cosmic Theme
# A space-inspired theme with galaxy colors

# Theme information
THEME_NAME="Cosmic Explorer"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="Space-inspired theme with cosmic colors and starfield elements"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="cosmic"
WELCOME_SOUND=true

# Colors - Space-inspired palette
PRIMARY_COLOR='\033[1;38;5;93m'    # Deep purple
SECONDARY_COLOR='\033[1;38;5;63m'  # Blue-purple
ACCENT_COLOR='\033[1;38;5;213m'    # Pink
TEXT_COLOR='\033[1;38;5;159m'      # Light blue
PROMPT_COLOR='\033[1;38;5;226m'    # Star yellow
reset='\033[0m'                    # Reset color

# Custom prompt style with cosmic symbols
PS1='\[${PRIMARY_COLOR}\]┌─[\[${ACCENT_COLOR}\]★\[${PRIMARY_COLOR}\]]─[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n'
PS1+='\[${PRIMARY_COLOR}\]└─[\[${ACCENT_COLOR}\]\T\[${PRIMARY_COLOR}\]]→ \[${PROMPT_COLOR}\]✧ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Greetings, Explorer ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to the ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Journey through the digital cosmos...${reset}"
  echo "✧･ﾟ: *✧･ﾟ:* *:･ﾟ✧*:･ﾟ✧" | lolcat -a
}

# Display welcome message
welcome_message

# Space-themed banner
display_banner() {
  case "$BANNER_STYLE" in
    "cosmic")
      echo "
      .　　　　　　　　　　 ✦ 　　　　   　 　　　˚　　　　　　　　　　　　　　*　　　　　　   　　　　　　　　　　　　　　　.　　　　　　　　　　　　　　. 　　 　　　　　　　 ✦ 　　　　　　　　　　 　 ‍ ‍ ‍ ‍ 　　　　 　　　　　　　　　　　　,　　   　

      .　　　　　　　　　　　　　.　　　ﾟ　  　　　.　　　　　　　　　　　　　.

      　　　　　　,　　　　　　　.　　　　　　    　　　　 　　　　　　　　　　　　　　　　　　 ☀️ 　　　　　　　　　　　　　　　　　　    　      　　　　　        　　　　*　　　　　　　　　. 　　　　　　　　　　.　　　　　　　　　　　　　. 　　　　　　　　　　　　　　　　       　   　　　　 　　　　　　　　　　　　　　　　       　   　　　　　　　　　　　　　　　　       　    ✦ 
      " | lolcat -a -d 3
      
      echo "
        ██████╗ ██████╗ ███████╗███╗   ███╗██╗ ██████╗
       ██╔════╝██╔═══██╗██╔════╝████╗ ████║██║██╔════╝
       ██║     ██║   ██║███████╗██╔████╔██║██║██║     
       ██║     ██║   ██║╚════██║██║╚██╔╝██║██║██║     
       ╚██████╗╚██████╔╝███████║██║ ╚═╝ ██║██║╚██████╗
        ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝ ╚═════╝
                                                     
      " | lolcat -a -d 1
      ;;
    *)
      # Fallback banner with stars
      echo "
       *    .  *       .             *
                         *
   *   .        *       .       .       *
     .     *        *          .     .
 .           .      .   *           .
      *             .         *  .
            *                    *
           .        .               *
    *             *        .         .
          .                *
 .                  *               *
      *       .                     .
              .       *       .       *
.     *                .              .
                 .             *
            *               .     .
      .       *      .               *
                                   .
      " | lolcat -a -d 2
      echo "
      ╔═╗┌─┐┌─┐┌┬┐┬┌─┐  ╔═╗─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
      ║  │ │└─┐│││││    ║╣ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
      ╚═╝└─┘└─┘┴ ┴┴└─┘  ╚═╝┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─
      " | lolcat -a -d 1
      ;;
  esac
}

# Display banner
display_banner

# Space and cosmic quotes
custom_quotes=(
  "The universe is not only stranger than we imagine, it is stranger than we can imagine."
  "We are made of star stuff."
  "The cosmos is within us. We are a way for the universe to know itself."
  "Look up at the stars and not down at your feet."
  "For small creatures such as we, the vastness is bearable only through love."
  "The Earth is the cradle of humanity, but one cannot live in a cradle forever."
  "Space: the final frontier."
  "In the vastness of space and the immensity of time."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}\"${custom_quotes[$rand]}\"${reset}\n"
fi

# Space-themed system information
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}┏━━━━━━━━ SPACECRAFT SYSTEMS ━━━━━━━━┓${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}┃ Stardate.....: ${TEXT_COLOR}$(date +"%Y.%m.%d %H:%M")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    echo -e "${SECONDARY_COLOR}┃ Life Support..: ${TEXT_COLOR}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
    
    echo -e "${SECONDARY_COLOR}┃ Cargo Bay.....: ${TEXT_COLOR}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      
      if [ "$BATT_STATUS" == "Charging" ]; then
        STATUS_ICON="⚡"
      else
        STATUS_ICON="🔋"
      fi
      
      echo -e "${SECONDARY_COLOR}┃ Power Core....: ${TEXT_COLOR}${STATUS_ICON} ${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo -e "${SECONDARY_COLOR}┃ Mission Time..: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get load average
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | sed 's/,//g')
    echo -e "${SECONDARY_COLOR}┃ System Stress.: ${TEXT_COLOR}${LOAD}${reset}"
    
    # Get username
    USERNAME=$(whoami)
    echo -e "${SECONDARY_COLOR}┃ Navigator.....: ${TEXT_COLOR}${USERNAME}${reset}"
    
    echo -e "${PRIMARY_COLOR}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${reset}"
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
