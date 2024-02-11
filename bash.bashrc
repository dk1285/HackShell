PS1='\[\e[31m\]┌─[\[\e[37m\]\T\[\e[31m\]]─────\[\e[1;93m\][HackShell]\[\e[31m\]\n|\n\[\e[31m\]└─[\[\e[31m\]\[\e[0;35m\]\w\[\e[31m\]]────►\[\e[1;32m\]'
clear
mpv /$HOME/HackShell/welcome.mp3
clear
echo -e "Created By \e[5mTeam ILLUSION || DK"
echo "-----------------------------------" | lolcat

echo "

██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██╗  ██╗███████╗██╗     ██╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██║  ██║██╔════╝██║     ██║ 
███████║███████║██║     █████╔╝ ███████╗███████║█████╗  ██║     ██║ 
██╔══██║██╔══██║██║     ██╔═██╗ ╚════██║██╔══██║██╔══╝  ██║     ██║ 
██║  ██║██║  ██║╚██████╗██║  ██╗███████║██║  ██║███████╗███████╗███████╗ 
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ 
" | lolcat
figlet 1 . 0 | lolcat

if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi