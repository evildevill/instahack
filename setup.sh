# Setup script - InstaHack
# The setup script for the InstaHack tool. This is a python script that automates the installation of the
# required utilities and modules, and all the important required dependencies for the tool.

# Author : Waseem Akram (https://github.com/evildevill/)
# Modified on : March 04, 2024

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

# Detect the user's operating system
os=$(uname)

# Check the user's operating system and perform different actions based on the operating system
if [ "$os" = "Linux" ]; then
    # If the user is using Linux, check the distribution
    distro=$(cat /etc/*-release | grep '^ID=')

    if [[ "$distro" == *"kali"* ]]; then
        # If the user is using Kali Linux, install the required utilities and modules
        clear
        echo ""
        echo -e $GREEN "Detected Kali Linux. Installing the required utilities and modules..." $DEFCOL
        echo -e $GREEN "Please wait This may take a moment depending on your internet speed..." $DEFCOL
        echo -e $GREEN "You may be prompted to enter your password..." $DEFCOL
        echo ""
        sleep 1
        sudo apt-get install python -y >/dev/null 2>&1
        sudo apt-get install git -y >/dev/null 2>&1
        sudo apt-get install wget -y >/dev/null 2>&1
        sudo apt-get install curl -y >/dev/null 2>&1
        pip3 install lolcat -y >/dev/null 2>&1
        sudo apt install tor -y >/dev/null 2>&1
        git clone https://github.com/evildevill/instahack.git
        cd instahack
        dir="/home/$USER/.local/bin"
        # Check if the directory is in the PATH
        if echo $PATH | grep -q $dir; then
            echo "$dir is already in the PATH"
        else
            echo "Adding $dir to PATH"
            echo "export PATH=$dir:\$PATH" >>~/.bashrc
            source ~/.bashrc
        fi
        pip3 install -r requirements.txt
        sudo rm -rf /etc/tor/torrc
        sudo cp torrc /etc/tor/torrc
        echo -e $GREEN "Setup completed successfully" $DEFCOL
        echo -e $GREEN "Open new terminal and type $RED tor $GREEN then hit enter" $DEFCOL
        sleep 5
        bash instahack.sh
    else
        echo -e $GREEN "Sorry, this Linux distribution is not supported" $DEFCOL
    fi
elif [ -d "/data/data/com.termux/files/usr/" ]; then
    # If the user is using Termux on Android, install the required utilities and modules
    clear
    echo ""
    echo -e $GREEN "Detected Termux on Android. Installing the required utilities and modules..." $DEFCOL
    echo -e $GREEN "Please wait This may take a moment..." $DEFCOL
    echo ""
    sleep 3
    pkg install python -y
    pkg install python3 -y
    pkg install git -y
    pkg install wget -y
    pkg install curl -y
    pkg install tor -y
    pip3 install lolcat
    pip3 install requests
    pip3 install mechanize
    pip3 install bs4
    pip3 install colorama
    pip3 install requests[socks]
    pip3 install stem
    pip3 install instagram-private-api==1.6.0
    cd
    git clone https://github.com/evildevill/instahack.git
    cd instahack
    rm -rf /data/data/com.termux/files/usr/etc/tor/torrc
    cp torrc /data/data/com.termux/files/usr/etc/tor/torrc
    echo -e $GREEN "Setup completed successfully" $DEFCOL
    echo -e $GREEN "Open new terminal and type $RED tor $GREEN then hit enter" $DEFCOL
    sleep 4
    bash instahack.sh
else
    # If the user's operating system does not match any of the above options, print a message
    echo -e $GREEN "Sorry, this operating system is not supported" $DEFCOL
fi
