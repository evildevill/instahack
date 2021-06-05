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
# 3. Removed the dependencies like 'lolcat' and used the ANSII color codes instead.
#

# Defining the ANSII color code variables for colored output
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"
RED_REV="\033[07;91m"
DEFCOL="\033[00m"

# The main script starts here
clear
echo -e "${YELLOW}
            __   __     _____   __       __       _____    
           /\_\ /_/\  /\_____\ /\_\     /\_\     ) ___ (   
          ( ( (_) ) )( (_____/( ( (    ( ( (    / /\_/\ \  
           \ \___/ /  \ \__\   \ \_\    \ \_\  / /_/ (_\ \ 
           / / _ \ \  / /__/_  / / /__  / / /__\ \ )_/ / / 
          ( (_( )_) )( (_____\( (_____(( (_____(\ \/_\/ /  
           \/_/ \_\/  \/_____/ \/_____/ \/_____/ )_____( ${DEFCOL}\n"
echo -e "                             ${BLUE}About us${DEFCOL}\n"
echo -e "       🙏 Hey, there I am MUHAMMAD WASIM AKRAM (W A S I), i made this tool
  to penetrate password strength In termux, so i hope guys you
                             liked it. 😘\n"
echo -e "                  ${GREEN}Our youtube channel${DEFCOL} : ${YELLOW}Hacker wasi${DEFCOL}\n"
sleep 2
