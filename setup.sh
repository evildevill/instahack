# Setup script - InstaHack
#
# The setup script for the InstaHack tool. This is a bash script that automates the installation of the required utilities and modules, and all the important required dependencies for the tool. For linux based devices only.
#
# Author : Waseem Akram (https://github.com/evildevill/)
# Modified on : August 20, 2022
#
#
# Defining the ANSII color code variables for colored output
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"
RED_REV="\033[07;91m"
YELLOW_REV="\033[07;93m"
DEFCOL="\033[00m"

# The main script starts here
clear
apt-get install wget -y > /dev/null 2>&1
apt-get install curl -y > /dev/null 2>&1
pip3 install lolcat -y > /dev/null 2>&1
apt install tor > /dev/null 2>&1
#service tor start > /dev/null 2>&1
#echo -e $YELLOW "Virtual Environment "
#apt install python3.9-venv > /dev/null 2>&1
#python3 -m venv venv > /dev/null 2>&1
export PATH=/home/$USER/.local/bin:$PATH
am start -a android.intent.action.VIEW -d https://youtu.be/2JWLLKuicUo 2>/dev/null
firefox https://youtu.be/2JWLLKuicUo > /dev/null 2>&1

(trap '' SIGINT SIGTSTP && command -v tor > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling TOR, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install tor > /dev/null || printf "\e[1;91mTor Not installed.\n\e[0m"; }) & wait $!

(trap '' SIGINT SIGTSTP && command -v openssl > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling openssl, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install openssl > /dev/null || printf "\e[1;91mOpenssl Not installed.\n\e[0m"; }) & wait $! 

(trap '' SIGINT SIGTSTP && command -v curl > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling cURL, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install curl > /dev/null || printf "\e[1;91mCurl Not installed.\n\e[0m"; }) & wait $!

printf "\e[1;92mAll Requirements are installed! Now Use Can use it\n\e[0m"
