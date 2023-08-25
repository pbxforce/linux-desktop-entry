#!/bin/bash

# This script is for creating desktop entry of applications from executable or '.run' file. Simply run the script and pass the input parameters

# Help section
help_section() {
    echo
    echo "--------------Linux Desktop Entry--------------"
    cat <<EOF

- Desktop entry name: Name for the desktop application
- Executable file path: Absolute path of application executable file. Usually It's .run file
- Favicon file path: Absolute path of icon file. Usually It's located within the applicaiton installation directory. You can use PNG, ICO, and JPG files. PNG with transparent background should be preferred.

EOF
}

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]];then
    help_section
    exit 0
fi

# Main script
default_app_path="/home/$USER/.local/share/applications"
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
read -p "Icon file path: " ico_path
cat <<EOF> $shortcut_entry
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=$desktop_entry
Exec=$exec_path %U
Icon=$ico_path
Terminal=false
StartupNotify=false
EOF
if [[ `cat /home/$USER/.local/share/applications/$desktop_entry.desktop|grep Name|cut -c6-` == "$desktop_entry" ]];then
    echo "Entry file written successsfully"
else
    echo "Entry file could not be written"
    exit 1
fi
