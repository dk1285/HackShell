#!/bin/bash

# HackShell Configuration Script - v1.1
# Created by Team ILLUSION || DK

# Colors
green='\033[1;92m'
yellow='\033[1;93m'
red='\033[1;91m'
blue='\033[1;94m'
cyan='\033[1;96m'
white='\033[1;97m'
purple='\033[1;95m'
reset='\033[0m'

# Default config values
THEME="hacker"
SHOW_SYSINFO="true"
CUSTOM_NAME=""
BANNER_STYLE="default"
WELCOME_SOUND="true"

# Config file path
CONFIG_FILE="$HOME/HackShell/config.conf"

# Load configuration if exists
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
fi

# Save configuration
save_config() {
    echo "# HackShell Configuration" > "$CONFIG_FILE"
    echo "THEME=\"$THEME\"" >> "$CONFIG_FILE"
    echo "SHOW_SYSINFO=\"$SHOW_SYSINFO\"" >> "$CONFIG_FILE"
    echo "CUSTOM_NAME=\"$CUSTOM_NAME\"" >> "$CONFIG_FILE"
    echo "BANNER_STYLE=\"$BANNER_STYLE\"" >> "$CONFIG_FILE"
    echo "WELCOME_SOUND=\"$WELCOME_SOUND\"" >> "$CONFIG_FILE"
    echo -e "${green}Configuration saved!${reset}"
    sleep 1
}

# Display header
display_header() {
    clear
    echo -e "${yellow}===============================================${reset}"
    echo -e "${cyan}            HackShell v1.1 Config              ${reset}"
    echo -e "${yellow}===============================================${reset}"
    echo -e "${green}Created by Team ILLUSION || DK${reset}"
    echo ""
}

# Main menu
main_menu() {
    while true; do
        display_header
        echo -e "Current Configuration:"
        echo -e "${yellow}Theme:${reset} $THEME"
        echo -e "${yellow}System Info:${reset} $SHOW_SYSINFO"
        echo -e "${yellow}Custom Name:${reset} ${CUSTOM_NAME:-"Not set"}"
        echo -e "${yellow}Banner Style:${reset} $BANNER_STYLE"
        echo -e "${yellow}Welcome Sound:${reset} $WELCOME_SOUND"
        echo ""
        echo -e "${cyan}[1]${reset} Change Theme"
        echo -e "${cyan}[2]${reset} Theme Manager"
        echo -e "${cyan}[3]${reset} Toggle System Info Display"
        echo -e "${cyan}[4]${reset} Set Custom Greeting Name"
        echo -e "${cyan}[5]${reset} Change Banner Style"
        echo -e "${cyan}[6]${reset} Toggle Welcome Sound"
        echo -e "${cyan}[7]${reset} Utility Tools"
        echo -e "${cyan}[8]${reset} Save & Apply"
        echo -e "${cyan}[9]${reset} Save & Exit"
        echo ""
        read -p "Select an option: " choice
        
        case $choice in
            1) change_theme ;;
            2) manage_themes ;;
            3) toggle_sysinfo ;;
            4) set_custom_name ;;
            5) change_banner ;;
            6) toggle_sound ;;
            7) launch_tools ;;
            8) 
                save_config
                apply_changes
                ;;
            9)
                save_config
                echo -e "${green}Configuration saved. Please restart Termux to apply changes.${reset}"
                exit 0
                ;;
            *)
                echo -e "${red}Invalid option!${reset}"
                sleep 1
                ;;
        esac
    done
}

# Change theme
change_theme() {
    display_header
    echo -e "Available Themes:"
    
    # Get all theme files
    theme_files=("$HOME/HackShell/themes"/*.bashrc)
    
    # Built-in themes
    echo -e "${yellow}Built-in Themes:${reset}"
    echo -e "${cyan}[1]${reset} Hacker (Green & Black)"
    echo -e "${cyan}[2]${reset} Matrix (Green variations)"
    echo -e "${cyan}[3]${reset} Cyberpunk (Neon colors)"
    echo -e "${cyan}[4]${reset} Midnight (Blue & Black)"
    echo -e "${cyan}[5]${reset} Blood (Red & Black)"
    
    # Custom themes
    if [ ${#theme_files[@]} -gt 5 ]; then
        echo -e "\n${yellow}Custom Themes:${reset}"
        count=6
        for ((i=0; i<${#theme_files[@]}; i++)); do
            theme_file="${theme_files[$i]}"
            theme_basename=$(basename "$theme_file" .bashrc)
            
            # Skip built-in themes
            if [[ "$theme_basename" != "hacker" && "$theme_basename" != "matrix" && \
                 "$theme_basename" != "cyberpunk" && "$theme_basename" != "midnight" && \
                 "$theme_basename" != "blood" ]]; then
                
                # Get theme name from file if available
                theme_name=$(grep "^THEME_NAME=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
                theme_author=$(grep "^THEME_AUTHOR=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
                
                if [ -z "$theme_name" ]; then
                    theme_name="$theme_basename"
                fi
                
                if [ -z "$theme_author" ]; then
                    echo -e "${cyan}[$count]${reset} $theme_name"
                else
                    echo -e "${cyan}[$count]${reset} $theme_name (by $theme_author)"
                fi
                
                count=$((count+1))
            fi
        done
    fi
    
    echo ""
    read -p "Select a theme: " theme_choice
    
    # Built-in themes
    case $theme_choice in
        1) THEME="hacker" ;;
        2) THEME="matrix" ;;
        3) THEME="cyberpunk" ;;
        4) THEME="midnight" ;;
        5) THEME="blood" ;;
        *) 
            # Check for custom themes
            if [[ "$theme_choice" -ge 6 && "$theme_choice" -lt $count ]]; then
                custom_count=6
                for ((i=0; i<${#theme_files[@]}; i++)); do
                    theme_file="${theme_files[$i]}"
                    theme_basename=$(basename "$theme_file" .bashrc)
                    
                    # Skip built-in themes
                    if [[ "$theme_basename" != "hacker" && "$theme_basename" != "matrix" && \
                         "$theme_basename" != "cyberpunk" && "$theme_basename" != "midnight" && \
                         "$theme_basename" != "blood" ]]; then
                        
                        if [ $custom_count -eq $theme_choice ]; then
                            THEME="$theme_basename"
                            break
                        fi
                        
                        custom_count=$((custom_count+1))
                    fi
                done
            else
                echo -e "${red}Invalid option! Theme unchanged.${reset}"
                sleep 1
                return
            fi
            ;;
    esac
    
    echo -e "${green}Theme set to $THEME${reset}"
    sleep 1
}

# Manage themes
manage_themes() {
    if [ -f "$HOME/HackShell/themes/theme_manager.sh" ]; then
        bash "$HOME/HackShell/themes/theme_manager.sh"
    else
        echo -e "${red}Theme manager not found!${reset}"
        sleep 2
    fi
}

# Launch tools
launch_tools() {
    if [ -f "$HOME/HackShell/tools/hacktools.sh" ]; then
        bash "$HOME/HackShell/tools/hacktools.sh"
    else
        echo -e "${red}Utility tools not found!${reset}"
        echo -e "${yellow}Installing...${reset}"
        
        # Create tools directory if it doesn't exist
        if [ ! -d "$HOME/HackShell/tools" ]; then
            mkdir -p "$HOME/HackShell/tools"
        fi
        
        # Download or copy the tools script
        cp "$HOME/HackShell/tools/hacktools.sh" "$HOME/HackShell/tools/hacktools.sh" 2>/dev/null
        
        if [ -f "$HOME/HackShell/tools/hacktools.sh" ]; then
            chmod +x "$HOME/HackShell/tools/hacktools.sh"
            bash "$HOME/HackShell/tools/hacktools.sh"
        else
            echo -e "${red}Failed to install utility tools!${reset}"
            sleep 2
        fi
    fi
}

# Toggle system info
toggle_sysinfo() {
    if [ "$SHOW_SYSINFO" = "true" ]; then
        SHOW_SYSINFO="false"
        echo -e "${yellow}System information display disabled${reset}"
    else
        SHOW_SYSINFO="true"
        echo -e "${green}System information display enabled${reset}"
    fi
    sleep 1
}

# Set custom greeting name
set_custom_name() {
    display_header
    echo -e "Enter your name for custom greeting:"
    echo -e "(Leave empty to remove custom greeting)"
    echo ""
    read -p "> " custom_name
    CUSTOM_NAME="$custom_name"
    echo -e "${green}Custom name set!${reset}"
    sleep 1
}

# Change banner style
change_banner() {
    display_header
    echo -e "Available Banner Styles:"
    echo -e "${cyan}[1]${reset} Default HackShell"
    echo -e "${cyan}[2]${reset} Minimalist"
    echo -e "${cyan}[3]${reset} Cyberpunk"
    echo -e "${cyan}[4]${reset} Matrix"
    echo -e "${cyan}[5]${reset} Skull"
    echo ""
    read -p "Select a banner style: " banner_choice
    
    case $banner_choice in
        1) BANNER_STYLE="default" ;;
        2) BANNER_STYLE="minimal" ;;
        3) BANNER_STYLE="cyberpunk" ;;
        4) BANNER_STYLE="matrix" ;;
        5) BANNER_STYLE="skull" ;;
        *) 
            echo -e "${red}Invalid option! Banner unchanged.${reset}"
            sleep 1
            return
            ;;
    esac
    
    echo -e "${green}Banner style set to $BANNER_STYLE${reset}"
    sleep 1
}

# Toggle welcome sound
toggle_sound() {
    if [ "$WELCOME_SOUND" = "true" ]; then
        WELCOME_SOUND="false"
        echo -e "${yellow}Welcome sound disabled${reset}"
    else
        WELCOME_SOUND="true"
        echo -e "${green}Welcome sound enabled${reset}"
    fi
    sleep 1
}

# Apply changes
apply_changes() {
    echo -e "${green}Applying changes...${reset}"
    # This function would regenerate the bash.bashrc file based on current config
    generate_bashrc
    echo -e "${green}Changes applied! Please restart Termux to see the changes.${reset}"
    sleep 2
}

# Function to generate bash.bashrc based on current config
generate_bashrc() {
    # Copy the appropriate template based on theme
    cp "$HOME/HackShell/themes/$THEME.bashrc" "$PREFIX/etc/bash.bashrc"
    
    # Modify bash.bashrc based on other settings
    if [ "$SHOW_SYSINFO" = "false" ]; then
        sed -i 's/^SHOW_SYSINFO=.*/SHOW_SYSINFO=false/' "$PREFIX/etc/bash.bashrc"
    else
        sed -i 's/^SHOW_SYSINFO=.*/SHOW_SYSINFO=true/' "$PREFIX/etc/bash.bashrc"
    fi
    
    if [ -n "$CUSTOM_NAME" ]; then
        sed -i "s/^CUSTOM_NAME=.*/CUSTOM_NAME=\"$CUSTOM_NAME\"/" "$PREFIX/etc/bash.bashrc"
    else
        sed -i 's/^CUSTOM_NAME=.*/CUSTOM_NAME=""/' "$PREFIX/etc/bash.bashrc"
    fi
    
    sed -i "s/^BANNER_STYLE=.*/BANNER_STYLE=\"$BANNER_STYLE\"/" "$PREFIX/etc/bash.bashrc"
    
    if [ "$WELCOME_SOUND" = "false" ]; then
        sed -i 's/^WELCOME_SOUND=.*/WELCOME_SOUND=false/' "$PREFIX/etc/bash.bashrc"
    else
        sed -i 's/^WELCOME_SOUND=.*/WELCOME_SOUND=true/' "$PREFIX/etc/bash.bashrc"
    fi
}

# Run main menu
main_menu
