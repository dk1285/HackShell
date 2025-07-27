#!/bin/bash

# HackShell v1.1 - Neon Theme
# Created by Team ILLUSION || DK
# Enhanced with modern features

# Theme metadata
THEME_NAME="Neon City"
THEME_AUTHOR="Team ILLUSION"
THEME_VERSION="1.0"
THEME_DESCRIPTION="Vibrant neon cyberpunk theme with electric colors"

# Configuration variables - these will be updated by config.sh
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="neon"
WELCOME_SOUND=true

# Colors - Enhanced neon palette
neon_pink='\033[1;95m'
neon_cyan='\033[1;96m'
neon_green='\033[1;92m'
neon_yellow='\033[1;93m'
neon_purple='\033[1;94m'
electric_blue='\033[38;5;39m'
hot_pink='\033[38;5;198m'
lime_green='\033[38;5;118m'
orange='\033[38;5;208m'
white='\033[1;97m'
black='\033[0;30m'
reset='\033[0m'

# Custom prompt style with neon effects
PS1='\[\e[95m\]┌─[\[\e[96m\]\T\[\e[95m\]]─────\[\e[1;93m\][NEON-SHELL]\[\e[95m\]'

# Add battery status with neon styling
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
  
  # Color code battery level
  if [ "$BATT_CAPACITY" -gt 80 ]; then
    BATT_COLOR='\e[92m'  # Green
  elif [ "$BATT_CAPACITY" -gt 50 ]; then
    BATT_COLOR='\e[93m'  # Yellow
  elif [ "$BATT_CAPACITY" -gt 20 ]; then
    BATT_COLOR='\e[38;5;208m'  # Orange
  else
    BATT_COLOR='\e[91m'  # Red
  fi
  
  PS1+='\[\e[95m\]──[\['$BATT_COLOR'\]⚡'$BATT_CAPACITY'%\[\e[95m\]]'
fi

PS1+='\[\e[95m\]\n|\n\[\e[95m\]└─[\[\e[96m\]\w\[\e[95m\]]────►\[\e[92m\] '

# Clear screen
clear

# Play welcome sound if enabled
if [ "$WELCOME_SOUND" = "true" ]; then
  mpv "$HOME/HackShell/welcome.mp3" >/dev/null 2>&1 &
fi

# Clear screen again
clear

# Show greeting with custom name if set
if [ -n "$CUSTOM_NAME" ]; then
  echo -e "${neon_cyan}Welcome back, ${neon_pink}$CUSTOM_NAME${reset}"
  echo "-----------------------------------" | lolcat
else
  echo -e "Created By \e[5m${neon_yellow}Team ILLUSION || DK${reset}"
  echo "-----------------------------------" | lolcat
fi

# Enhanced banner system
show_banner() {
  case "$BANNER_STYLE" in
    "neon")
      echo -e "${neon_pink}"
      figlet -f small "NEON SHELL" | lolcat
      echo -e "${electric_blue}▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓${reset}"
      ;;
    "minimal")
      echo -e "${neon_cyan}> NEON TERMINAL READY${reset}"
      ;;
    "cyberpunk")
      echo -e "${neon_pink}╔════════════════════════════════════╗"
      echo -e "║           ${neon_cyan}NEON CYBERSHELL${neon_pink}         ║"
      echo -e "╚════════════════════════════════════╝${reset}"
      ;;
    *)
      figlet "HackShell" | lolcat
      ;;
  esac
}

show_banner

# System information display
if [ "$SHOW_SYSINFO" = "true" ]; then
  echo ""
  echo -e "${neon_cyan}╭─ SYSTEM STATUS ─────────────────────────╮${reset}"
  
  # Get system info
  if command -v termux-battery-status &> /dev/null; then
    BATTERY_INFO=$(termux-battery-status 2>/dev/null | grep -E "(percentage|status)" | tr '\n' ' ')
    echo -e "${neon_green}│ Battery: ${white}$BATTERY_INFO${reset}"
  fi
  
  # Memory usage
  if [ -f /proc/meminfo ]; then
    MEMORY=$(free -h | grep Mem | awk '{print $3 "/" $2}')
    echo -e "${neon_green}│ Memory:  ${white}$MEMORY${reset}"
  fi
  
  # Storage usage
  STORAGE=$(df -h "$HOME" | tail -1 | awk '{print $3 "/" $2 " (" $5 " used)"}')
  echo -e "${neon_green}│ Storage: ${white}$STORAGE${reset}"
  
  # Network status
  if command -v termux-wifi-connectioninfo &> /dev/null; then
    WIFI_SSID=$(termux-wifi-connectioninfo 2>/dev/null | grep "ssid" | cut -d'"' -f4)
    if [ -n "$WIFI_SSID" ]; then
      echo -e "${neon_green}│ WiFi:    ${white}Connected to $WIFI_SSID${reset}"
    else
      echo -e "${neon_green}│ WiFi:    ${white}Disconnected${reset}"
    fi
  fi
  
  # Current time
  echo -e "${neon_green}│ Time:    ${white}$(date '+%H:%M:%S %Z')${reset}"
  
  echo -e "${neon_cyan}╰─────────────────────────────────────────╯${reset}"
  echo ""
fi

# Welcome message
echo -e "${neon_yellow}Welcome to the ${neon_pink}Neon ${neon_cyan}CyberShell${reset}"
echo -e "${white}Type ${neon_green}'bash config.sh'${white} to customize your experience${reset}"
echo ""