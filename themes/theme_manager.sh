#!/bin/bash

# HackShell v1.1 - Enhanced Theme Manager
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

# Paths
THEMES_DIR="$HOME/HackShell/themes"
MARKETPLACE_DIR="$THEMES_DIR/marketplace"
TEMP_DIR="$HOME/HackShell/temp"

# Create directories if they don't exist
mkdir -p "$MARKETPLACE_DIR"
mkdir -p "$TEMP_DIR"

# Display header
display_header() {
    clear
    echo -e "${cyan}===============================================${reset}"
    echo -e "${purple}            HackShell Theme Manager           ${reset}"
    echo -e "${cyan}===============================================${reset}"
    echo -e "${green}Created by Team ILLUSION || DK${reset}"
    echo ""
}

# Progress indicator
show_progress() {
    local message="$1"
    local duration="${2:-3}"
    
    echo -n -e "${yellow}$message${reset}"
    
    for ((i=0; i<duration; i++)); do
        sleep 1
        echo -n "."
    done
    
    echo -e " ${green}Done!${reset}"
}

# Get theme metadata
get_theme_info() {
    local theme_file="$1"
    
    if [ ! -f "$theme_file" ]; then
        return 1
    fi
    
    local name=$(grep "^THEME_NAME=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
    local author=$(grep "^THEME_AUTHOR=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
    local version=$(grep "^THEME_VERSION=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
    local description=$(grep "^THEME_DESCRIPTION=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
    
    echo "$name|$author|$version|$description"
}

# Main menu
main_menu() {
    while true; do
        display_header
        echo -e "${cyan}[1]${reset} Import Theme"
        echo -e "${cyan}[2]${reset} Export Theme"
        echo -e "${cyan}[3]${reset} Browse Marketplace"
        echo -e "${cyan}[4]${reset} Create New Theme"
        echo -e "${cyan}[5]${reset} Preview Theme"
        echo -e "${cyan}[6]${reset} Back to Config"
        echo ""
        read -p "Select an option: " choice
        
        case $choice in
            1) import_theme ;;
            2) export_theme ;;
            3) browse_marketplace ;;
            4) create_theme ;;
            5) preview_theme ;;
            6) 
                echo -e "${green}Returning to config menu...${reset}"
                return
                ;;
            *) 
                echo -e "${red}Invalid option!${reset}"
                sleep 1
                ;;
        esac
    done
}

# Import theme
import_theme() {
    display_header
    echo -e "${yellow}Import Theme${reset}"
    echo ""
    echo -e "${cyan}Enter the full path to the theme file (.bashrc):${reset}"
    read -p "> " theme_path
    
    if [ -z "$theme_path" ]; then
        echo -e "${red}Path cannot be empty!${reset}"
        sleep 2
        return
    fi
    
    if [ ! -f "$theme_path" ]; then
        echo -e "${red}File not found!${reset}"
        sleep 2
        return
    fi
    
    # Extract theme name from the file
    theme_name=$(grep "^THEME_NAME=" "$theme_path" | cut -d'"' -f2)
    
    if [ -z "$theme_name" ]; then
        echo -e "${yellow}Theme name not found in file. Please enter a name for this theme:${reset}"
        read -p "> " theme_name
    fi
    
    # Format theme name for filename
    filename=$(echo "$theme_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
    
    # Copy theme to themes directory
    cp "$theme_path" "$THEMES_DIR/${filename}.bashrc"
    
    echo -e "${green}Theme '$theme_name' imported successfully!${reset}"
    echo -e "${yellow}You can now select this theme in the config menu.${reset}"
    sleep 2
}

# Export theme
export_theme() {
    display_header
    echo -e "${yellow}Export Theme${reset}"
    echo ""
    
    # List available themes
    echo -e "${cyan}Available themes:${reset}"
    theme_files=("$THEMES_DIR"/*.bashrc)
    
    if [ ${#theme_files[@]} -eq 0 ]; then
        echo -e "${red}No themes found!${reset}"
        sleep 2
        return
    fi
    
    for ((i=0; i<${#theme_files[@]}; i++)); do
        theme_file="${theme_files[$i]}"
        theme_name=$(grep "^THEME_NAME=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
        
        if [ -z "$theme_name" ]; then
            theme_name=$(basename "$theme_file" .bashrc)
        fi
        
        echo -e "${cyan}[$((i+1))]${reset} $theme_name"
    done
    
    echo ""
    read -p "Select a theme to export: " theme_num
    
    if ! [[ "$theme_num" =~ ^[0-9]+$ ]] || [ "$theme_num" -lt 1 ] || [ "$theme_num" -gt ${#theme_files[@]} ]; then
        echo -e "${red}Invalid selection!${reset}"
        sleep 2
        return
    fi
    
    theme_file="${theme_files[$((theme_num-1))]}"
    theme_name=$(grep "^THEME_NAME=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
    
    if [ -z "$theme_name" ]; then
        theme_name=$(basename "$theme_file" .bashrc)
    fi
    
    echo -e "${yellow}Enter the export destination path:${reset}"
    read -p "> " export_path
    
    if [ -z "$export_path" ]; then
        export_path="$HOME/${theme_name}.bashrc"
    fi
    
    cp "$theme_file" "$export_path"
    
    echo -e "${green}Theme '$theme_name' exported to '$export_path' successfully!${reset}"
    sleep 2
}

# Browse marketplace
browse_marketplace() {
    display_header
    echo -e "${yellow}Theme Marketplace${reset}"
    echo ""
    
    # List available marketplace themes
    echo -e "${cyan}Available marketplace themes:${reset}"
    marketplace_files=("$MARKETPLACE_DIR"/*.bashrc)
    
    if [ ${#marketplace_files[@]} -eq 0 ] || [ ! -d "$MARKETPLACE_DIR" ]; then
        echo -e "${red}No marketplace themes found!${reset}"
        sleep 2
        return
    fi
    
    for ((i=0; i<${#marketplace_files[@]}; i++)); do
        marketplace_file="${marketplace_files[$i]}"
        theme_name=$(grep "^THEME_NAME=" "$marketplace_file" 2>/dev/null | cut -d'"' -f2)
        theme_author=$(grep "^THEME_AUTHOR=" "$marketplace_file" 2>/dev/null | cut -d'"' -f2)
        theme_desc=$(grep "^THEME_DESCRIPTION=" "$marketplace_file" 2>/dev/null | cut -d'"' -f2)
        
        if [ -z "$theme_name" ]; then
            theme_name=$(basename "$marketplace_file" .bashrc)
        fi
        
        echo -e "${cyan}[$((i+1))]${reset} $theme_name"
        if [ ! -z "$theme_author" ]; then
            echo -e "   Author: $theme_author"
        fi
        if [ ! -z "$theme_desc" ]; then
            echo -e "   Description: $theme_desc"
        fi
        echo ""
    done
    
    echo -e "${cyan}[0]${reset} Back"
    echo ""
    read -p "Select a theme to install: " theme_num
    
    if [ "$theme_num" -eq 0 ]; then
        return
    fi
    
    if ! [[ "$theme_num" =~ ^[0-9]+$ ]] || [ "$theme_num" -lt 1 ] || [ "$theme_num" -gt ${#marketplace_files[@]} ]; then
        echo -e "${red}Invalid selection!${reset}"
        sleep 2
        return
    fi
    
    marketplace_file="${marketplace_files[$((theme_num-1))]}"
    theme_name=$(grep "^THEME_NAME=" "$marketplace_file" 2>/dev/null | cut -d'"' -f2)
    
    if [ -z "$theme_name" ]; then
        theme_name=$(basename "$marketplace_file" .bashrc)
    fi
    
    # Format theme name for filename
    filename=$(echo "$theme_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
    
    # Copy theme to themes directory
    cp "$marketplace_file" "$THEMES_DIR/${filename}.bashrc"
    
    echo -e "${green}Theme '$theme_name' installed successfully!${reset}"
    echo -e "${yellow}You can now select this theme in the config menu.${reset}"
    sleep 2
}

# Create new theme
create_theme() {
    display_header
    echo -e "${yellow}Create New Theme${reset}"
    echo ""
    
    echo -e "${cyan}Enter the name for your new theme:${reset}"
    read -p "> " theme_name
    
    if [ -z "$theme_name" ]; then
        echo -e "${red}Theme name cannot be empty!${reset}"
        sleep 2
        return
    fi
    
    echo -e "${cyan}Enter your name (author):${reset}"
    read -p "> " theme_author
    
    if [ -z "$theme_author" ]; then
        theme_author="Anonymous"
    fi
    
    echo -e "${cyan}Enter a description for your theme:${reset}"
    read -p "> " theme_desc
    
    if [ -z "$theme_desc" ]; then
        theme_desc="A custom theme for HackShell"
    fi
    
    # Create theme from template
    if [ ! -f "$MARKETPLACE_DIR/theme_template.bashrc" ]; then
        echo -e "${red}Theme template not found!${reset}"
        sleep 2
        return
    fi
    
    # Format theme name for filename
    filename=$(echo "$theme_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
    
    # Copy template
    cp "$MARKETPLACE_DIR/theme_template.bashrc" "$THEMES_DIR/${filename}.bashrc"
    
    # Update theme info
    sed -i "s/^THEME_NAME=.*/THEME_NAME=\"$theme_name\"/" "$THEMES_DIR/${filename}.bashrc"
    sed -i "s/^THEME_AUTHOR=.*/THEME_AUTHOR=\"$theme_author\"/" "$THEMES_DIR/${filename}.bashrc"
    sed -i "s/^THEME_DESCRIPTION=.*/THEME_DESCRIPTION=\"$theme_desc\"/" "$THEMES_DIR/${filename}.bashrc"
    
    echo -e "${green}Theme '$theme_name' created successfully!${reset}"
    echo -e "${yellow}You can now edit this theme at:${reset}"
    echo -e "${cyan}$THEMES_DIR/${filename}.bashrc${reset}"
    echo -e "${yellow}You can select this theme in the config menu.${reset}"
    sleep 2
}

# Preview theme
preview_theme() {
    display_header
    echo -e "${yellow}Preview Theme${reset}"
    echo ""
    
    # List available themes
    echo -e "${cyan}Available themes:${reset}"
    theme_files=("$THEMES_DIR"/*.bashrc)
    
    if [ ${#theme_files[@]} -eq 0 ]; then
        echo -e "${red}No themes found!${reset}"
        sleep 2
        return
    fi
    
    for ((i=0; i<${#theme_files[@]}; i++)); do
        theme_file="${theme_files[$i]}"
        theme_name=$(grep "^THEME_NAME=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
        
        if [ -z "$theme_name" ]; then
            theme_name=$(basename "$theme_file" .bashrc)
        fi
        
        echo -e "${cyan}[$((i+1))]${reset} $theme_name"
    done
    
    echo ""
    read -p "Select a theme to preview: " theme_num
    
    if ! [[ "$theme_num" =~ ^[0-9]+$ ]] || [ "$theme_num" -lt 1 ] || [ "$theme_num" -gt ${#theme_files[@]} ]; then
        echo -e "${red}Invalid selection!${reset}"
        sleep 2
        return
    fi
    
    theme_file="${theme_files[$((theme_num-1))]}"
    theme_name=$(grep "^THEME_NAME=" "$theme_file" 2>/dev/null | cut -d'"' -f2)
    
    if [ -z "$theme_name" ]; then
        theme_name=$(basename "$theme_file" .bashrc)
    fi
    
    echo -e "${green}Previewing theme '$theme_name'...${reset}"
    echo -e "${yellow}Press Ctrl+C to exit preview${reset}"
    sleep 2
    
    # Create temporary directory if it doesn't exist
    if [ ! -d "$TEMP_DIR" ]; then
        mkdir -p "$TEMP_DIR"
    fi
    
    # Create temporary bashrc for preview
    cp "$theme_file" "$TEMP_DIR/preview.bashrc"
    
    # Launch a new shell with the theme
    TERM=xterm-256color bash --rcfile "$TEMP_DIR/preview.bashrc"
    
    # Clean up
    rm -f "$TEMP_DIR/preview.bashrc"
    
    echo -e "${green}Preview ended.${reset}"
    sleep 1
}

# Run main menu
main_menu
