#!/bin/bash

YELL="\033[1;33m"
ENDC="\033[0m"
RED="\033[1;31m"
PURP="\033[1;35m"
BLUE="\033[1;34m"
x = 0

if [ "$EUID" != 0 ]; then
        echo -e "\e[1;41m @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
        echo -e " @@@@@@@@@@ SUDO IS NEEDED FOR THIS SCRIPT @@@@@@@@@@ "
        echo -e " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ \e[1;m\n\n"
		exit
fi

echo -ne $YELL"\n-----------------------------------"
echo -ne "\nChecking If running Kali Linux\n"
echo -ne "-----------------------------------\n\n"$RED

os=$(grep '^ID=' /etc/os-release | cut -d '=' -f2 | tr -d '"')

if [ "$detected_os" != "kali" ]; then
	echo -ne $YELL"\n-----------------------------------"
	echo -ne $RED"\nYou aren't running Kali Linux!\n"
	echo -ne $YELL"-----------------------------------\n\n"$ENDC

	exit
fi

echo -ne $YELL"\n-----------------------------------"
echo -ne "\nInitializing the Update Sequence\n"
echo -ne "-----------------------------------\n\n"$RED


sudo apt-get update

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
		echo -ne $YELL"\n---------------------------------\n"
		echo -ne "Performing sudo apt-get upgrade\n"
		echo -ne "-------------------------------\n\n"$RED
		sudo apt-get upgrade -y

		echo -ne $YELL"\n--------------------------------\n"
		echo -ne "Cleaning up obsolete packages\n"
		echo -ne "-------------------------------\n\n"$RED
		sudo apt autoremove -y
		echo -ne $YELL"\nUpgrade Complete\n\n"$ENDC;

	elif [ $x = 2 ];
	then
		echo -ne $YELL"\n-------------------------------\n"
		echo -ne "Performing sudo apt-get full-upgrade\n"
		echo -ne "--------------------------------------\n\n"$RED
		sudo apt-get full-upgrade -y

		echo -ne $YELL"\n------------------------------------\n"
		echo -ne "Cleaning up obsolete packages\n"
		echo -ne "-----------------------------------\n\n"$RED
		sudo apt autoremove -y
		echo -ne $YELL"\nfull-upgrade complete\n\n"$ENDC;

	elif [ $x = 3 ];
	then
		echo -ne $YELL"\n---------------------------------------\n"
		echo -ne "Performing sudo apt-get dist-upgrade\n"
		echo -ne "---------------------------------------\n\n"$RED
		sudo apt-get dist-upgrade -y

		echo -ne $YELL"\n-----------------------------------\n"
		echo -ne "Cleaning up obsolete packages\n"
		echo -ne "------------------------------------\n\n"$RED
		sudo apt autoremove -y
		echo -ne $YELL"\ndist-upgrade complete\n\n"$ENDC;
	else
		echo -ne $RED"\nYou have not provided an appropriate input. Re-run the script and try again\n"$ENDC
	fi;

