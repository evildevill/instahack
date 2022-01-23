#!/bin/bash
# update.sh - InstaHack
#
# The shell / bash script that updates the InstaHack tool that had already been set up in your computer system. It just fetches te newer version of the project's repository at the github mirror (https://github.com/evildevill/instahack/). The script can be launched directly, but the codes are written in such a way that the script can only be used inside the main script file for the tool i.e., 'instahack.sh'.
#
# Author : Wasim Akram (https://github.com/evildevill/)
# Created on : June 28, 2020
#
# Last modified by : Rishav Das (https://github.com/rdofficial/)
# Last modified on : May 10, 2021
#
# Changes made in the last modification :
# 1. Adding commented docs and more comments to the script's code in order to make it more clean and easily readable to the programmers and other hackers.
# 2. Removing some errors and also adding more proper output and specially the colored output system.
# 3. Also, we removed the declaration and use of the two user-defined functions here. They were just uselessly defined and were consuming computer's memory while runtime. That's why, they are replaced with the plain running of the codes. And, for a proper flow of the codes, we used many if..elif..else conditional statements within the script.
#

# The main script starts here
#
# First we will check wheter there are newer updates to the script or not, and then proceeds to download all the updates on the github mirror of the project's repository.

if wget --spider https://raw.githubusercontent.com/evildevill/instahack/master/update.v4.0 2>/dev/null; then
	# If there are updates of the tool available, then we continue to fetch all the updates

	# Displaying the new update message as well as the options of choices on the console screen
	clear
	echo -e "\n\n\n\n\e[92m                 INSTAHACK NEW UPDATE V1.4 IS AVAILABLE\e[0m"
	echo -e "\e[96m                ╔═══════════════════════════════════╗\e[0m"
	echo -e "\e[96m                ║  \e[93mINSTAhack\e[96m Update Is avaialbe\e[93m V1.3\e[96m   ║\e[0m"
	echo -e "\e[96m                ║    To Update The \e[93mInstaHack\e[96m Tool      ║\e[0m"
	echo -e "\e[96m                ║                                   ║\e[0m"
	echo -e "\e[96m                ║         Select \e[92my\e[96m to update\e[96m        ║\e[0m"
	echo -e "\e[96m                ║                (\e[93mOR\e[96m)               \e[96m║\e[0m"
	echo -e "\e[96m                ║        Select \e[91mt\e[96m to terminate\e[96m      ║\e[0m"
	echo -e "\e[96m                ╚═══════════════════════════════════╝\e[0m\n\n\n\n"
	
	# Asking the user to enter a choice and then executing the task as per user choice
	echo -en "\e[32mEnter your choice [\e[93my/\e[93mt\e[32m]\e[96m: \e[0m"
	read choice
	if [[ $choice == "y" ]]; then
		# If the user choosed the option to update, then we continue the process

		# Removing the existing tool's project folder that exists in the home directory of the user
		clear
		cd $HOME
		if [[ -d insthack ]]; then
			# If the project's folder (instahack/) already exists in the home directory of the user, then we continue to delete it

			rm -rf instahack
		else
			# If the project's folder (instahack/) does not exists in the home directory of the user, then we skip the step

			printf ""
		fi
		echo -e ""

		# Displaying the 'updating' message on the console screen
		echo -e "         \e[96mUPDATE IS GOING ON, PLEASE WAIT FOR A WHILE...!\e[0m\n"
		printf "                     \e[96m["

		# Fetching the github mirror of the project's repository to the local machine. Also we are implementing the while loop with it in order to display a downloading 
		while git clone https://github.com/evildevill/instahack 2> /dev/null; do 
			printf  "\e[92m▓▓▓▓▓▓▓▓▓▓▓▓▓\e[0m"
			sleep 0.5
		done

		# Displaying the message of update successfull on the console screen
		echo -e "\n\n\e[96m                  UPDATE SUCCESSFULL (v1.3)..!\e[0m"
		sleep 0.5

		# Moving inside the project's folder and launching the setup of the tool again
		cd $HOME/instahack
		bash setup
	elif [[ $choice = "t" ]]; then
		# If the user entered the option to terminate the update

		clear
		echo -e "                   \e[96mUPDATE TERMINATED......!\e[0m"
		sleep 1.5
	else
		# If the user entered option is not recognized, then we display the error message on the console screen and then relaunch the tool

		clear
		echo -e "                   \e[96mREBOOTING INSTAHACK......!\e[0m"
		sleep 1.5
		cd $HOME/instahack
		bash instahack.sh
	fi
else
	# If there are no new updates for the tool, then we print the message for no new updates and continue
	
	clear
	echo -e "\n\n\n\n"
	echo -e "\e[92m          INSTAHACK UPDATED V1.2 \e[91mNO UPDATES AVAILABLE FOR NOW...!\e[92m\e[0m"
	echo -e "\e[96m                ╔═══════════════════════════════════╗\e[0m"
	echo -e "\e[96m                ║       \e[93mInstaHack[96m Upto date\e[93m V1.2\e[96m        ║\e[0m"
	echo -e "\e[96m                ║        No Updates \e[93mRolled Out\e[96m      ║\e[0m"
	echo -e "\e[96m                ║                                   ║\e[0m"
	echo -e "\e[96m                ╚═══════════════════════════════════╝\e[0m\n\n\n\n"
	sleep 5.0
fi
