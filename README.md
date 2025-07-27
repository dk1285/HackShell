<div align="center">

# 🔮 HackShell v1.2 Enhanced

[![Version](https://img.shields.io/badge/Version-1.2%20Enhanced-blue?style=for-the-badge&logo=github)](https://github.com/dk1285/HackShell)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Stars](https://img.shields.io/github/stars/dk1285/HackShell?style=for-the-badge&color=yellow)](https://github.com/dk1285/HackShell/stargazers)
[![Issues](https://img.shields.io/github/issues/dk1285/HackShell?style=for-the-badge&color=red)](https://github.com/dk1285/HackShell/issues)

**Transform your Termux into a visually stunning, feature-rich terminal environment with enhanced themes, real-time monitoring, and advanced customization**

<img src="https://profile-counter.glitch.me/dk1285/count.svg" alt="Visitors">

</div>

---

## 📋 Table of Contents

- [✨ Overview](#-overview)
- [🚀 Features](#-features)
- [🎨 Available Themes](#-available-themes)
- [⚙️ Installation](#️-installation)
- [🔧 Configuration](#-configuration)
- [🧰 Utility Tools](#-utility-tools)
- [🗑️ Uninstallation](#️-uninstallation)
- [👨‍💻 Connect with Developer](#-connect-with-developer)
- [❤️ Support the Project](#️-support-the-project)

---

## ✨ Overview

HackShell transforms your Android Termux environment into an advanced terminal interface with a responsive design, themed visual elements, and system monitoring capabilities. Inspired by sci-fi interfaces like Jarvis from Iron Man, HackShell delivers both aesthetics and functionality to enhance your Termux experience.

---

## 🚀 Features

### Core Features

- **🎭 Extensive Theme Collection** - 6 unique themes with custom color schemes and visual elements (including new Neon City theme)
- **🎨 Interactive Theme Preview** - Live preview system with arrow key navigation
- **🛠️ Theme Creation Wizard** - Create your own custom themes with guided wizard
- **📊 Advanced System Monitoring** - Real-time system dashboard with CPU, memory, battery, and network stats
- **⚡ Performance Monitor** - Track system performance over time with optimization tips
- **👤 Personalization** - Custom greeting messages and prompts tailored to your preferences
- **🔄 Auto-Update System** - One-click updates with backup and restore functionality
- **💾 Backup & Restore** - Protect your configurations with automated backup system
- **⚡ Performance** - Optimized for Android devices with minimal resource usage

### Enhanced Functionality

- **🧩 Enhanced Theme Manager** - Create, import, export, and preview custom themes
- **🔍 Advanced Utility Tools** - Network diagnostics, system monitoring, performance tracking, and maintenance tools
- **🔋 Smart Battery Monitoring** - Status indicator in prompt with color-coded warnings and detailed stats
- **🖥️ Multiple Banner Styles** - Choose from various ASCII art banners with custom options
- **🔐 Enhanced Security** - Input validation, sanitization, and secure file handling
- **📈 Performance Analytics** - Track and analyze system performance with historical data
- **🎯 Progress Indicators** - Visual feedback for all operations
- **⚠️ Error Handling** - Robust error handling with helpful error messages

### New in Enhanced Version

- **🎮 Interactive Theme Preview** - Navigate themes with keyboard controls and live demonstrations
- **🎨 Theme Creation Wizard** - Step-by-step guided theme creation with color picker
- **📊 Real-time System Dashboard** - Live monitoring of system resources
- **📈 Performance Monitoring** - Historical performance tracking with optimization suggestions
- **🔄 Git-based Auto-Updates** - Smart update system with conflict resolution
- **💾 Configuration Backup** - Automated backup and restore for user configurations
- **🛡️ Security Enhancements** - Input sanitization and validation to prevent command injection
- **⚡ Progress Feedback** - Visual progress indicators for better user experience

---

## 🎨 Available Themes

HackShell offers a diverse collection of professionally designed themes:

### 🏆 Premium Themes

| Theme | Description | Style |
|-------|-------------|-------|
| **Cybersecurity Pro** | Professional blue & gray theme for security researchers | Modern, Clean |
| **Minimalist Pro** | Clean, distraction-free interface with subtle accents | Minimalist |
| **Neon City Pro** | Vibrant cyberpunk aesthetics with electric neon colors | Futuristic |

### 🌟 Featured Themes

| Theme | Description | Style |
|-------|-------------|-------|
| **Neon City** | 🆕 Electric cyberpunk with vibrant neon colors and animations | Dynamic |
| **Hacker** | Classic green-on-black hacker aesthetic | Traditional |
| **Matrix** | Digital rain effect with green variations | Iconic |
| **Cyberpunk** | Neon colors with futuristic elements | Edgy |
| **Midnight** | Deep blues with professional appearance | Sleek |
| **Blood** | Dark reds and blacks for dramatic effect | Intense |

### 🌍 Nature & Environment

| Theme | Description | Style |
|-------|-------------|-------|
| **Jungle Adventure** | Lush greens and earth tones with leaf symbols | Organic |
| **Ocean Depths** | Deep blues with underwater-inspired elements | Serene |
| **Dark Forest** | Mysterious forest aesthetics with tree symbols | Mystical |
| **Desert Dunes** | Warm sand tones with desert-inspired symbols | Warm |
| **Arctic Frost** | Icy blues and whites with snowflake elements | Cool |

### 🎮 Gaming & Entertainment

| Theme | Description | Style |
|-------|-------------|-------|
| **Retro Arcade** | Nostalgic pixel art aesthetics with game symbols | Playful |
| **Matrix** | Classic green digital rain effect | Digital |
| **Vampire Castle** | Gothic aesthetics with dark reds and blacks | Dramatic |

### 🔮 Fantasy & Sci-Fi

| Theme | Description | Style |
|-------|-------------|-------|
| **Fire Dragon** | Fiery reds and oranges with dragon symbols | Dynamic |
| **Deep Space** | Cosmic purples and blues with star symbols | Expansive |
| **Electric Circuit** | Circuit board aesthetics with electric symbols | Technical |
| **Cosmic Explorer** | Space exploration theme with cosmic elements | Adventurous |
| **Quantum Realm** | Subatomic particle visuals with quantum symbols | Abstract |

### 🏙️ Urban & Industrial

| Theme | Description | Style |
|-------|-------------|-------|
| **Industrial Tech** | Rugged mechanical aesthetics with gear symbols | Rugged |
| **Tokyo Night** | Japanese cyberpunk with neon city elements | Atmospheric |
| **Cyberpunk** | Classic cyberpunk with digital elements | Edgy |

---

## ⚙️ Installation

### Prerequisites

- Android device with [Termux](https://f-droid.org/en/packages/com.termux/) installed
- Internet connection for initial setup

### Standard Installation

```bash
pkg update -y && pkg upgrade -y
pkg install git python mpv figlet -y
pip install lolcat
git clone https://github.com/dk1285/HackShell
cd HackShell
chmod +x *
sh install.sh
```

### One-Line Quick Installation

```bash
pkg update -y && pkg upgrade -y && pkg install git mpv figlet python -y && pip install lolcat && git clone https://github.com/dk1285/HackShell && cd HackShell && chmod +x * && sh install.sh
```

---

## 🔧 Configuration

HackShell features an enhanced interactive configuration menu to customize your experience:

```bash
cd HackShell
bash config.sh
```

The enhanced configuration menu allows you to:

### 🎨 Theme Management
- **Switch between themes** with instant preview
- **Interactive theme preview** with live demonstrations
- **Create custom themes** using the built-in wizard
- **Manage theme marketplace** for community themes

### ⚙️ System Settings
- **Toggle system information display** with detailed stats
- **Set custom greeting name** with input validation
- **Change banner styles** from multiple options
- **Toggle welcome sounds** and audio feedback

### 🛠️ Advanced Features
- **Auto-update system** with Git integration
- **Backup and restore** configurations
- **Performance monitoring** and optimization
- **Android-specific tweaks** and permissions

### 🔧 Utility Tools
- **Network Tools**: Speed test, IP info, port scanner
- **System Monitor**: Hardware and software diagnostics with real-time stats
- **Performance Monitor**: Track system performance over time
- **Package Manager**: GUI interface for package management
- **File Manager**: Common file operations with visual interface
- **Security Tools**: Basic security scanning and auditing

Access tools via the configuration menu or directly:

```bash
cd HackShell/tools
bash hacktools.sh
```

### 🎯 New Features
- **Input validation** prevents errors and security issues
- **Progress indicators** provide visual feedback
- **Error handling** with helpful messages
- **Backup system** protects your configurations
- **Theme wizard** for creating custom themes

---

## 🗑️ Uninstallation

To remove HackShell completely:

```bash
cd HackShell
bash rvt.sh
```

---

## 👨‍💻 Connect with Developer

[![Instagram](https://img.shields.io/badge/Instagram-DK-pink?style=for-the-badge&logo=instagram)](https://instagram.com/dk.gz)
[![Telegram](https://img.shields.io/badge/TELEGRAM-DK-blue?style=for-the-badge&logo=telegram)](https://t.me/cyber_dk)

🚧 **Developer Stats:**
<!-- TODO-IST:START -->
🏆  8,209 Karma Points<br>
🌸  Completed 45 Tasks Today<br>
✅  Completed 548 Tasks So Far<br>
⏳   Longest Streak Is 16 Days<br>
<!-- TODO-IST:END -->

---

## ❤️ Support the Project

If HackShell has enhanced your Termux experience, consider supporting the project:

<a href="https://www.buymeacoffee.com/dk1285" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" width="150" ></a>

---

## 📋 Changelog

### v1.2 Enhanced (Latest)

**🔥 Major Improvements:**
- ✅ **Fixed Critical Bugs**: Resolved duplicate menus and syntax errors
- 🎨 **Interactive Theme Preview**: Live theme demonstrations with keyboard navigation
- 🛠️ **Theme Creation Wizard**: Step-by-step custom theme creation with color picker
- 📊 **Advanced System Monitor**: Real-time CPU, memory, battery, and network monitoring
- 📈 **Performance Tracker**: Historical performance data with optimization tips
- 🔄 **Auto-Update System**: Git-based updates with backup and rollback
- 💾 **Backup & Restore**: Protect configurations with automated backup system
- 🛡️ **Enhanced Security**: Input validation and sanitization
- ⚡ **Progress Indicators**: Visual feedback for all operations
- 🎯 **Better UX**: Improved error handling and user guidance

**🆕 New Features:**
- Interactive theme preview with arrow key navigation
- Custom theme creation wizard with RGB color picker
- Real-time system dashboard with live stats
- Performance monitoring with historical data
- One-click auto-update with conflict resolution
- Configuration backup and restore system
- Enhanced input validation and security
- Progress indicators for better feedback

**🐛 Bug Fixes:**
- Fixed duplicate menu options in configuration
- Resolved sed syntax error in keyboard layout setup
- Fixed unclosed quotes in interactive prompts
- Improved error handling throughout the system

### v1.1 (Previous)

**🎯 What's New in v1.1:**
- Multiple themes (hacker, matrix, cyberpunk, midnight, blood)
- System information display
- Custom user greeting
- Interactive configuration menu
- Battery status indicator
- New ASCII art banner options

---

<div align="center">
<p>Made with ❤️ by Team ILLUSION || DK</p>
<p>© 2025 HackShell v1.2 Enhanced - Team ILLUSION</p>
</div>
