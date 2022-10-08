#!/bin/bash

YELL="\033[1;33m"
ENDC="\033[0m"
RED="\033[1;31m"
PURP="\033[1;35m"
BLUE="\033[1;34m"
x=0

function menu(){

	echo -ne $YELL"\n-----------------------------------\n"
	echo -ne "Please select upgrade preference\n"
	echo -ne "Option 1:"$PURP" Upgrade\n"$BLUE
	echo -ne "\nThis will download and update packages without deleting anything previously installed on your system\n"$YELL
	echo -ne "\nOption 2:"$PURP" Full-Upgrade\n"$BLUE
	echo -ne "\nThis will download and update packages but also remove already installed packages if needed\n"$YELL
	echo -ne "\nOption 3:"$PURP" Dist-Upgrade\n"$BLUE 
	echo -ne "\nThis will complete the same function as regular upgrade with added benefit of handling changing dependencies, removing obsolete packages, and adding new ones\n"$YELL
	echo -ne "------------------------------------------\n"

	echo -ne "\nWhat Upgrade method are you performing? "
	read x


	if [ $x = 1 ];
		then
			upGrade
		elif [ $x = 2 ];
		then
			fullUpgrade
		elif [ $x = 3 ];
		then
			distUpgrade
		else
			wrongInput	
		fi;
}

function wrongInput(){
	echo -ne $RED"\n\nYou have not provided an appropriate input. Please Select either 1, 2, or 3 "$ENDC
	read x
	
	if [ $x = 1 ];
		then
			upGrade
		elif [ $x = 2 ];
		then
			fullUpgrade
		elif [ $x = 3 ];
		then
			distUpgrade
		else
			wrongInput	
		fi;
}
	
function upGrade(){
	echo -ne $YELL"\n---------------------------------\n"
	echo -ne "Performing sudo apt-get upgrade\n"
	echo -ne "-------------------------------\n\n"$RED
	sudo apt-get upgrade -y	
	echo -ne $YELL"\n\nDistribution upgrade complete\n"$ENDC
	cleanUp
}
	
function distUpgrade(){
	echo -ne $YELL"\n---------------------------------------\n"
	echo -ne "Performing sudo apt-get dist-upgrade\n"
	echo -ne "---------------------------------------\n\n"$RED
	sudo apt-get dist-upgrade -y
	echo -ne $YELL"\n\nDistribution upgrade complete\n"$ENDC
	
	cleanUp
}

function fullUpgrade(){
	echo -ne $YELL"\n-------------------------------\n"
	echo -ne "Performing sudo apt-get full-upgrade\n"
	echo -ne "--------------------------------------\n\n"$RED
	sudo apt-get full-upgrade -y
	echo -ne $YELL"\n\nFull upgrade complete\n"$ENDC
	
	cleanUp
}

function cleanUp(){
	echo -ne $YELL"\n-----------------------------------\n"
	echo -ne "Cleaning up obsolete packages\n"
	echo -ne "------------------------------------\n\n"$RED
	sudo apt autoremove -y
	echo -ne $YELL"\nThe script has finalized the last task\n"$ENDC
}

function upDate(){
	echo -ne $YELL"\n-----------------------------------"
	echo -ne "\nInitializing the Update Sequence\n"
	echo -ne "-----------------------------------\n\n"$RED
	sudo apt-get update
	menu
}

function preReqCheck(){
	if [ "$EUID" != 0 ]; 
	then
        	echo -e "\e[1;41m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ \e[1;m"
        	echo -e "\e[1;41m@@@@@@@@@@ SUDO IS NEEDED FOR THIS SCRIPT @@@@@@@@@@ \e[1;m"
        	echo -e "\e[1;41m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ \e[1;m\n\n"
	exit
	fi

	echo -ne $YELL"\n-----------------------------------"
	echo -ne "\nChecking if user is running Kali Linux\n"
	echo -ne "-----------------------------------\n\n"$RED

	os=$(grep '^ID=' /etc/os-release | cut -d '=' -f2 | tr -d '"')

	if [ "$os" != "kali" ]; 
	then
		echo -ne $YELL"\n-----------------------------------"
		echo -ne $RED"\nYou are not running Kali Linux!\n"
		echo -ne $YELL"-----------------------------------\n\n"$ENDC
	exit
	else
		echo -ne $YELL"\nProceeding with Update Script\n"$ENDC
		upDate	
	fi;
}


preReqCheck
