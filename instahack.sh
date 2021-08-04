# InstaHack
#
# A tool to test out the security strength of a instagram account's password. The tool is written in bash scripting language. The tool is officially created for testing purposes. Any unauthorized activity made using our tool will be considered your guilt, and none of ours. You may also have to face penalties, if you do malicious operations that goes against law or someone's privacy. So, better use this tool on authorized services (instagram accounts that you have permission to) as well as for testing purposes. Hacking is not illegal, but only if you do for public good. This tool can be used in linux computer systems as well as you can use it on your android device using terminal emulators like termux [No rooting of the android device is required].
#
# Author : Waseem Akram (https://github.com/evildevill/)
# Created on : June 27, 2020
#
# Last modified by : Rishav Das (https://github.com/rdofficial/)
# Last modified on : May 10, 2021
#
# Changes made in the last modification :
# 1. Added the infinite loop feature of the main menu.
# 2. Corrected some previous file errors.
# 3. Changed the option number for 'exit' from 8 to 0 in the main menu of the tool. Reason is that, when more and newer options will be added to the tool, we have to jump these exit option too. That's why keeping it 0 will be constant forever. Just add new options after 7th option number.
#
# Authors contributed to this project (Add your name below if you have contributed) :
# 1. Waseem Akram (github:https://github.com/evildevill/, email:hackerwasi1@gmail.com)
# 2. Rishav Das (github:https://github.com/rdofficial/, email:rdofficial192@gmail.com)
#
# Note : Not each and every part of the project is made by us, some of the core files are made by different other people. So, the real credits goes to them.
#

# Defining the ANSII color code variables for colored output
RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
BLUE='\033[94m'
CYAN='\033[96m'
pink='\033[95m'
RED_REV="\033[07;91m"
DEFCOL="\033[00m"

#############################################
echo -e "[${RED}!${DEFCOL}] Password is Required to Run the tool..."
echo -e "[${RED}!${DEFCOL}] Buy Tool Price 5USD..."
read -sp $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Enter Password To Continue: \e[0m' pswd

        # Checking the user entered option
        if [[ $pswd == instahackwasi || $pswd == instahackwasi ]]; then
        sleep 1
        echo "      Checking Password..."
        sleep 2.0
        echo "      Password Match..."
        sleep 1
        clear
        else
        echo " Try Again..."
        bash instahack.sh
        fi

function checkUpdates {
	# The function to check for the updates of the tool, if available any. We will just fetch the version update notice file at the github mirror of this repository (project)

	if wget --spider https://raw.githubusercontent.com/evildevill/instahack/master/update.v1.3 >/dev/null; then
		# If there exists any updates to this tool, then we mark for the update in the core/update.txt file

		# echo "instahack" > $HOME/instahack/core/update.txt
		# ----
		# We donot do that shit here, because we dont want to create a waste file for just marking purpose. Lets directly call the update.sh script if there are really any updates to the script
		# ----
		if [[ -f "bash $HOME/instahack/core/update.sh" ]]; then
			# If the update.sh script exists in the core/ folder of this project, then we continue
		
			bash $HOME/instahack/core/update.sh
		else
			# If the update.sh script does not exists, then we display the error message on the console screen

			echo -e "\n${RED_REV}[ Error : core/update.sh is missing, please see the instructions on the README.md file and resolve the error ]${DEFCOL}"
			echo -e "[${RED}!${DEFCOL}] Continuing without updating the tool..."
			sleep 2
			clear
		fi
	fi

	# Now, checking for updates in the script file
	if wget --spider https://raw.githubusercontent.com/evildevill/evildevillpatch/main/instahack.v.1.3 >/dev/null; then
		# If there are updates to the path, then we launch the core/path.sh script file after checking it

		if [[ -f "$HOME/instaHack/core/patch.txt" ]]; then
			# If the core/patch.sh script file exists, then we launch it

			bash $HOME/instahack/core/patch.sh
		else
			# If the core/patch.sh script file does not exists, then we display the error message on the console screen

			echo -e "\n${RED_REV}[ Error : core/patch.sh is missing, please see the instructions on the README.md file and resolve the error ]${DEFCOL}"
			echo -e "[${RED}!${DEFCOL}] Continuing without updating the tool..."
			sleep 2
			clear
		fi
	fi
}

# Calling the checkUpdates function to check for any updates to this tool
checkUpdates

# The main part of the script starts here
clear

# Checking if the TOR service is running or not
if pgrep -x "tor" >/dev/null; then
	# If the TOR service is running, then we continue

	printf ""
else
	# If the TOR service is not running, then we display the error message on the console screen

	echo -e "\n${RED_REV}[ Error : TOR service is not running, please start the TOR service and then launch the script (tool) again ]${DEFCOL}"

	# Displaying the steps for launching the TOR service to the user
	echo -e "\nUse the below steps :"
	echo -e "[${YELLOW}1${DEFCOL}] Open a terminal and launch the command '${GREEN}tor${DEFCOL}'."
	echo -e "[${YELLOW}2${DEFCOL}] Then, launch this tool (script) again."
	sleep 1
	exit 1  # Exiting the script
fi


while true; do
	# Using a while true loop for infinite execution of the script until the user chooses to exit

	# Displaying the banner on the console screen
	clear
	echo -e "${YELLOW}
	╭━━╮╱╱╱╱╱╭╮╱╱╱╭╮╱╱╱╱╱╱╱╭╮
	╰┫┣╯╱╱╱╱╭╯╰╮╱╱┃┃╱╱╱╱╱╱╱┃┃
	╱┃┃╭━╮╭━┻╮╭╋━━┫╰━┳━━┳━━┫┃╭╮
	╱┃┃┃╭╮┫━━┫┃┃╭╮┃╭╮┃╭╮┃╭━┫╰╯╯
	╭┫┣┫┃┃┣━━┃╰┫╭╮┃┃┃┃╭╮┃╰━┫╭╮╮
	╰━━┻╯╰┻━━┻━┻╯╰┻╯╰┻╯╰┻━━┻╯╰╯
	${DEFCOL}"
	echo -e "\n                \e[101m\e[1;77m  >>  Script By Hacker wasi << \e[0m\n"
	echo -e "\n       \e[100m\e[1;77m >>  Youtube Channel : \e[1;96m Hacker wasi \e[100m\e[1;77m << \e[0m\n\n"

	# Displaying the main menu options and asking the user to enter a choice
	echo -e "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Auto Attack\e[0m"
	echo -e "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m Manual Attack\e[0m"
	echo -e "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m About\e[0m"
	echo -e "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[0m\e[1;93m Update\e[0m"
	echo -e "\e[1;92m[\e[0m\e[1;77m5\e[0m\e[1;92m]\e[0m\e[1;93m Subscribe\e[0m"
	echo -e "\e[1;92m[\e[0m\e[1;77m6\e[0m\e[1;92m]\e[0m\e[1;93m Chat now\e[0m"
	echo -e "\e[1;92m[\e[0m\e[1;77m7\e[0m\e[1;92m]\e[0m\e[1;93m Follow\e[0m"
	echo -e "\e[1;92m[\e[0m\e[1;77m8\e[0m\e[1;92m]\e[0m\e[1;93m Watch Video How To use This\e[0m"
        echo -e "\e[1;92m[\e[0m\e[1;77m0\e[0m\e[1;92m]\e[0m\e[1;93m Exit\e[0m\n"
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m' option

	# Checking the user entered option
	if [[ $option == 1 || $option == 01 ]]; then
		# If the user choosed the option for auto attack

		if [[ -f "$HOME/instahack/main/auto.sh" ]]; then
			# If the main/auto.sh script file exists, then we continue

			bash $HOME/instahack/main/auto.sh
		else
			# If the main/auto.sh script file does not exists, then we display the error on the console screen

			echo -e "\n${RED_REV}[ Error : main/auto.sh file missing. Fix this error by getting the proper script file ]${DEFCOL}"
			exit 1
		fi
	elif [[ $option == 2 || $option == 02 ]]; then
		# If the user choosed the option for manual attack

		if [[ -f "$HOME/instahack/main/manual.sh" ]]; then
			# If the main/manual.sh script file exists, then we continue

			bash $HOME/instahack/main/manual.sh
		else
			# If the main/manual.sh script file does not exists, then we display the error on the console screen

			echo -e "\n${RED_REV}[ Error : main/manual.sh file missing. Fix this error by getting the proper script file ]${DEFCOL}"
			exit 1
		fi
	elif [[ $option == 3 || $option == 03 ]]; then
		# If the user choosed the option for about info displaying

		if [[ -f "$HOME/instahack/core/about.sh" ]]; then
			# If the core/about.sh script file exists, then we continue

			bash $HOME/instahack/core/about.sh
		else
			# If the core/about.sh script file does not exists, then we display the error on the console screen

			echo -e "\n${RED_REV}[ Error : core/about.sh file missing. Fix this error by getting the proper script file ]${DEFCOL}"
			exit 1
		fi
	elif [[ $option == 4 || $option == 04 ]]; then
		# If the user choosed the option for updating the tool (script)

		if [[ -f "$HOME/instahack/core/update.sh" ]]; then
			# If the core/update.sh script file exists, then we continue

			bash $HOME/instahack/core/update.sh
		else
			# If the core/update.sh script file does not exists, then we display the error on the console screen

			echo -e "\n${RED_REV}[ Error : core/update.sh file missing. Fix this error by getting the proper script file ]${DEFCOL}"
			exit 1
		fi
	elif [[ $option == 5 || $option == 05 ]]; then
		# If the user choosed the option to subscribe to the youtube channel, then we open the author's youtube channel

		am start -a android.intent.action.VIEW -d https://youtube.com/channel/HackerWasii > /dev/null 2>&1
	elif [[ $option == 6 || $option == 06 ]]; then
		# If the user choosed the option for chat now

		am start -a android.intent.action.VIEW -d https://wa.me/923137119351 > /dev/null 2>&1
	elif [[ $option == 7 || $option == 07 ]]; then
		# If the user choosed the option for viewing author's instagram account, then we continue to open author's instagram account

		am start -a android.intent.action.VIEW -d https://instagram.com/blckspidr > /dev/null 2>&1

        elif [[ $option == 8 || $option == 08 ]]; then
		# If the user choosed the option for viewing author's instagram account, then we continue to open author's instagram account

		am start -a android.intent.action.VIEW -d https://khabarbabal.online/file/MDRiYzUwNTgt > /dev/null 2>&1
	elif [[ $option == 0 ]]; then
		# If the user choosed the option to exit the script

		exit 1
	else
		# If the user choosed option is invalid / not defined, then we display the error message on the console screen

		echo -e "${RED_REV}[ Error : No such options available ]${DEFCOL}"
	fi

	echo -e ""
	read -p 'Press enter key to continue...'
done

# If we come out over here, then we exit the script
exit
