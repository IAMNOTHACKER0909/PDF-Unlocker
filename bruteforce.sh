#!/bin/bash

# Colors
GREENN="\e[1;32m"
GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
RED="\e[1;31m"
CYANN="\e[1;36m"
RESET="\e[0m"
MAGENTA="\e[1;35m"
BRIGHT_PINK="\e[95m"
pkill -9 apt
pkill -9 dpkg
pkill -9 pkg
echo""
echo -e "\e[94m[*]\e[0m \e[92mUpdating Termux.....\e[0m"
echo ""

pkg update -y && pkg upgrade -y

# Check if qpdf is already installed
if dpkg -s qpdf &>/dev/null; then
    echo -e "\e[94m[*]\e[0m \e[92mqpdf is already installed.\e[0m"
else
    echo -e "\e[94m[*]\e[0m \e[92mInstalling qpdf......\e[0m"
    pkg install qpdf -y
fi
sleep 1
clear
spin2() {
echo -e "${GREENN}"
echo '                       /$$$$$$$  /$$$$$$$  /$$$$$$$$                       '
echo '                      | $$__  $$| $$__  $$| $$_____/                       '
echo '                      | $$  \ $$| $$  \ $$| $$                             '
echo '                      | $$$$$$$/| $$  | $$| $$$$$                          '
echo '                      | $$____/ | $$  | $$| $$__/                          '
echo '                      | $$      | $$  | $$| $$                             '
echo '                      | $$      | $$$$$$$/| $$                             '
echo '                      |__/      |_______/ |__/                             '
echo '                                                                           '
echo ' /$$   /$$           /$$                     /$$                           '
echo '| $$  | $$          | $$                    | $$                           '
echo '| $$  | $$ /$$$$$$$ | $$  /$$$$$$   /$$$$$$$| $$   /$$  /$$$$$$   /$$$$$$  '
echo '| $$  | $$| $$__  $$| $$ /$$__  $$ /$$_____/| $$  /$$/ /$$__  $$ /$$__  $$ '
echo '| $$  | $$| $$  \ $$| $$| $$  \ $$| $$      | $$$$$$/ | $$$$$$$$| $$  \__/ '
echo '| $$  | $$| $$  | $$| $$| $$  | $$| $$      | $$_  $$ | $$_____/| $$       '
echo '|  $$$$$$/| $$  | $$| $$|  $$$$$$/|  $$$$$$$| $$ \  $$|  $$$$$$$| $$       '
echo ' \______/ |__/  |__/|__/ \______/  \_______/|__/  \__/ \_______/|__/       '
echo -e "${RESET}"
}
show_banner() {
    echo -e "\e[1;35m                +----------------------------------------+\e[0m"
    echo -e "\e[1;35m                |\e[1;33m code   : ★ Rakibul ★                   \e[1;35m|\e[0m"
    echo -e "\e[1;35m                |\e[1;33m Github : https://github.com/Rakibul0909\e[1;35m|\e[0m"
    echo -e "\e[1;35m                |\e[1;33m YouTube: ?                             \e[1;35m|\e[0m"
    echo -e "\e[1;35m                +----------------------------------------+\e[0m"
}
# Step 1: Main Menu
spin2
show_banner
echo""
echo""
echo""
echo -e "${CYANN}1. Start Brute-Force Attack"
echo -e "2. Exit${CYANN}\n"
read -p "$(echo -e ${GREENN}Set option ⟩ ${RESET})" main_option

if [[ "$main_option" == "2" ]]; then
echo""
    echo -e "${RED}Exiting...${RESET}"
echo""
    exit 0
fi
# Step 2: Wordlist Selection
echo ""
echo ""

echo -e "${CYANN}1. Custom Wordlist (Auto wordlist)"
echo -e "2. Your Wordlist"
echo -e "3. Exit"
echo ""
read -p "$(echo -e ${GREENN}Set option ⟩ ${RESET})" wordlist_option
echo ""

if [[ "$wordlist_option" == "3" ]]; then
    echo -e "${RED}Exiting...${RESET}"
    exit 0
elif [[ "$wordlist_option" == "1" ]]; then
    wordlist="/data/data/com.termux/files/home/PDF-Unlocker/wordlist.txt"
    read -p "$(echo -e ${MAGENTA}➤ Enter the PDF file path ⟩ ${RESET})" pdf_file
elif [[ "$wordlist_option" == "2" ]]; then
    read -p "$(echo -e ${MAGENTA}➤ Enter the PDF file path ⟩ ${RESET})" pdf_file
    echo ""
    read -p "$(echo -e ${MAGENTA}➤ Enter the wordlist file path ⟩ ${RESET})" wordlist
else
    echo -e "${RED}Invalid Option! Exiting...${RESET}"
echo""
exit 1
fi
echo""
# Check if files exist
if [[ ! -f "$pdf_file" ]]; then
    echo -e "${RED}Error: PDF file not found!${RESET}"
echo""
 exit 1
fi
echo""
if [[ ! -f "$wordlist" ]]; then
    echo -e "${RED}Error: Wordlist file not found!${RESET}"
echo""
exit 1
fi
echo""
# Start Brute-force Attack
echo -e "${YELLOW}\n[+] Starting Brute-Force Attack...${RESET}"

while IFS= read -r password; do
    echo -e "${BLUE}[*] Trying password: $password${RESET}"

    qpdf --password="$password" --decrypt "$pdf_file" temp.pdf 2>/dev/null

    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}\n[✓] Password Found: $password${RESET}"
echo""
    exit 0
    fi
echo""
done < "$wordlist"

echo -e "${RED}\n[×] Password Not Found!${RESET}"
echo""
                                 