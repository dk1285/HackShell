#!/bin/bash

# HackShell Theme Creation Wizard
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
    echo -e "${cyan}║              THEME CREATION WIZARD            ║${reset}"
    echo -e "${cyan}╚══════════════════════════════════════════════╝${reset}"
    echo -e "${green}Create your own custom HackShell theme!${reset}"
    echo ""
}

# Input validation
validate_name() {
    local name="$1"
    
    # Check if name is empty
    if [ -z "$name" ]; then
        return 1
    fi
    
    # Check if name contains only allowed characters
    if [[ ! "$name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        return 1
    fi
    
    # Check if theme already exists
    if [ -f "$HOME/HackShell/themes/${name}.bashrc" ]; then
        return 2
    fi
    
    return 0
}

# Color picker
pick_color() {
    local color_name="$1"
    
    echo -e "${yellow}Select $color_name color:${reset}"
    echo -e "${green}[1]${reset} Green"
    echo -e "${red}[2]${reset} Red"
    echo -e "${blue}[3]${reset} Blue"
    echo -e "${cyan}[4]${reset} Cyan"
    echo -e "${purple}[5]${reset} Purple"
    echo -e "${yellow}[6]${reset} Yellow"
    echo -e "${white}[7]${reset} White"
    echo -e "${cyan}[8]${reset} Custom RGB"
    echo ""
    
    while true; do
        read -p "Choose color (1-8): " choice
        
        case $choice in
            1) echo '\033[1;92m'; return 0 ;;
            2) echo '\033[1;91m'; return 0 ;;
            3) echo '\033[1;94m'; return 0 ;;
            4) echo '\033[1;96m'; return 0 ;;
            5) echo '\033[1;95m'; return 0 ;;
            6) echo '\033[1;93m'; return 0 ;;
            7) echo '\033[1;97m'; return 0 ;;
            8) 
                echo -e "${yellow}Enter RGB values (0-255):${reset}"
                read -p "Red: " r
                read -p "Green: " g
                read -p "Blue: " b
                
                if [[ "$r" =~ ^[0-9]+$ ]] && [[ "$g" =~ ^[0-9]+$ ]] && [[ "$b" =~ ^[0-9]+$ ]] && \
                   [ "$r" -le 255 ] && [ "$g" -le 255 ] && [ "$b" -le 255 ]; then
                    echo "\033[38;2;${r};${g};${b}m"
                    return 0
                else
                    echo -e "${red}Invalid RGB values!${reset}"
                fi
                ;;
            *)
                echo -e "${red}Invalid choice! Please enter 1-8.${reset}"
                ;;
        esac
    done
}

# Create theme
create_theme() {
    display_header
    
    # Get theme name
    while true; do
        read -p "Enter theme name (alphanumeric, _, - only): " theme_name
        
        case $(validate_name "$theme_name") in
            0)
                break
                ;;
            1)
                echo -e "${red}Invalid name! Use only letters, numbers, underscore, and dash.${reset}"
                ;;
            2)
                echo -e "${red}Theme '$theme_name' already exists!${reset}"
                ;;
        esac
    done
    
    # Get theme metadata
    read -p "Enter theme display name: " display_name
    read -p "Enter your name (author): " author_name
    read -p "Enter theme description: " description
    
    # Pick colors
    echo ""
    echo -e "${cyan}Now let's choose colors for your theme:${reset}"
    echo ""
    
    echo -e "${yellow}Primary color (main text):${reset}"
    primary_color=$(pick_color "primary")
    
    echo -e "${yellow}Secondary color (accents):${reset}"
    secondary_color=$(pick_color "secondary")
    
    echo -e "${yellow}Highlight color (important text):${reset}"
    highlight_color=$(pick_color "highlight")
    
    echo -e "${yellow}Prompt color (command prompt):${reset}"
    prompt_color=$(pick_color "prompt")
    
    # Choose banner style
    echo ""
    echo -e "${yellow}Choose banner style:${reset}"
    echo -e "${cyan}[1]${reset} Figlet text"
    echo -e "${cyan}[2]${reset} Simple text"
    echo -e "${cyan}[3]${reset} Box style"
    echo -e "${cyan}[4]${reset} Custom ASCII"
    echo ""
    
    while true; do
        read -p "Select banner style (1-4): " banner_choice
        case $banner_choice in
            1) banner_style="figlet"; break ;;
            2) banner_style="simple"; break ;;
            3) banner_style="box"; break ;;
            4) banner_style="custom"; break ;;
            *) echo -e "${red}Invalid choice!${reset}" ;;
        esac
    done
    
    # Create theme file
    local theme_file="$HOME/HackShell/themes/${theme_name}.bashrc"
    
    cat > "$theme_file" << EOF
#!/bin/bash

# HackShell Custom Theme - $display_name
# Created by $author_name using HackShell Theme Wizard

# Theme metadata
THEME_NAME="$display_name"
THEME_AUTHOR="$author_name"
THEME_VERSION="1.0"
THEME_DESCRIPTION="$description"

# Configuration variables
SHOW_SYSINFO=true
CUSTOM_NAME=""
BANNER_STYLE="$banner_style"
WELCOME_SOUND=true

# Custom color palette
primary='$primary_color'
secondary='$secondary_color'
highlight='$highlight_color'
prompt_color='$prompt_color'
white='\033[1;97m'
reset='\033[0m'

# Custom prompt
PS1='\[\$secondary\]┌─[\[\$white\]\T\[\$secondary\]]─────\[\$highlight\][$display_name]\[\$secondary\]'

# Add battery status
if [ -e "/sys/class/power_supply/battery/capacity" ]; then
  BATT_CAPACITY=\$(cat /sys/class/power_supply/battery/capacity)
  PS1+='\[\$secondary\]──[\[\$primary\]🔋'\$BATT_CAPACITY'%\[\$secondary\]]'
fi

PS1+='\[\$secondary\]\n|\n\[\$secondary\]└─[\[\$prompt_color\]\w\[\$secondary\]]────►\[\$primary\] '

# Clear screen
clear

# Play welcome sound if enabled
if [ "\$WELCOME_SOUND" = "true" ]; then
  mpv "\$HOME/HackShell/welcome.mp3" >/dev/null 2>&1 &
fi

clear

# Show greeting
if [ -n "\$CUSTOM_NAME" ]; then
  echo -e "\${highlight}Welcome back, \${primary}\$CUSTOM_NAME\${reset}"
  echo "-----------------------------------" | lolcat
else
  echo -e "Theme: \${highlight}$display_name\${reset} by \${secondary}$author_name\${reset}"
  echo "-----------------------------------" | lolcat
fi

# Banner display
show_banner() {
  case "\$BANNER_STYLE" in
    "figlet")
      echo -e "\${primary}"
      figlet "$display_name" | lolcat
      ;;
    "simple")
      echo -e "\${highlight}=== $display_name ===\${reset}"
      ;;
    "box")
      echo -e "\${secondary}╔═══════════════════════════════════╗"
      echo -e "║           \${highlight}$display_name\${secondary}           ║"
      echo -e "╚═══════════════════════════════════╝\${reset}"
      ;;
    "custom")
      echo -e "\${primary}$display_name\${reset}"
      ;;
    *)
      figlet "HackShell" | lolcat
      ;;
  esac
}

show_banner

# System information
if [ "\$SHOW_SYSINFO" = "true" ]; then
  echo ""
  echo -e "\${secondary}╭─ SYSTEM INFO ────────────────╮\${reset}"
  
  # Memory
  if [ -f /proc/meminfo ]; then
    MEMORY=\$(free -h | grep Mem | awk '{print \$3 "/" \$2}')
    echo -e "\${primary}│ Memory: \${white}\$MEMORY\${reset}"
  fi
  
  # Storage
  STORAGE=\$(df -h "\$HOME" | tail -1 | awk '{print \$3 "/" \$2}')
  echo -e "\${primary}│ Storage: \${white}\$STORAGE\${reset}"
  
  # Time
  echo -e "\${primary}│ Time: \${white}\$(date '+%H:%M:%S')\${reset}"
  
  echo -e "\${secondary}╰───────────────────────────────╯\${reset}"
  echo ""
fi

# Welcome message
echo -e "\${highlight}Welcome to your custom \${primary}$display_name\${highlight} theme!\${reset}"
echo -e "\${white}Type \${primary}'bash config.sh'\${white} to configure HackShell\${reset}"
echo ""
EOF

    chmod +x "$theme_file"
    
    echo ""
    echo -e "${green}✓ Theme '$display_name' created successfully!${reset}"
    echo -e "${cyan}File saved as: $theme_file${reset}"
    echo ""
    echo -e "${yellow}Would you like to preview your theme? (y/n)${reset}"
    read -p "> " preview_choice
    
    if [[ "$preview_choice" = "y" || "$preview_choice" = "Y" ]]; then
        echo -e "${cyan}Previewing theme...${reset}"
        sleep 1
        bash "$theme_file"
        echo ""
        echo -e "${yellow}Press Enter to continue...${reset}"
        read
    fi
    
    echo -e "${green}Theme creation completed!${reset}"
    echo -e "${cyan}You can now select '$display_name' from the theme menu.${reset}"
    sleep 3
}

# Main wizard
main() {
    while true; do
        display_header
        
        echo -e "${cyan}[1]${reset} Create New Theme"
        echo -e "${cyan}[2]${reset} Exit Wizard"
        echo ""
        
        read -p "Select an option: " choice
        
        case $choice in
            1)
                create_theme
                ;;
            2)
                echo -e "${yellow}Exiting theme wizard...${reset}"
                exit 0
                ;;
            *)
                echo -e "${red}Invalid option!${reset}"
                sleep 1
                ;;
        esac
    done
}

# Start the wizard
main