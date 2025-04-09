 #!/bin/bash

# Colors
GREEN="\e[1;92m"
BLUE="\e[1;34m"
YELLOW="\e[1;93m"
RED="\e[1;91m"
CYAN="\e[1;96m"
MAGENTA="\e[1;35m"
RESET="\e[0m"

# Kill any apt, dpkg, or pkg processes
pkill -9 apt 2>/dev/null
pkill -9 dpkg 2>/dev/null
pkill -9 pkg 2>/dev/null
rm -rf /data/data/com.termux/cache/apt/archives/lock
rm -rf /data/data/com.termux/files/usr/var/lib/dpkg/lock
rm -rf /data/data/com.termux/files/usr/var/lib/dpkg/lock-frontend

# Animation Function
anime() {
    text="$1"
    color="$2"
    echo -ne "$color"
    for ((i = 0; i < ${#text}; i++)); do
        echo -ne "${text:$i:1}"
        sleep 0.04
    done
    echo -e "${RESET}"
}

# Banner Function
show_banner() {
    clear
    echo -e "${MAGENTA}"
    echo '               ██████╗ ██████╗ ███████╗    '
    echo '               ██╔══██╗██╔══██╗██╔════╝    '
    echo '               ██████╔╝██║  ██║█████╗      '
    echo '               ██╔═══╝ ██║  ██║██╔══╝      '
    echo '               ██║     ██████╔╝██║        '
    echo '               ╚═╝     ╚═════╝ ╚═╝        '
    echo ''
    echo ' ██╗   ██╗███╗   ██╗██╗      ██████╗  ██████╗██╗  ██╗ '
    echo ' ██║   ██║████╗  ██║██║     ██╔═══██╗██╔════╝██║ ██╔╝ '
    echo ' ██║   ██║██╔██╗ ██║██║     ██║   ██║██║     █████╔╝  '
    echo ' ██║   ██║██║╚██╗██║██║     ██║   ██║██║     ██╔═██╗  '
    echo ' ╚██████╔╝██║ ╚████║███████╗╚██████╔╝╚██████╗██║  ██╗ '
    echo '  ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝ '
    echo -e "${RESET}"

    anime "      $(echo -e "${GREEN}★${RESET} ${CYAN}PDF Brute-Force Password Cracker${RESET} ${GREEN}★${RESET}")" "$CYAN"
    anime "    Coded by: I AM NOT HACKER | GitHub: IAMNOTHACKER0909" "$MAGENTA"
}

# Update & Install Dependencies
echo ""
echo -e "${GREEN}[*] Updating Termux...${RESET}"
pkg update && pkg upgrade -y
# Install qpdf if not installed
if ! command -v qpdf &>/dev/null; then
    echo -e "${YELLOW}[*] Installing qpdf....${RESET}"
    pkg install qpdf -y
else
    echo -e "${GREEN}[✓] qpdf is already installed.${RESET}"
fi

# Start
sleep 1
show_banner

# Main Menu
echo ""
echo -e "${CYAN}[${GREEN}1${CYAN}] Start Brute-Force Attack${RESET}"
echo -e "${CYAN}[${GREEN}2${CYAN}] Check PDF Encryption Type${RESET}"
echo -e "${CYAN}[${GREEN}3${CYAN}] Exit${RESET}"
echo ""

read -p "$(echo -e ${GREEN}Set option ⟩ ${RESET})" main_option

case "$main_option" in
    1)
        echo ""
        echo -e "${CYAN}[${GREEN}1${CYAN}] Use Auto Wordlist${RESET}"
        echo -e "${CYAN}[${GREEN}2${CYAN}] Use Custom Wordlist${RESET}"
        echo -e "${CYAN}[${GREEN}3${CYAN}] Exit${RESET}"
        echo ""

        read -p "$(echo -e ${GREEN}Set option ⟩ ${RESET})" wordlist_option
        echo ""
        read -p "$(echo -e ${MAGENTA}➤ Enter the PDF file path ⟩ ${RESET})" pdf_file
        echo ""

        if [[ ! -f "$pdf_file" ]]; then
            echo -e "${RED}Error: PDF file not found!${RESET}"
            exit 1
        fi

        if [[ "$wordlist_option" == "1" ]]; then
            wordlist="/data/data/com.termux/files/home/PDF-Unlocker/wordlist.txt"
        elif [[ "$wordlist_option" == "2" ]]; then
            read -p "$(echo -e ${MAGENTA}➤ Enter the wordlist file path ⟩ ${RESET})" wordlist
        else
            echo -e "${RED}Invalid Option! Exiting...${RESET}"
            exit 1
        fi

        if [[ ! -f "$wordlist" ]]; then
            echo -e "${RED}Error: Wordlist file not found!${RESET}"
        exit 1
        fi

        # Mode Selection
        echo ""
        echo -e "${CYAN}[${GREEN}1${CYAN}] Parallel Mode (Show Passwords Trying)${RESET}"
        echo -e "${CYAN}[${GREEN}2${CYAN}] Multi Mode (Silent, Show Only Found)${RESET}"
        echo ""

        read -p "$(echo -e ${GREEN}Set option ⟩ ${RESET})" mode_option

        total_passwords=$(wc -l < "$wordlist")
        frames=("/" "-" "\\" "|")
        frame_index=0

        echo -e "\n${YELLOW}[+] Starting Brute-Force Attack...${RESET}\n"

        if [[ "$mode_option" == "1" ]]; then
            # Parallel Mode - Show Passwords Trying
            while IFS= read -r password; do
                frame="${frames[$frame_index]}"
                frame_index=$(( (frame_index + 1) % 4 ))

                printf "\r${BLUE}[${frame}] Trying password (${password}/${total_passwords})${RESET}"

                qpdf --password="$password" --decrypt "$pdf_file" temp.pdf 2>/dev/null
                if [[ $? -eq 0 ]]; then
                    echo ""
                    echo -e "\n\n${GREEN}[✓] Password Found: $password${RESET}"
                    echo ""
                    exit 0
                fi
            done < "$wordlist"
        elif [[ "$mode_option" == "2" ]]; then
            # Multi Mode - Silent, Only Show Found Password
            while IFS= read -r password; do
                echo -e "${BLUE}[*] Trying password: ${password}${RESET}"

                qpdf --password="$password" --decrypt "$pdf_file" temp.pdf 2>/dev/null
                if [[ $? -eq 0 ]]; then
                    echo ""
                    echo -e "${GREEN}[✓] Password Found: $password${RESET}"
                    echo ""
                    exit 0
                fi
            done < "$wordlist"
        else
            echo -e "${RED}Invalid Option!${RESET}"
            exit 1
        fi

        echo -e "${RED}[×] Password Not Found!${RESET}"
        exit 1
        ;;

    2)
        echo ""
        read -p "$(echo -e ${MAGENTA}➤ Enter the PDF file path ⟩ ${RESET})" pdf_file
        echo ""
        if [[ ! -f "$pdf_file" ]]; then
            echo -e "${RED}Error: PDF file not found!${RESET}"
            exit 1
        fi
        echo -e "${YELLOW}[INFO] Checking encryption type...${RESET}"
        qpdf --show-encryption "$pdf_file"
        exit 0
        ;;

    3)
        echo -e "${RED}Exiting...${RESET}"
        exit 0
        ;;

    *)
        echo -e "${RED}Invalid option!${RESET}"
        exit 1
        ;;
esac
