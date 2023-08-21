#!/bin/bash

# This script is for creating desktop entry of applications from run file.
# Simply run the script with sudo privileges and pass the input parameters

default_app_path="/usr/share/applications"
read -p "Desktop entry name: " desktop_entry
shortcut_entry="$default_app_path/$desktop_entry.desktop"
touch $shortcut_entry
if [[ -e $shortcut_entry ]];then
    echo "Desktop entry created"
else
    echo "Unable to create desktop entry"
    exit 1
fi
read -p "Executable file path: " exec_path
read -p "Favicon file path: " ico_path
cat <<EOF> $shortcut_entry
[Desktop Entry]
Version=1.0
Type=Application
Name=$desktop_entry
Exec=sudo $exec_path
Icon=$ico_path
Terminal=false
StartupNotify=false
EOF
if [[ `cat /usr/share/applications/xampp.desktop|grep Name|cut -c6-` == "$desktop_entry" ]];then
    echo "Entry file written successsfully"
else
    echo "Entry file could not be written"
    exit 1
fi
read -p "System username: " sys_user
echo "$sys_user ALL=NOPASSWD: $exec_path" >> /etc/sudoers
if [[ `cat /etc/sudoers|tail -n 1|awk '{print$1}'` == "$sys_user" ]];then
    echo "DONE!!"
else
    echo "Unable to add permission for user"
    exit 1
fi
