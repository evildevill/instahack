# Setup script - InstaHack
# The setup script for the InstaHack tool. This is a pythhon script that automates the installation of the 
# required utilities and modules, and all the important required dependencies for the tool. 
# For linux based devices only.

# Author : Waseem Akram (https://github.com/evildevill/)
# Modified on : December 30, 2022

# This file is part of InstaHack.
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

# Prompt the user for input
echo -e $GREEN "Which Distribution are you using? (Termux/kali)" $DEFCOL
echo -e $YEllOW "Note: This script is only for Termux and Kali Linux" $DEFCOL
echo -e $RED "Enter your choice kali or termux: " $DEFCOL
read os

# Check the user's input and perform different actions based on the input
if [ $os = "kali" ]; then
    # If the user is using Kali Linux, install the required utilities and modules
    clear
    echo ""
    echo -e $GREEN "Installing the required utilities and modules..." $DEFCOL
    echo -e $GREEN "Please wait This may take a moment..." $DEFCOL
    echo ""
    sleep 3
    sudo apt-get update -y > /dev/null 2>&1
    sudo apt-get upgrade -y > /dev/null 2>&1
    sudo apt-get install python -y > /dev/null 2>&1
    sudo apt-get install git -y > /dev/null 2>&1 
    sudo apt-get install wget -y > /dev/null 2>&1
    sudo apt-get install curl -y > /dev/null 2>&1
    pip3 install lolcat -y > /dev/null 2>&1
    sudo apt install tor -y > /dev/null 2>&1
    git clone https://github.com/evildevill/instahack.git
    cd instahack
    export PATH=/home/$USER/.local/bin:$PATH
    pip3 install -r requirements.txt
    sudo firefox https://youtu.be/2JWLLKuicUo > /dev/null 2>&1
    sudo rm -rf /etc/tor/torrc
    sudo cp torrc /etc/tor/torrc
    echo -e $GREEN "Setup completed successfully" $DEFCOL
    echo -e $GREEN "Open new terminal and type $RED tor $GREEN then hit enter" $DEFCOL
    sleep 5
    bash instahack.sh
    # echo -e $GREEN "Then type $RED bash instahack.sh $GREEN and hit enter" $DEFCOL
    # echo -e $GREEN "Now you can use the tool" $DEFCOL
    # echo -e $GREEN "Exiting..." $DEFCOL
    # sleep 3
    exit
elif [ $os = "termux" ]; then
    # If the user is using Termux, install the required utilities and modules
    clear
    echo ""
    echo -e $GREEN "Installing the required utilities and modules..." $DEFCOL
    echo -e $GREEN "Please wait This may take a moment..." $DEFCOL
    echo ""
    sleep 3
    pkg update -y > /dev/null 2>&1
    pkg upgrade -y > /dev/null 2>&1
    pkg install python -y > /dev/null 2>&1
    apt install python3 -y > /dev/null 2>&1
    apt install git -y > /dev/null 2>&1
    apt install wget -y > /dev/null 2>&1
    apt install curl -y > /dev/null 2>&1
    apt install tor > /dev/null 2>&1
    pip3 install lolcat -y > /dev/null 2>&1
    pip3 install requests > /dev/null 2>&1
    pip3 install mechanize > /dev/null 2>&1
    pip3 install bs4 > /dev/null 2>&1
    pip3 install colorama > /dev/null 2>&1
    pip3 install requests[socks] > /dev/null 2>&1
    pip3 install stem > /dev/null 2>&1
    pip3 install geopy>=2.0.0 > /dev/null 2>&1
    pip3 install prettytable==0.7.2 > /dev/null 2>&1
    pip3 install instagram-private-api==1.6.0 > /dev/null 2>&1
    git clone https://github.com/evildevill/instahack.git
    cd instahack
    am start -a android.intent.action.VIEW -d https://youtu.be/2JWLLKuicUo 2>/dev/null
    rm -rf /data/data/com.termux/files/usr/etc/tor/torrc
    cp torrc /data/data/com.termux/files/usr/etc/tor/torrc
    echo -e $GREEN "Setup completed successfully" $DEFCOL
    echo -e $GREEN "Open new terminal and type $RED tor $GREEN then hit enter" $DEFCOL
    sleep 4
    bash instahack.sh
else
    # If the user's input does not match any of the above options, print a message
    echo -e $GREEN "Sorry, I don't recognize that operating system" $DEFCOL
    echo -e $GREEN "Please try again" $DEFCOL
    echo -e $GREEN "Exiting..." $DEFCOL
    sleep 3
    exit
fi
