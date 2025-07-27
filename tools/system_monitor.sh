#!/bin/bash

# HackShell Advanced System Monitor
# Created by Team ILLUSION || DK

# Colors
green='\033[1;92m'
yellow='\033[1;93m'
white='\033[1;97m'
cyan='\033[1;96m'
red='\033[1;91m'
blue='\033[1;94m'
purple='\033[1;95m'
reset='\033[0m'

# Display header
display_header() {
    clear
    echo -e "${cyan}╔══════════════════════════════════════════════╗${reset}"
    echo -e "${cyan}║              SYSTEM MONITOR DASHBOARD        ║${reset}"
    echo -e "${cyan}╚══════════════════════════════════════════════╝${reset}"
    echo ""
}

# Get system info with better formatting
get_system_info() {
    echo -e "${yellow}┌─ HARDWARE INFO ─────────────────────────────┐${reset}"
    
    # CPU Information
    if [ -f /proc/cpuinfo ]; then
        CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | sed 's/^[ \t]*//')
        CPU_CORES=$(grep "processor" /proc/cpuinfo | wc -l)
        echo -e "${green}│ CPU:     ${white}$CPU_MODEL ($CPU_CORES cores)${reset}"
    fi
    
    # Memory Information
    if [ -f /proc/meminfo ]; then
        TOTAL_MEM=$(grep "MemTotal" /proc/meminfo | awk '{print int($2/1024)}')
        AVAIL_MEM=$(grep "MemAvailable" /proc/meminfo | awk '{print int($2/1024)}')
        USED_MEM=$((TOTAL_MEM - AVAIL_MEM))
        MEM_PERCENT=$((USED_MEM * 100 / TOTAL_MEM))
        
        echo -e "${green}│ Memory:  ${white}${USED_MEM}MB / ${TOTAL_MEM}MB (${MEM_PERCENT}% used)${reset}"
        
        # Memory usage bar
        local bar_length=20
        local filled=$((MEM_PERCENT * bar_length / 100))
        local empty=$((bar_length - filled))
        
        printf "${green}│ Usage:   ${white}["
        printf "%*s" $filled | tr ' ' '█'
        printf "%*s" $empty | tr ' ' '░'
        printf "] %d%%${reset}\n" $MEM_PERCENT
    fi
    
    # Storage Information
    STORAGE_INFO=$(df -h "$HOME" | tail -1)
    USED_STORAGE=$(echo $STORAGE_INFO | awk '{print $3}')
    TOTAL_STORAGE=$(echo $STORAGE_INFO | awk '{print $2}')
    STORAGE_PERCENT=$(echo $STORAGE_INFO | awk '{print $5}' | tr -d '%')
    
    echo -e "${green}│ Storage: ${white}$USED_STORAGE / $TOTAL_STORAGE ($STORAGE_PERCENT% used)${reset}"
    
    echo -e "${yellow}└─────────────────────────────────────────────┘${reset}"
    echo ""
}

# Get network info
get_network_info() {
    echo -e "${yellow}┌─ NETWORK INFO ──────────────────────────────┐${reset}"
    
    # WiFi Information
    if command -v termux-wifi-connectioninfo &> /dev/null; then
        WIFI_INFO=$(termux-wifi-connectioninfo 2>/dev/null)
        if [ $? -eq 0 ]; then
            SSID=$(echo "$WIFI_INFO" | grep "ssid" | cut -d'"' -f4)
            RSSI=$(echo "$WIFI_INFO" | grep "rssi" | cut -d: -f2 | tr -d ' ,')
            FREQUENCY=$(echo "$WIFI_INFO" | grep "frequency" | cut -d: -f2 | tr -d ' ,')
            
            if [ -n "$SSID" ]; then
                echo -e "${green}│ WiFi:    ${white}Connected to $SSID${reset}"
                echo -e "${green}│ Signal:  ${white}$RSSI dBm @ $FREQUENCY MHz${reset}"
            else
                echo -e "${green}│ WiFi:    ${red}Disconnected${reset}"
            fi
        else
            echo -e "${green}│ WiFi:    ${yellow}Status unavailable${reset}"
        fi
    fi
    
    # IP Information
    if command -v ip &> /dev/null; then
        LOCAL_IP=$(ip route get 8.8.8.8 2>/dev/null | grep -oP 'src \K[^ ]+' | head -1)
        if [ -n "$LOCAL_IP" ]; then
            echo -e "${green}│ Local IP:${white}$LOCAL_IP${reset}"
        fi
    fi
    
    # Public IP (if internet available)
    if command -v curl &> /dev/null; then
        PUBLIC_IP=$(curl -s --max-time 3 ifconfig.me 2>/dev/null)
        if [ -n "$PUBLIC_IP" ]; then
            echo -e "${green}│ Public IP:${white}$PUBLIC_IP${reset}"
        fi
    fi
    
    echo -e "${yellow}└─────────────────────────────────────────────┘${reset}"
    echo ""
}

# Get process info
get_process_info() {
    echo -e "${yellow}┌─ TOP PROCESSES ─────────────────────────────┐${reset}"
    
    # Get top 5 processes by CPU usage
    echo -e "${green}│ ${white}PID    CPU%  COMMAND${reset}"
    echo -e "${green}│ ${white}────   ────  ───────────────────────────${reset}"
    
    if command -v top &> /dev/null; then
        top -b -n1 | grep -E "^ *[0-9]+" | head -5 | while read line; do
            PID=$(echo $line | awk '{print $1}')
            CPU=$(echo $line | awk '{print $9}')
            CMD=$(echo $line | awk '{print $12}' | cut -c1-25)
            printf "${green}│ ${white}%-6s %-5s %-25s${reset}\n" "$PID" "$CPU%" "$CMD"
        done
    else
        echo -e "${green}│ ${red}Top command not available${reset}"
    fi
    
    echo -e "${yellow}└─────────────────────────────────────────────┘${reset}"
    echo ""
}

# Get battery info
get_battery_info() {
    echo -e "${yellow}┌─ POWER STATUS ──────────────────────────────┐${reset}"
    
    if command -v termux-battery-status &> /dev/null; then
        BATTERY_JSON=$(termux-battery-status 2>/dev/null)
        if [ $? -eq 0 ]; then
            PERCENTAGE=$(echo "$BATTERY_JSON" | grep "percentage" | cut -d: -f2 | tr -d ' ,')
            STATUS=$(echo "$BATTERY_JSON" | grep "status" | cut -d'"' -f4)
            TEMPERATURE=$(echo "$BATTERY_JSON" | grep "temperature" | cut -d: -f2 | tr -d ' ,')
            HEALTH=$(echo "$BATTERY_JSON" | grep "health" | cut -d'"' -f4)
            
            # Battery level color coding
            if [ "$PERCENTAGE" -gt 80 ]; then
                BATT_COLOR="${green}"
            elif [ "$PERCENTAGE" -gt 50 ]; then
                BATT_COLOR="${yellow}"
            elif [ "$PERCENTAGE" -gt 20 ]; then
                BATT_COLOR="${yellow}"
            else
                BATT_COLOR="${red}"
            fi
            
            echo -e "${green}│ Level:   ${BATT_COLOR}$PERCENTAGE%${reset}"
            echo -e "${green}│ Status:  ${white}$STATUS${reset}"
            echo -e "${green}│ Temp:    ${white}$TEMPERATURE°C${reset}"
            echo -e "${green}│ Health:  ${white}$HEALTH${reset}"
            
            # Battery bar
            local bar_length=20
            local filled=$((PERCENTAGE * bar_length / 100))
            local empty=$((bar_length - filled))
            
            printf "${green}│ Battery: ${white}["
            printf "%*s" $filled | tr ' ' '█'
            printf "%*s" $empty | tr ' ' '░'
            printf "] %d%%${reset}\n" $PERCENTAGE
        else
            echo -e "${green}│ ${red}Battery info unavailable${reset}"
        fi
    else
        echo -e "${green}│ ${yellow}Termux API not installed${reset}"
    fi
    
    echo -e "${yellow}└─────────────────────────────────────────────┘${reset}"
    echo ""
}

# Main dashboard
show_dashboard() {
    while true; do
        display_header
        
        get_system_info
        get_battery_info
        get_network_info
        get_process_info
        
        echo -e "${cyan}┌─ OPTIONS ───────────────────────────────────┐${reset}"
        echo -e "${cyan}│ [r] Refresh  [q] Quit  [s] Save Report      │${reset}"
        echo -e "${cyan}└─────────────────────────────────────────────┘${reset}"
        echo ""
        
        read -n 1 -s -t 5 key
        
        case $key in
            'r'|'R')
                continue
                ;;
            's'|'S')
                save_report
                ;;
            'q'|'Q')
                echo -e "${yellow}Exiting system monitor...${reset}"
                return
                ;;
            *)
                # Auto-refresh after 5 seconds
                continue
                ;;
        esac
    done
}

# Save system report
save_report() {
    local report_file="$HOME/system_report_$(date +%Y%m%d_%H%M%S).txt"
    
    echo "HackShell System Report" > "$report_file"
    echo "Generated: $(date)" >> "$report_file"
    echo "======================================" >> "$report_file"
    echo "" >> "$report_file"
    
    # Get system info without colors
    echo "HARDWARE INFO:" >> "$report_file"
    if [ -f /proc/cpuinfo ]; then
        CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | sed 's/^[ \t]*//')
        CPU_CORES=$(grep "processor" /proc/cpuinfo | wc -l)
        echo "CPU: $CPU_MODEL ($CPU_CORES cores)" >> "$report_file"
    fi
    
    if [ -f /proc/meminfo ]; then
        TOTAL_MEM=$(grep "MemTotal" /proc/meminfo | awk '{print int($2/1024)}')
        AVAIL_MEM=$(grep "MemAvailable" /proc/meminfo | awk '{print int($2/1024)}')
        USED_MEM=$((TOTAL_MEM - AVAIL_MEM))
        echo "Memory: ${USED_MEM}MB / ${TOTAL_MEM}MB" >> "$report_file"
    fi
    
    STORAGE_INFO=$(df -h "$HOME" | tail -1)
    echo "Storage: $(echo $STORAGE_INFO | awk '{print $3 "/" $2 " (" $5 " used)"}')" >> "$report_file"
    
    echo "" >> "$report_file"
    echo "NETWORK INFO:" >> "$report_file"
    
    if command -v termux-wifi-connectioninfo &> /dev/null; then
        WIFI_INFO=$(termux-wifi-connectioninfo 2>/dev/null)
        if [ $? -eq 0 ]; then
            SSID=$(echo "$WIFI_INFO" | grep "ssid" | cut -d'"' -f4)
            if [ -n "$SSID" ]; then
                echo "WiFi: Connected to $SSID" >> "$report_file"
            else
                echo "WiFi: Disconnected" >> "$report_file"
            fi
        fi
    fi
    
    echo "" >> "$report_file"
    echo "BATTERY INFO:" >> "$report_file"
    
    if command -v termux-battery-status &> /dev/null; then
        BATTERY_JSON=$(termux-battery-status 2>/dev/null)
        if [ $? -eq 0 ]; then
            PERCENTAGE=$(echo "$BATTERY_JSON" | grep "percentage" | cut -d: -f2 | tr -d ' ,')
            STATUS=$(echo "$BATTERY_JSON" | grep "status" | cut -d'"' -f4)
            echo "Battery: $PERCENTAGE% ($STATUS)" >> "$report_file"
        fi
    fi
    
    echo -e "\n${green}Report saved to: $report_file${reset}"
    sleep 2
}

# Start the dashboard
show_dashboard