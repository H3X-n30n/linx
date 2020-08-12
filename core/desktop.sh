#!/bin/bash

# Colors FGBG
R=`echo "\033[31m"` RE=`echo "\033[41m"`
G=`echo "\033[32m"` GR=`echo "\033[42m"`
Y=`echo "\033[33m"` YE=`echo "\033[43m"`
B=`echo "\033[34m"`
C=`echo "\033[36m"`
r=`echo "\033[0m"`

de_main(){
    printf "\n${G} ╭───────────────────╮"
	printf "\n${G} │DESKTOP ENVIRONMENT│"
	printf "\n${G} ├───────────────────┤"
	printf "\n${G} │${B}[1]${C} XFCE           ${G}│"
	printf "\n${G} │${B}[2]${C} LXDE           ${G}│"
	printf "\n${G} │${B}[3]${C} LXQT           ${G}│"
	printf "\n${G} ├───────────────────┤"
	printf "\n${G} │${B}[B]${Y} Back           ${G}│"
	printf "\n${G} ├───────────────────╯"
	printf "\n${G} ╰─┤${B}Select:${r} "
	read de
}

EXPORT="linx_main"

option_picked(){
    msgcolor=`echo "\033[01;31m"`
    normal=`echo "\033[00;00m"`
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

de_main
while [ '$de' != '' ]
    do
    if [ $de = '' ]; then
      exit;
    else
      case $de in
        1) clear;
            option_picked " [::] Checking...";
			sleep 2
			file=./install
            if [ -e "$file" ]; then
                echo "  File found!"
				echo " No need to install!"
				sleep 3
				de_main;
            else 
                echo "File does not exist"
				de_main;
            fi 
			 ;;
	    2) clear;
            option_picked "installing...";
			sleep 2
			clear
			printf "Installed!\n";
			sleep 2
			exit
			 ;;
		3) clear;
            option_picked "installing...";
			sleep 2
			clear
			printf "Installed!\n";
			sleep 2
			exit
			 ;;
		b) clear;
			sleep 2
			linx_main;
			break
			 ;;
	    \n)exit;
        ;;
        *)clear;
            option_picked "Invalid option:${Y}$de";
			sleep 2
			clear
            de_main;
        ;;
      esac
    fi
done