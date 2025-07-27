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
        echo -e "${cyan}[8]${reset} Set as Default Shell"
        echo -e "${cyan}[9]${reset} Android Tweaks"
        echo -e "${cyan}[10]${reset} Save & Apply"
        echo -e "${cyan}[11]${reset} Save & Exit"
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
            8) set_default_shell ;;
            9) android_tweaks ;;
            10) 
                save_config
                apply_changes
                ;;
            11)
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
        
        # Copy the tools script from the sample directory if available
        if [ -f "$HOME/HackShell/samples/hacktools.sh" ]; then
            cp "$HOME/HackShell/samples/hacktools.sh" "$HOME/HackShell/tools/hacktools.sh"
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

# Set HackShell as default shell
set_default_shell() {
    display_header
    echo -e "${yellow}Set HackShell as Default Shell${reset}"
    echo ""
    
    # Check if Termux is being used
    if [ ! -d "/data/data/com.termux" ]; then
        echo -e "${red}This feature only works on Termux.${reset}"
        echo -e "${yellow}HackShell is designed for Android Termux environment.${reset}"
        sleep 3
        return
    fi
    
    echo -e "${cyan}This will set HackShell to launch automatically whenever you open Termux.${reset}"
    echo -e "${yellow}Do you want to continue? (y/n)${reset}"
    read -p "> " confirm
    
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo -e "${yellow}Operation cancelled.${reset}"
        sleep 2
        return
    fi
    
    # Backup existing .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        cp "$HOME/.bashrc" "$HOME/.bashrc.hackshell.bak"
        echo -e "${green}Existing .bashrc backed up to $HOME/.bashrc.hackshell.bak${reset}"
    fi
    
    # Create or modify .bashrc to launch HackShell
    cat > "$HOME/.bashrc" << 'EOF'
#!/bin/bash

# This file was modified by HackShell Installer

# Launch HackShell
if [ -d "$HOME/HackShell" ]; then
    cd "$HOME/HackShell"
    bash start.sh
else
    echo "HackShell not found in $HOME/HackShell"
    echo "Please reinstall HackShell"
fi
EOF
    
    chmod +x "$HOME/.bashrc"
    
    # Create script to restore original shell if needed
    cat > "$HOME/HackShell/restore_shell.sh" << 'EOF'
#!/bin/bash

# Colors
green='\033[1;92m'
yellow='\033[1;93m'
red='\033[1;91m'
reset='\033[0m'

echo -e "${yellow}HackShell - Restore Original Shell${reset}"
echo ""

if [ -f "$HOME/.bashrc.hackshell.bak" ]; then
    cp "$HOME/.bashrc.hackshell.bak" "$HOME/.bashrc"
    echo -e "${green}Original shell restored!${reset}"
else
    # If no backup exists, create a minimal .bashrc
    cat > "$HOME/.bashrc" << 'END'
#!/bin/bash
# Default .bashrc file
END
    echo -e "${yellow}No backup found. Created a minimal .bashrc file.${reset}"
fi

echo -e "${yellow}Please restart Termux to apply changes.${reset}"
EOF
    
    chmod +x "$HOME/HackShell/restore_shell.sh"
    
    echo -e "${green}HackShell has been set as your default shell!${reset}"
    echo -e "${yellow}To restore your original shell, run:${reset}"
    echo -e "${cyan}bash $HOME/HackShell/restore_shell.sh${reset}"
    echo ""
    echo -e "${yellow}Please restart Termux to apply changes.${reset}"
    sleep 3
}

# Android Tweaks
android_tweaks() {
    display_header
    echo -e "${yellow}Android Tweaks${reset}"
    echo ""
    
    # Check if Termux is being used
    if [ ! -d "/data/data/com.termux" ]; then
        echo -e "${red}This feature only works on Termux.${reset}"
        echo -e "${yellow}HackShell is designed for Android Termux environment.${reset}"
        sleep 3
        return
    fi
    
    # Check for termux-api package
    if ! command -v termux-toast &> /dev/null; then
        echo -e "${yellow}Termux API not found. Installing...${reset}"
        pkg install -y termux-api
        echo ""
    fi
    
    while true; do
        display_header
        echo -e "${yellow}Android Tweaks Menu${reset}"
        echo ""
        echo -e "${cyan}[1]${reset} Setup Extra Keys Row"
        echo -e "${cyan}[2]${reset} Configure Termux Permissions"
        echo -e "${cyan}[3]${reset} Install Essential Android Tools"
        echo -e "${cyan}[4]${reset} Setup Quick Toggles"
        echo -e "${cyan}[5]${reset} Back to Main Menu"
        echo ""
        read -p "Select an option: " choice
        
        case $choice in
            1) setup_extra_keys ;;
            2) configure_permissions ;;
            3) install_android_tools ;;
            4) setup_quick_toggles ;;
            5) return ;;
            *) 
                echo -e "${red}Invalid option!${reset}"
                sleep 1
                ;;
        esac
    done
}

# Setup Extra Keys Row for Termux
setup_extra_keys() {
    display_header
    echo -e "${yellow}Setup Extra Keys Row${reset}"
    echo ""
    
    # Create the directory if it doesn't exist
    mkdir -p $HOME/.termux
    
    echo -e "${cyan}Select keyboard layout:${reset}"
    echo -e "${cyan}[1]${reset} Hacker Layout (ESC, TAB, CTRL, ALT, -, /, HOME, END, UP, DOWN, LEFT, RIGHT)"
    echo -e "${cyan}[2]${reset} Coder Layout (ESC, TAB, CTRL, ALT, {, }, [, ], <, >, $, |)"
    echo -e "${cyan}[3]${reset} Full Layout (Multiple rows with all special keys)"
    echo -e "${cyan}[4]${reset} Custom Layout (Create your own)"
    echo -e "${cyan}[5]${reset} Cancel"
    echo ""
    read -p "Select an option: " kb_choice
    
    case $kb_choice in
        1)
            cat > $HOME/.termux/termux.properties << 'EOF'
# HackShell Extra Keys Configuration - Hacker Layout
extra-keys = [['ESC','TAB','CTRL','ALT','-','/','HOME','END','UP','DOWN','LEFT','RIGHT']]
EOF
            ;;
        2)
            cat > $HOME/.termux/termux.properties << 'EOF'
# HackShell Extra Keys Configuration - Coder Layout
extra-keys = [['ESC','TAB','CTRL','ALT','{','}','[',']','<','>','$','|']]
EOF
            ;;
        3)
            cat > $HOME/.termux/termux.properties << 'EOF'
# HackShell Extra Keys Configuration - Full Layout
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
extra-keys-style = arrows-only
EOF
            ;;
        4)
            echo -e "${cyan}Creating custom keyboard layout:${reset}"
            echo -e "${yellow}Enter keys for your extra keys row (space-separated):${reset}"
            echo -e "${green}Available keys: ESC, TAB, CTRL, ALT, UP, DOWN, LEFT, RIGHT, HOME, END, PGUP, PGDN${reset}"
            echo -e "${green}You can also use symbols directly: -, /, |, \, {, }, [, ], <, >, $, etc.${reset}"
            read -p "> " custom_keys
            
            # Format the input as an array
            formatted_keys="['"
            formatted_keys+=$(echo $custom_keys | sed 's/ /\',\'/g')
            formatted_keys+="']"
            
            cat > $HOME/.termux/termux.properties << EOF
# HackShell Extra Keys Configuration - Custom Layout
extra-keys = [$formatted_keys]
EOF
            ;;
        5)
            echo -e "${yellow}Operation cancelled.${reset}"
            sleep 2
            return
            ;;
        *)
            echo -e "${red}Invalid option!${reset}"
            sleep 2
            return
            ;;
    esac
    
    echo -e "${green}Extra keys configured successfully!${reset}"
    echo -e "${yellow}Restart Termux to apply changes.${reset}"
    sleep 3
}

# Configure Termux Permissions
configure_permissions() {
    display_header
    echo -e "${yellow}Configure Termux Permissions${reset}"
    echo ""
    
    if ! command -v termux-setup-storage &> /dev/null; then
        echo -e "${red}Termux API not installed.${reset}"
        echo -e "${yellow}Installing Termux API...${reset}"
        pkg install -y termux-api
    fi
    
    echo -e "${cyan}Select permissions to configure:${reset}"
    echo -e "${cyan}[1]${reset} Setup Storage Access"
    echo -e "${cyan}[2]${reset} Configure Camera Access"
    echo -e "${cyan}[3]${reset} Configure Microphone Access"
    echo -e "${cyan}[4]${reset} Configure SMS Access"
    echo -e "${cyan}[5]${reset} Configure Contact Access"
    echo -e "${cyan}[6]${reset} Configure Location Access"
    echo -e "${cyan}[7]${reset} Back"
    echo ""
    read -p "Select an option: " perm_choice
    
    case $perm_choice in
        1)
            echo -e "${yellow}Setting up storage access...${reset}"
            termux-setup-storage
            ;;
        2)
            echo -e "${yellow}Checking camera access...${reset}"
            termux-camera-info
            sleep 3
            ;;
        3)
            echo -e "${yellow}Testing microphone access...${reset}"
            echo -e "${cyan}This will record a 3-second audio clip.${reset}"
            read -p "Press Enter to continue or Ctrl+C to cancel..."
            termux-microphone-record -d 3 -f $HOME/test_recording.mp3
            echo -e "${green}Recording saved to $HOME/test_recording.mp3${reset}"
            sleep 2
            ;;
        4)
            echo -e "${yellow}Testing SMS access...${reset}"
            termux-sms-list -l 1
            sleep 3
            ;;
        5)
            echo -e "${yellow}Testing contacts access...${reset}"
            termux-contact-list
            sleep 3
            ;;
        6)
            echo -e "${yellow}Testing location access...${reset}"
            termux-location
            sleep 3
            ;;
        7)
            return
            ;;
        *)
            echo -e "${red}Invalid option!${reset}"
            sleep 1
            ;;
    esac
    
    echo -e "${green}Done!${reset}"
    sleep 2
}

# Install Essential Android Tools
install_android_tools() {
    echo "test"
}
