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
- favicon-file-absolute-path: Full path of icon file. Usually It's located within the applicaiton installation directory. You can use PNG, ICO, and JPG format. PNG with transparent background should be preferred.

EOF
}

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]];then
    help_section
    exit 0
fi
shortcut_entry="/home/$4/.local/share/applications/$1.desktop"
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
Exec=$2 %U
Icon=$3
Terminal=false
StartupNotify=false
EOF
if [[ `cat /home/$USER/.local/share/applications/$1.desktop|grep Name|cut -c6-` == "$1" ]];then
    echo "Entry file written successsfully"
else
    echo "Entry file could not be written"
    exit 1
fi
