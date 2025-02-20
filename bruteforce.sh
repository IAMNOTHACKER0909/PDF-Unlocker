#!/bin/bash

# Colors
GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
RED="\e[31m"
CYAN="\e[36m"
RESET="\e[0m"
MAGENTA="\e[35m"      # Normal Pink
BRIGHT_PINK="\e[95m"  # Light Pink

# Update & Upgrade Termux
echo -e "\e[94m[*]\e[0m \e[92mUpdating Termux...\e[0m"
pkg update -y && pkg upgrade -y
apt update -y && apt upgrade -y
# Show Custom ASCII Banner
clear
spin1() {
echo -e "${YELLOW}"
echo ' /$$$$$$$  /$$$$$$$  /$$$$$$$$                                                  '
echo '| $$__  $$| $$__  $$| $$_____/                                                  '
echo '| $$  \ $$| $$  \ $$| $$                                                        '
echo '| $$$$$$$/| $$  | $$| $$$$$                                                     '
echo '| $$____/ | $$  | $$| $$__/                                                     '
echo '| $$      | $$  | $$| $$                                                        '
echo '| $$      | $$$$$$$/| $$                                                        '
echo '|__/      |_______/ |__/                                                        '
echo '                                                                                '
echo '       /$$   /$$           /$$                     /$$                           '
echo '      | $$  | $$          | $$                    | $$                           '
echo '      | $$  | $$ /$$$$$$$ | $$  /$$$$$$   /$$$$$$$| $$   /$$  /$$$$$$   /$$$$$$  '
echo '      | $$  | $$| $$__  $$| $$ /$$__  $$ /$$_____/| $$  /$$/ /$$__  $$ /$$__  $$ '
echo '      | $$  | $$| $$  \ $$| $$| $$  \ $$| $$      | $$$$$$/ | $$$$$$$$| $$  \__/ '
echo '      | $$  | $$| $$  | $$| $$| $$  | $$| $$      | $$_  $$ | $$_____/| $$       '
echo '      |  $$$$$$/| $$  | $$| $$|  $$$$$$/|  $$$$$$$| $$ \  $$|  $$$$$$$| $$       '                                                     echo '       \______/ |__/  |__/|__/ \______/  \_______/|__/  \__/ \_______/|__/       '
echo -e "${RESET}"                                                                                                                           }
# Show Custom ASCII Banner                                                                                                                   spin2() {
echo -e "${MAGENTA}"                                                                                                                         echo ' /$$$$$$$  /$$$$$$$  /$$$$$$$$                                                  '
echo '| $$__  $$| $$__  $$| $$_____/                                                  '
echo '| $$  \ $$| $$  \ $$| $$                                                        '
echo '| $$$$$$$/| $$  | $$| $$$$$                                                     '
echo '| $$____/ | $$  | $$| $$__/                                                     '                                                      echo '| $$      | $$  | $$| $$                                                        '
echo '| $$      | $$$$$$$/| $$                                                        '
echo '|__/      |_______/ |__/                                                        '
echo '                                                                                '                                                      echo '       /$$   /$$           /$$                     /$$                           '
echo '      | $$  | $$          | $$                    | $$                           '                                                     echo '      | $$  | $$ /$$$$$$$ | $$  /$$$$$$   /$$$$$$$| $$   /$$  /$$$$$$   /$$$$$$  '
echo '      | $$  | $$| $$__  $$| $$ /$$__  $$ /$$_____/| $$  /$$/ /$$__  $$ /$$__  $$ '
echo '      | $$  | $$| $$  \ $$| $$| $$  \ $$| $$      | $$$$$$/ | $$$$$$$$| $$  \__/ '
echo '      | $$  | $$| $$  | $$| $$| $$  | $$| $$      | $$_  $$ | $$_____/| $$       '
echo '      |  $$$$$$/| $$  | $$| $$|  $$$$$$/|  $$$$$$$| $$ \  $$|  $$$$$$$| $$       '
echo '       \______/ |__/  |__/|__/ \______/  \_______/|__/  \__/ \_______/|__/       '
echo -e "${RESET}"
}
# Show Custom ASCII Banner
spin3() {
echo -e "${GREEN}"
echo ' /$$$$$$$  /$$$$$$$  /$$$$$$$$                                                  '
echo '| $$__  $$| $$__  $$| $$_____/                                                  '
echo '| $$  \ $$| $$  \ $$| $$                                                        '
echo '| $$$$$$$/| $$  | $$| $$$$$                                                     '
echo '| $$____/ | $$  | $$| $$__/                                                     '
echo '| $$      | $$  | $$| $$                                                        '
echo '| $$      | $$$$$$$/| $$                                                        '
echo '|__/      |_______/ |__/                                                        '
echo '                                                                                '
echo '       /$$   /$$           /$$                     /$$                           '
echo '      | $$  | $$          | $$                    | $$                           '
echo '      | $$  | $$ /$$$$$$$ | $$  /$$$$$$   /$$$$$$$| $$   /$$  /$$$$$$   /$$$$$$  '
echo '      | $$  | $$| $$__  $$| $$ /$$__  $$ /$$_____/| $$  /$$/ /$$__  $$ /$$__  $$ '
echo '      | $$  | $$| $$  \ $$| $$| $$  \ $$| $$      | $$$$$$/ | $$$$$$$$| $$  \__/ '
echo '      | $$  | $$| $$  | $$| $$| $$  | $$| $$      | $$_  $$ | $$_____/| $$       '
echo '      |  $$$$$$/| $$  | $$| $$|  $$$$$$/|  $$$$$$$| $$ \  $$|  $$$$$$$| $$       '
echo '       \______/ |__/  |__/|__/ \______/  \_______/|__/  \__/ \_______/|__/       '
echo -e "${RESET}"
}
# Function to show banner                                                                                                                    show_banner() {
    echo -e "${YELLOW}================================================================================="
    echo -e "                             Welcome to PDF-Unlocker  "
    echo -e "=================================================================================${RESET}\n"
}

# Initial Confirmation
clear

# Step 1: Main Menu                                                                                                                          spin2
show_banner                                                                                                                                  echo -e "${CYAN}1. Start Brute-Force Attack"
echo -e "2. Exit${CYAN}\n"
read -p "$(echo -e ${GREEN}Set option: ${RESET})" main_option
clear

# Exit Condition
if [[ "$main_option" == "2" ]]; then
    echo -e "${RED}Exiting...${RESET}"
    exit 0
elif [[ "$main_option" != "1" ]]; then
    echo -e "${RED}Invalid Option! Exiting...${RESET}"
    exit 1
fi

# Step 2: Wordlist Selection
spin3
show_banner
echo -e "${CYAN}1. Custom Wordlist (Auto Path)"
echo -e "2. Your Wordlist"
echo -e "3. Exit"
echo ""
read -p "$(echo -e ${GREEN}Set option: ${RESET})" wordlist_option
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
    exit 1
fi

# Check if files exist
if [[ ! -f "$pdf_file" ]]; then
    echo -e "${RED}Error: PDF file not found!${RESET}"
    exit 1
fi

if [[ ! -f "$wordlist" ]]; then
    echo -e "${RED}Error: Wordlist file not found!${RESET}"
    exit 1
fi

# Start Brute-force Attack
echo -e "${YELLOW}\n[+] Starting Brute-Force Attack...${RESET}"

while IFS= read -r password; do
    echo -e "${BLUE}[*] Trying password: $password${RESET}"

    qpdf --password="$password" --decrypt "$pdf_file" temp.pdf 2>/dev/null

    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}\n[✓] Password Found: $password${RESET}"
        exit 0
    fi
done < "$wordlist"

echo -e "${RED}\n[×] Password Not Found!${RESET}"


                                                                                                                                             