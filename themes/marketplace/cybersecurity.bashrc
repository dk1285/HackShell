#!/bin/bash

# HackShell v1.1 - Cybersecurity Theme
# A professional theme for security professionals

# Theme information
THEME_NAME="Cybersecurity Pro"
THEME_AUTHOR="HackShell Team"
THEME_VERSION="1.0"
THEME_DESCRIPTION="A professional theme for security researchers and penetration testers"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="security"
WELCOME_SOUND=true

# Colors - Professional blue and gray color scheme
PRIMARY_COLOR='\033[1;38;5;39m'   # Steel blue
SECONDARY_COLOR='\033[1;38;5;244m' # Gray
ACCENT_COLOR='\033[1;38;5;208m'    # Orange for alerts
TEXT_COLOR='\033[1;38;5;252m'      # Light gray
PROMPT_COLOR='\033[1;38;5;46m'     # Bright green
reset='\033[0m'                    # Reset color

# Custom prompt style
PS1='\[${PRIMARY_COLOR}\]┌──[\[${ACCENT_COLOR}\]\T\[${PRIMARY_COLOR}\]]──[\[${SECONDARY_COLOR}\]HackShell\[${PRIMARY_COLOR}\]]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[${PRIMARY_COLOR}\]──[\[${ACCENT_COLOR}\]🔋'$BATT_CAPACITY'%\[${PRIMARY_COLOR}\]]'
fi

PS1+='\[${PRIMARY_COLOR}\]\n├──[\[${SECONDARY_COLOR}\]\w\[${PRIMARY_COLOR}\]]\n\[${PRIMARY_COLOR}\]└──╼ \[${PROMPT_COLOR}\]$ \[${reset}\]'

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
    echo -e "${ACCENT_COLOR}Welcome back, ${TEXT_COLOR}$CUSTOM_NAME${reset}"
  else
    echo -e "${ACCENT_COLOR}Welcome to ${TEXT_COLOR}$THEME_NAME${reset}"
  fi
  echo -e "${SECONDARY_COLOR}Security is not a product, but a process.${reset}"
  echo "-----------------------------------" | lolcat
}

# Display welcome message
welcome_message

# Custom security banner
display_banner() {
  case "$BANNER_STYLE" in
    "security")
      echo "
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
█ ▄▄▀█ ▄▄█▄ ▄█ ▄▄█ ▄▄▀█ ▄▄▀█ ▄▄█ ▄▄█ █ █ ▄▄▀█
█ ▀▀ █ ▄▄██ ██ ▄▄█ ▀▀ █ ▀▀ █ ▄▄█ ▄▄█ █ █ ▀▀▄█
█ ██ █▄▄▄██▄██▄▄▄█ ██ █▄██▄█▄▄▄█▄▄▄█▄▄▄█▄█▄▄█
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
      " | lolcat -a -d 1
      ;;
    *)
      # Fallback to default banner
      echo "
   ┏━━━┓╋╋╋╋╋╋╋┏┓╋╋╋╋╋╋╋╋╋╋┏━━━┓╋╋╋╋╋╋╋┏┓
   ┃┏━┓┃╋╋╋╋╋╋╋┃┃╋╋╋╋╋╋╋╋╋╋┃┏━━┛╋╋╋╋╋╋╋┃┃
   ┃┗━┛┣━━┳━━┳━┛┣┳━━┳┓╋┏┓╋╋┃┗━━┳━━┳━━┳━┛┣┓╋┏┓
   ┃┏━━┫┏┓┃┏┓┃┏┓┣┫┏┓┃┃╋┃┃╋╋┃┏━━┫┏┓┃┏┓┃┏┓┃┃╋┃┃
   ┃┃╋╋┃┏┓┃┗┛┃┗┛┃┃┃┃┃┗━┛┃╋╋┃┗━━┫┗┛┃┗┛┃┗┛┃┗━┛┃
   ┗┛╋╋┗┛┗┻━┓┣━━┻┻┛┗┻━┓┏┛╋╋┗━━━┻━━┻━━┻━━┻━┓┏┛
   ╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
   ╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
      " | lolcat
      ;;
  esac
}

# Display banner
display_banner

# Security-focused quotes
custom_quotes=(
  "The quieter you become, the more you can hear. - Ram Dass"
  "Security is always excessive until it's not enough. - Robbie Sinclair"
  "Privacy is not an option, and it shouldn't be the price we accept for just getting on the Internet. - Gary Kovacs"
  "If you think technology can solve your security problems, then you don't understand the problems and you don't understand the technology. - Bruce Schneier"
  "Security is a process, not a product. - Bruce Schneier"
  "The only system which is truly secure is one which is switched off and unplugged. - Gene Spafford"
  "In a world full of vulnerabilities, awareness is the best defense."
)

# Display a random quote
if [ ${#custom_quotes[@]} -gt 0 ]; then
  rand=$((RANDOM % ${#custom_quotes[@]}))
  echo -e "\n${ACCENT_COLOR}${custom_quotes[$rand]}${reset}\n"
fi

# Enhanced system information with security focus
display_sysinfo() {
  if [ "$SHOW_SYSINFO" = "true" ]; then
    echo ""
    echo -e "${PRIMARY_COLOR}╔════════════ SYSTEM STATUS ════════════╗${reset}"
    
    # Get date/time
    echo -e "${SECONDARY_COLOR}▸ Date: ${TEXT_COLOR}$(date +"%Y-%m-%d %H:%M:%S")${reset}"
    
    # Get memory usage
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USED=$(free -m | grep Mem | awk '{print $3}')
    MEM_PERCENT=$(( MEM_USED * 100 / MEM_TOTAL ))
    
    echo -e "${SECONDARY_COLOR}▸ Memory: ${TEXT_COLOR}${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)${reset}"
    
    # Get storage info
    STORAGE_TOTAL=$(df -h $HOME | awk 'NR==2 {print $2}')
    STORAGE_USED=$(df -h $HOME | awk 'NR==2 {print $3}')
    STORAGE_PERCENT=$(df -h $HOME | awk 'NR==2 {print $5}')
    
    echo -e "${SECONDARY_COLOR}▸ Storage: ${TEXT_COLOR}${STORAGE_USED} / ${STORAGE_TOTAL} (${STORAGE_PERCENT})${reset}"
    
    # Get IP address
    IP_ADDR=$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1 | head -n1)
    if [ -n "$IP_ADDR" ]; then
      echo -e "${SECONDARY_COLOR}▸ IP Address: ${TEXT_COLOR}${IP_ADDR}${reset}"
    else
      echo -e "${SECONDARY_COLOR}▸ IP Address: ${TEXT_COLOR}Not connected${reset}"
    fi
    
    # Get battery info
    if [ -e "/sys/class/power_supply/battery/capacity" ]; then
      BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
      BATT_STATUS=$(cat /sys/class/power_supply/battery/status)
      echo -e "${SECONDARY_COLOR}▸ Battery: ${TEXT_COLOR}${BATT_CAPACITY}% (${BATT_STATUS})${reset}"
    fi
    
    # Get uptime
    UPTIME=$(uptime -p)
    echo -e "${SECONDARY_COLOR}▸ Uptime: ${TEXT_COLOR}${UPTIME}${reset}"
    
    # Get Termux version
    if [ -n "$(command -v termux-info)" ]; then
      TERMUX_VER=$(termux-info | grep "Termux version" | cut -d":" -f2 | xargs)
      echo -e "${SECONDARY_COLOR}▸ Termux: ${TEXT_COLOR}${TERMUX_VER}${reset}"
    fi
    
    echo -e "${PRIMARY_COLOR}╚═══════════════════════════════════════╝${reset}"
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
