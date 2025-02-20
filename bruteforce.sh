#!/bin/bash

# Colors
GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
RED="\e[31m"
CYAN="\e[36m"
RESET="\e[0m"                                                                                                                                MAGENTA="\e[35m"      # Normal Pink
BRIGHT_PINK="\e[95m"  # Light Pink


# Update and Install Required Packages
echo -e "${BLUE}[*] Downloading..please wait......${RESET}"
pkg update -y
pkg upgrade -y
pkg install wget -y
pkg install figlet -y
pkg install ruby -y
pkg install gem -y
pkg install lolcat -y
clear
# Setup Custom Figlet Font
mkdir -p ~/.figlet
cd ~/.figlet
if [ ! -f "ANSI Shadow.flf" ]; then
    wget -q "https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf"
fi
cd ~

# Show Banner
figlet -f ~/.figlet/ANSI\ Shadow.flf "Welcome" | lolcat

# Function to show banner
show_banner() {
    echo -e "${YELLOW}==============================================================="
    echo -e "                    Welcome to PDF-Unlocker  "
    echo -e "===============================================================${RESET}\n"
}

# Initial Confirmation
read -p "Do you want to continue? (y/n): " choice
if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
    echo "Exiting..." | lolcat
    exit 0
fi

clear

# Step 1: Main Menu
figlet -f ~/.figlet/ANSI\ Shadow.flf "Welcome" | lolcat
show_banner
echo -e "${CYAN}1. Start Brute-Force Attack"
echo -e "2. Exit${CYAN}\n"
read -p "$(echo -e ${GREEN}Set option: ${RESET})" main_option
clear

# Show Banner Again
figlet -f ~/.figlet/ANSI\ Shadow.flf "welcome" | lolcat

# Exit Condition
if [[ "$main_option" == "2" ]]; then
    echo -e "${RED}Exiting...${RESET}"
    exit 0
elif [[ "$main_option" != "1" ]]; then
    echo -e "${RED}Invalid Option! Exiting...${RESET}"
    exit 1
fi

# Step 2: Wordlist Selection
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

    # Try opening PDF with current password
    qpdf --password="$password" --decrypt "$pdf_file" temp.pdf 2>/dev/null

    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}\n[✓] Password Found: $password${RESET}"
        exit 0
    fi
done < "$wordlist"

echo -e "${RED}\n[×] Password Not Found!${RESET}"
echo""
