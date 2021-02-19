#bin/bash
#script By Hacker wasii
#The real creator of core files is not us so the credits 
#Goes to real author
#colours
#####3#3#
check(){
if wget --spider https://raw.githubusercontent.com/noob-hackers/instahack/master/update.v1.3 2>/dev/null; then
cd $HOME/instahack/core
echo "ig" > update.txt
else
echo
fi
}
check
option(){
if [ -f "$HOME/instahack/core/update.txt" ];then
cd $HOME/instahack/core
bash update.sh
else
echo " "
fi
}
option
check1(){
if wget --spider https://raw.githubusercontent.com/noob-hackers/patchupdateznh/main/instahack.v.1 2>/dev/null; then
cd $HOME/instahack/core
echo "igg" > patch.txt
else
echo
fi
}
check1
option1(){
if [ -f "$HOME/instahack/core/patch.txt" ];then
cd $HOME/instahack/core
bash patch.sh
else
echo " "
fi
}
red='\033[1;31m'
rset='\033[0m'
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'
#coding section starts :)
clear
echo 
torser="tor"
if pgrep -x "$torser" >/dev/null
then
echo#do nothing
else
echo -e "\e[91mTOR\e[96m IS NOT RUNNING, PLEASE START TOR IN A NEW SESSION
          BY TYPING\e[92m tor\e[96m AND START instahack AGAIN\e[0m "
exit 1
fi
echo '
   ╭━━╮╱╱╱╱╱╭╮╱╱╱╭╮╱╱╱╱╱╱╱╭╮
   ╰┫┣╯╱╱╱╱╭╯╰╮╱╱┃┃╱╱╱╱╱╱╱┃┃
   ╱┃┃╭━╮╭━┻╮╭╋━━┫╰━┳━━┳━━┫┃╭╮
   ╱┃┃┃╭╮┫━━┫┃┃╭╮┃╭╮┃╭╮┃╭━┫╰╯╯
   ╭┫┣┫┃┃┣━━┃╰┫╭╮┃┃┃┃╭╮┃╰━┫╭╮╮
   ╰━━┻╯╰┻━━┻━┻╯╰┻╯╰┻╯╰┻━━┻╯╰╯
' |lolcat
printf "\n"
printf "                \e[101m\e[1;77m  >>  Script By Hacker wasi << \e[0m\n"
printf "\n"
printf "       \e[100m\e[1;77m >>  Youtube Channel : \e[1;96m Hacker wasi \e[100m\e[1;77m << \e[0m\n"
printf "\n"
echo 

printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Auto Attack\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m Manual Attack\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m About\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[0m\e[1;93m Update\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m5\e[0m\e[1;92m]\e[0m\e[1;93m Subscribe\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m6\e[0m\e[1;92m]\e[0m\e[1;93m Chat now\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m7\e[0m\e[1;92m]\e[0m\e[1;93m Follow\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m8\e[0m\e[1;92m]\e[0m\e[1;93m Exit\e[0m\n"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m' option


if [[ $option == 1 || $option == 01 ]]; then
cd $HOME/instahack/main
bash auto.sh
elif [[ $option == 2 || $option == 02 ]]; then
cd $HOME/instahack/main
bash manual.sh
elif [[ $option == 3 || $option == 03 ]]; then
cd $HOME/instahack/core
bash about.sh
elif [[ $option == 4 || $option == 04 ]]; then                                                             
cd $HOME/instahack/core
bash update.sh
elif [[ $option == 5 || $option == 05 ]]; then
am start -a android.intent.action.VIEW -d https://youtube.com/channel/UC9L82byLSAXUKCJXc9zrnlQ
elif [[ $option == 6 || $option == 06 ]]; then
am start -a android.intent.action.VIEW -d https://wa.me/923137119351
elif [[ $option == 7 || $option == 07 ]]; then
am start -a android.intent.action.VIEW -d https://instagram.com/blckspidr
elif [[ $option == 8 ]]; then
exit 1
else
echo
printf "\e[1;93m [>!<] Invalid Selection!\e[0m\n"
sleep 0.6
echo
clear
exit
bash instahack.sh
