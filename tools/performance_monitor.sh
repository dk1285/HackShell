#!/bin/bash

# HackShell Performance Monitor
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

# Performance data file
PERF_LOG="$HOME/HackShell/performance.log"
PERF_DATA="$HOME/HackShell/perf_data"

# Initialize performance tracking
init_performance_tracking() {
    mkdir -p "$PERF_DATA"
    
    if [ ! -f "$PERF_LOG" ]; then
        echo "# HackShell Performance Log" > "$PERF_LOG"
        echo "# Format: timestamp,cpu_usage,memory_usage,disk_io,network_rx,network_tx" >> "$PERF_LOG"
    fi
}

# Get current performance metrics
get_performance_metrics() {
    local timestamp=$(date +%s)
    
    # CPU usage
    local cpu_usage=0
    if [ -f /proc/stat ]; then
        # Simple CPU usage calculation
        local cpu_line=$(grep "^cpu " /proc/stat)
        local cpu_times=($cpu_line)
        local idle=${cpu_times[4]}
        local total=0
        for time in "${cpu_times[@]:1}"; do
            total=$((total + time))
        done
        if [ $total -gt 0 ]; then
            cpu_usage=$(( (total - idle) * 100 / total ))
        fi
    fi
    
    # Memory usage
    local memory_usage=0
    if [ -f /proc/meminfo ]; then
        local total_mem=$(grep "MemTotal" /proc/meminfo | awk '{print $2}')
        local avail_mem=$(grep "MemAvailable" /proc/meminfo | awk '{print $2}')
        if [ $total_mem -gt 0 ]; then
            memory_usage=$(( (total_mem - avail_mem) * 100 / total_mem ))
        fi
    fi
    
    # Disk I/O (simplified)
    local disk_io=0
    if [ -f /proc/diskstats ]; then
        disk_io=$(awk '{sum += $6 + $10} END {print sum}' /proc/diskstats 2>/dev/null || echo 0)
    fi
    
    # Network stats (simplified)
    local network_rx=0
    local network_tx=0
    if [ -f /proc/net/dev ]; then
        local net_stats=$(grep -v "lo:" /proc/net/dev | awk '{rx += $2; tx += $10} END {print rx, tx}')
        network_rx=$(echo $net_stats | awk '{print $1}')
        network_tx=$(echo $net_stats | awk '{print $2}')
    fi
    
    echo "$timestamp,$cpu_usage,$memory_usage,$disk_io,$network_rx,$network_tx"
}

# Log performance data
log_performance() {
    local metrics=$(get_performance_metrics)
    echo "$metrics" >> "$PERF_LOG"
    
    # Keep only last 1000 entries
    tail -n 1000 "$PERF_LOG" > "$PERF_LOG.tmp" && mv "$PERF_LOG.tmp" "$PERF_LOG"
}

# Display performance dashboard
show_performance_dashboard() {
    clear
    echo -e "${cyan}╔══════════════════════════════════════════════╗${reset}"
    echo -e "${cyan}║            PERFORMANCE MONITOR               ║${reset}"
    echo -e "${cyan}╚══════════════════════════════════════════════╝${reset}"
    echo ""
    
    # Current metrics
    local current_metrics=$(get_performance_metrics)
    IFS=',' read -r timestamp cpu memory disk net_rx net_tx <<< "$current_metrics"
    
    echo -e "${yellow}┌─ CURRENT PERFORMANCE ───────────────────────┐${reset}"
    
    # CPU Usage Bar
    echo -e "${green}│ CPU Usage: ${white}$cpu%${reset}"
    local cpu_bar_length=30
    local cpu_filled=$((cpu * cpu_bar_length / 100))
    local cpu_empty=$((cpu_bar_length - cpu_filled))
    printf "${green}│ CPU Bar:   ${white}["
    printf "%*s" $cpu_filled | tr ' ' '█'
    printf "%*s" $cpu_empty | tr ' ' '░'
    printf "] %d%%${reset}\n" $cpu
    
    # Memory Usage Bar
    echo -e "${green}│ Memory:    ${white}$memory%${reset}"
    local mem_bar_length=30
    local mem_filled=$((memory * mem_bar_length / 100))
    local mem_empty=$((mem_bar_length - mem_filled))
    printf "${green}│ Mem Bar:   ${white}["
    printf "%*s" $mem_filled | tr ' ' '█'
    printf "%*s" $mem_empty | tr ' ' '░'
    printf "] %d%%${reset}\n" $memory
    
    # Disk I/O
    echo -e "${green}│ Disk I/O:  ${white}$disk operations${reset}"
    
    # Network
    local net_rx_mb=$((net_rx / 1024 / 1024))
    local net_tx_mb=$((net_tx / 1024 / 1024))
    echo -e "${green}│ Network:   ${white}↓${net_rx_mb}MB ↑${net_tx_mb}MB${reset}"
    
    echo -e "${yellow}└─────────────────────────────────────────────┘${reset}"
    echo ""
    
    # Performance history (if available)
    if [ -f "$PERF_LOG" ] && [ $(wc -l < "$PERF_LOG") -gt 3 ]; then
        echo -e "${yellow}┌─ PERFORMANCE HISTORY (Last 10 entries) ────┐${reset}"
        echo -e "${green}│ ${white}Time     CPU%  MEM%  Disk I/O${reset}"
        echo -e "${green}│ ${white}──────   ────  ────  ────────${reset}"
        
        tail -n 10 "$PERF_LOG" | grep -v "^#" | while IFS=',' read -r ts cpu mem disk rx tx; do
            local time_str=$(date -d "@$ts" +"%H:%M:%S" 2>/dev/null || echo "Unknown")
            printf "${green}│ ${white}%-8s %-4s%% %-4s%% %-8s${reset}\n" "$time_str" "$cpu" "$mem" "$disk"
        done
        
        echo -e "${yellow}└─────────────────────────────────────────────┘${reset}"
        echo ""
    fi
    
    # System recommendations
    echo -e "${yellow}┌─ SYSTEM RECOMMENDATIONS ────────────────────┐${reset}"
    
    if [ $cpu -gt 80 ]; then
        echo -e "${green}│ ${red}⚠ High CPU usage detected!${reset}"
        echo -e "${green}│ ${yellow}  Consider closing unused applications${reset}"
    elif [ $cpu -gt 60 ]; then
        echo -e "${green}│ ${yellow}⚠ Moderate CPU usage${reset}"
    else
        echo -e "${green}│ ${green}✓ CPU usage is normal${reset}"
    fi
    
    if [ $memory -gt 85 ]; then
        echo -e "${green}│ ${red}⚠ High memory usage!${reset}"
        echo -e "${green}│ ${yellow}  Consider freeing up memory${reset}"
    elif [ $memory -gt 70 ]; then
        echo -e "${green}│ ${yellow}⚠ Moderate memory usage${reset}"
    else
        echo -e "${green}│ ${green}✓ Memory usage is healthy${reset}"
    fi
    
    echo -e "${yellow}└─────────────────────────────────────────────┘${reset}"
    echo ""
}

# Performance optimization suggestions
show_optimization_tips() {
    clear
    echo -e "${cyan}╔══════════════════════════════════════════════╗${reset}"
    echo -e "${cyan}║            OPTIMIZATION TIPS                  ║${reset}"
    echo -e "${cyan}╚══════════════════════════════════════════════╝${reset}"
    echo ""
    
    echo -e "${yellow}💡 Performance Optimization Tips:${reset}"
    echo ""
    echo -e "${green}1. Memory Management:${reset}"
    echo -e "   • Use ${cyan}'free -h'${reset} to check memory usage"
    echo -e "   • Clear cache with ${cyan}'sync && echo 3 > /proc/sys/vm/drop_caches'${reset}"
    echo -e "   • Close unused applications"
    echo ""
    
    echo -e "${green}2. Storage Optimization:${reset}"
    echo -e "   • Clean package cache: ${cyan}'pkg clean'${reset}"
    echo -e "   • Remove orphaned packages: ${cyan}'pkg autoremove'${reset}"
    echo -e "   • Clear logs: ${cyan}'find ~/.log -type f -delete'${reset}"
    echo ""
    
    echo -e "${green}3. Network Performance:${reset}"
    echo -e "   • Use WiFi when possible for better performance"
    echo -e "   • Monitor data usage with ${cyan}'termux-wifi-connectioninfo'${reset}"
    echo ""
    
    echo -e "${green}4. Battery Optimization:${reset}"
    echo -e "   • Reduce screen brightness"
    echo -e "   • Disable unnecessary features"
    echo -e "   • Use power saving mode when needed"
    echo ""
    
    echo -e "${yellow}Press Enter to continue...${reset}"
    read
}

# Generate performance report
generate_performance_report() {
    local report_file="$HOME/performance_report_$(date +%Y%m%d_%H%M%S).txt"
    
    echo "HackShell Performance Report" > "$report_file"
    echo "Generated: $(date)" >> "$report_file"
    echo "===========================================" >> "$report_file"
    echo "" >> "$report_file"
    
    # Current status
    local current_metrics=$(get_performance_metrics)
    IFS=',' read -r timestamp cpu memory disk net_rx net_tx <<< "$current_metrics"
    
    echo "CURRENT STATUS:" >> "$report_file"
    echo "CPU Usage: $cpu%" >> "$report_file"
    echo "Memory Usage: $memory%" >> "$report_file"
    echo "Disk I/O: $disk operations" >> "$report_file"
    echo "Network RX: $((net_rx / 1024 / 1024)) MB" >> "$report_file"
    echo "Network TX: $((net_tx / 1024 / 1024)) MB" >> "$report_file"
    echo "" >> "$report_file"
    
    # Historical data
    if [ -f "$PERF_LOG" ]; then
        echo "HISTORICAL DATA (Last 20 entries):" >> "$report_file"
        echo "Timestamp,CPU%,Memory%,Disk I/O,Net RX,Net TX" >> "$report_file"
        tail -n 20 "$PERF_LOG" | grep -v "^#" >> "$report_file"
        echo "" >> "$report_file"
    fi
    
    # System info
    echo "SYSTEM INFORMATION:" >> "$report_file"
    echo "Kernel: $(uname -r)" >> "$report_file"
    echo "Architecture: $(uname -m)" >> "$report_file"
    if [ -f /proc/cpuinfo ]; then
        echo "CPU: $(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | sed 's/^[ \t]*//')" >> "$report_file"
    fi
    if [ -f /proc/meminfo ]; then
        echo "Total Memory: $(grep "MemTotal" /proc/meminfo | awk '{print $2 " " $3}')" >> "$report_file"
    fi
    
    echo -e "${green}Report saved to: $report_file${reset}"
    sleep 2
}

# Main performance monitor loop
main_performance_monitor() {
    init_performance_tracking
    
    while true; do
        show_performance_dashboard
        
        echo -e "${cyan}┌─ OPTIONS ───────────────────────────────────┐${reset}"
        echo -e "${cyan}│ [r] Refresh  [l] Log Data  [o] Tips         │${reset}"
        echo -e "${cyan}│ [s] Save Report  [q] Quit                   │${reset}"
        echo -e "${cyan}└─────────────────────────────────────────────┘${reset}"
        echo ""
        
        read -n 1 -s -t 5 key
        
        case $key in
            'r'|'R')
                continue
                ;;
            'l'|'L')
                log_performance
                echo -e "${green}Performance data logged!${reset}"
                sleep 1
                ;;
            'o'|'O')
                show_optimization_tips
                ;;
            's'|'S')
                generate_performance_report
                ;;
            'q'|'Q')
                echo -e "${yellow}Exiting performance monitor...${reset}"
                return
                ;;
            *)
                # Auto-refresh and log after 5 seconds
                log_performance
                continue
                ;;
        esac
    done
}

# Start performance monitor
main_performance_monitor