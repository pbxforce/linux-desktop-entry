#!/bin/bash

# This script is for creating desktop entry of applications from run file.
# Help parameters
help_section() {
    echo
    echo "--------------Linux Desktop Entry--------------"
    echo
    echo "Sytax: sudo bash desktop_entry_arg.sh <set-name> <executable-file-absolute-path> <path-to-app-favicon-file> <username>"
    cat <<EOF

- set-name: Name for the desktop application
- executable-file-absolute-path: Full path of application executable file. Usually It's .run file
- favicon-file-absolute-path: Full path of favicon file. Usually It's located within the applicaiton installation directory. Use .ico file only
- system-username: Name of the user who will be using this desktop entry

EOF
}

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]];then
    help_section
    exit 0
fi
shortcut_entry="/usr/share/applications/$1.desktop"
touch $shortcut_entry
if [[ -e $shortcut_entry ]];then
    echo "Desktop entry created"
else
    echo "Unable to create desktop entry"
    exit 1
fi
cat <<EOF> $shortcut_entry
[Desktop Entry]
Version=1.0
Type=Application
Name=$1
Exec=sudo $2
Icon=$3
Terminal=false
StartupNotify=false
EOF
if [[ `cat /usr/share/applications/xampp.desktop|grep Name|cut -c6-` == "$1" ]];then
    echo "Entry file written successsfully"
else
    echo "Entry file could not be written"
    exit 1
fi
echo "$4 ALL=NOPASSWD: $2" >> /etc/sudoers
if [[ `cat /etc/sudoers|tail -n 1|awk '{print$1}'` == "$4" ]];then
    echo "DONE!!"
else
    echo "Unable to add permission for user"
    exit 1
fi
