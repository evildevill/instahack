# Setup script - InstaHack
#
# The setup script for the InstaHack tool. This is a bash script that automates the installation of the required utilities and modules, and all the important required dependencies for the tool. For linux based devices only.
#
# Author : Waseem Akram (https://github.com/evildevill/)
# Modified on : January 05, 2022
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
apt install figlet
echo -e $YELLOW "Installing Tor "
sleep 2.0
echo ""
apt install tor > /dev/null 2>&1
service tor start > /dev/null 2>&1
echo -e $YELLOW "Virtual Environment "
apt install python3.9-venv > /dev/null 2>&1
python3 -m venv venv > /dev/null 2>&1
source venv/bin/activate
echo -e $YELLOW "Installing Requirements "
pip3 install requests > /dev/null 2>&1
pip3 install mechanize > /dev/null 2>&1
pip3 install requests[socks] > /dev/null 2>&1
pip3 install stem > /dev/null 2>&1
pip3 install requests==2.24.0 > /dev/null 2>&1
pip3 install requests-toolbelt==0.9.1 > /dev/null 2>&1
pip3 install geopy>=2.0.0 > /dev/null 2>&1
pip3 install prettytable==0.7.2 > /dev/null 2>&1
pip3 install instagram-private-api==1.6.0 > /dev/null 2>&1
pip3 install gnureadline>=8.0.0; platform_system != "Windows" > /dev/null 2>&1
pip3 install pyreadline==2.1; platform_system == "Windows" > /dev/null 2>&1
pip3 install instagram-py > /dev/null 2>&1
pip3 install lolcat > /dev/null 2>&1
instagram-py -cc -dc > /dev/null 2>&1

(trap '' SIGINT SIGTSTP && command -v tor > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling TOR, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install tor > /dev/null || printf "\e[1;91mTor Not installed.\n\e[0m"; }) & wait $!

(trap '' SIGINT SIGTSTP && command -v openssl > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling openssl, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install openssl > /dev/null || printf "\e[1;91mOpenssl Not installed.\n\e[0m"; }) & wait $! 

(trap '' SIGINT SIGTSTP && command -v curl > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling cURL, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install curl > /dev/null || printf "\e[1;91mCurl Not installed.\n\e[0m"; }) & wait $!

printf "\e[1;92mAll Requirements are installed! Now Use Can use it\n\e[0m"
