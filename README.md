# Kali-Linux-UpdateScript

  This is a bash script that was created to automate the update/upgrade process for my Kali Linux machine. The script by default runs an update command. Afterwards, it provides a detailed menu explaining the various upgrade options and what each one does. After you have chosen your upgrade method it will run the corresponding command and by default complete an autoremove to clean up any obsolete packages.


CONFIGURATION:
Following the steps below will allow you to call the script by simply typing sudo update from any directory within the terminal. 


1. Download or copy the script onto your system
2. Ensure permissions are properly set: chmod 555 update.sh
3. Move the file to your /bin directroy: mv workingdirectory/update.sh /bin/update
4. Edit the bash to include necessary path: sudo nano ~/.bashrc
5. Scroll to the bottom and add: PATH=$PATH:~/bin
6. Test the script by running update, then sudo update
