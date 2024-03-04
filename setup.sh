# Setup script - InstaHack
# The setup script for the InstaHack tool. This is a python script that automates the installation of the
# required utilities and modules, and all the important required dependencies for the tool.

# Author  : Waseem Akram 
# Github  : https://github.com/evildevill/
# Website : https://hackerwasii.com
# Created on : May 04, 2020
# Modified on : March 04, 2024

# This file is part of InstaHack.
# Defining the ANSII color code variables for colored output
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"
RED_REV="\033[07;91m"
YELLOW_REV="\033[07;93m"
DEFCOL="\033[00m"

# Function to detect the operating system
detect_os() {
    uname
}

# Function to check the Linux distribution
check_distro() {
    if [ -f /etc/os-release ]; then
        cat /etc/os-release | grep '^ID='
    else
        echo "android"
    fi
}

# Function to install the required utilities and modules
install_utilities_and_modules_kali() {
    sudo apt-get install python -y >/dev/null 2>&1
    sudo apt-get install git -y >/dev/null 2>&1
    sudo apt-get install wget -y >/dev/null 2>&1
    sudo apt-get install curl -y >/dev/null 2>&1
    pip3 install lolcat -y >/dev/null 2>&1
    sudo apt install tor -y >/dev/null 2>&1
}

# Function to add a directory to the PATH if it's not already there
add_to_path() {
    dir="/home/$USER/.local/bin"
    if ! echo $PATH | grep -q $dir; then
        echo "export PATH=$dir:\$PATH" >>~/.zshrc
        source ~/.zshrc
    fi
}

# Function to install the required utilities and modules for Termux
install_utilities_and_modules_termux() {
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
}

downloading_password_lists() {
    echo -e $GREEN "Downloading password list..." $DEFCOL
    echo -e $GREEN "Please wait This may take a moment"
    echo -e $GREEN "Depending on your internet speed.." $DEFCOL
    echo ""
    sleep 2
    # Array of password lists to download
    password_lists=("pass1.txt" "pass2.txt" "pass3.txt" "pass4.txt")
    # Loop over the array and download each password list
    for password_list in ${password_lists[@]}; do
        if ! wget https://pub-2b8e269912ef4e92a7cdaa2352aee92f.r2.dev/$password_list; then
            echo -e $RED "Failed to download $password_list" $DEFCOL
            return 1
        fi
    done
    echo -e $GREEN "Password list downloaded successfully" $DEFCOL
    # Create pass folder inside instahack then move these into instahack/pass folder
    mkdir -p $HOME/instahack/pass
    mv ${password_lists[@]} $HOME/instahack/pass
    echo ""
}

# The main script starts here
clear

# Detect the user's operating system
operating_system=$(detect_os)

# Check the user's operating system and perform different actions based on the operating system
if [ -d "/data/data/com.termux/files/usr/" ]; then
    # If the user is using Termux, install the required utilities and modules
    echo -e $GREEN "Detected Termux on Android." $DEFCOL 
    echo -e $GREEN "Installing the required utilities and modules." $DEFCOL
    echo -e $GREEN "Please wait This may take a moment - " $DEFCOL
    echo -e $GREEN "Depending on your internet speed." $DEFCOL
    echo -e $GREEN "You may be prompted to grant storage permissions..." $DEFCOL
    echo ""
    # If the user is using Termux on Android, install the required utilities and modules
    sleep 3
    install_utilities_and_modules_termux
    cd $HOME
    # check if instahack folder exists
    if [ -d "instahack" ]; then
        cd instahack
        sleep 2
        bash instahack.sh
    else
        cd $HOME
        git clone https://github.com/evildevill/instahack
        cd instahack
        downloading_password_lists
        rm -rf /data/data/com.termux/files/usr/etc/tor/torrc
        cp torrc /data/data/com.termux/files/usr/etc/tor/torrc
        pip3 install -r requirements.txt
        echo -e $GREEN "Setup completed successfully" $DEFCOL
        echo -e $GREEN "Open new terminal and type $RED tor $GREEN then hit enter" $DEFCOL
        sleep 4
        bash instahack.sh
    fi
    # If the user is using Linux, check the distribution
elif [[ "$operating_system" == *"Linux"* ]]; then
    # If the user is using Linux, check the distribution
    linux_distro=$(check_distro)
    if [[ "$linux_distro" == *"kali"* ]]; then
        # If the user is using Kali Linux, install the required utilities and modules
        linux_distro=$(check_distro)
        clear
        echo ""
        echo -e $GREEN "Detected Kali Linux. Installing the required utilities and modules..." $DEFCOL
        echo -e $GREEN "Please wait This may take a moment depending on your internet speed..." $DEFCOL
        echo -e $GREEN "You may be prompted to enter your password..." $DEFCOL
        echo ""
        sleep 1
        install_utilities_and_modules_kali
        add_to_path
        if [ -d "instahack" ]; then
            cd instahack
            sleep 2
            bash instahack.sh
        else
            git clone https://github.com/evildevill/instahack.git
            cd instahack
            sudo rm -rf /etc/tor/torrc
            sudo cp torrc /etc/tor/torrc
            pip3 install -r requirements.txt
            downloading_password_lists
            sleep 2
            echo -e $GREEN "Setup completed successfully" $DEFCOL
            echo -e $GREEN "Open new terminal and type $RED tor $GREEN then hit enter" $DEFCOL
            sleep 5
            bash instahack.sh
         fi
    else
        echo -e $GREEN "Sorry, this Linux distribution is not supported" $DEFCOL
    fi
else
    # If the user's operating system does not match any of the above options, print a message
    echo -e $GREEN "Sorry, this operating system is not supported" $DEFCOL
fi
# End of the script