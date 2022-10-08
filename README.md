# Kali-Linux-UpdateScript

  This is a bash script that was created to automate the update/upgrade process for my Kali Linux machine. The script by default runs an update command. Afterwards, it provides a detailed menu explaining the various upgrade options and what each one does. After you have chosen your upgrade method it will run the corresponding command and by default complete an autoremove to clean up any obsolete packages.


CONFIGURATION:
Following the steps below will allow you to call the script by entering sudo bash update.sh from any directory within the terminal. 


1. Create a scripts directory in the system wherever you would like 
2. Download or copy the script onto your system and place it into the scripts directory
3. Open terminal and run the following commands
4. sudo nano ~/.bashrc
5. At the bottom of the file enter: PATH="~/scripts:$PATH"
6. Restart terminal 
