#!/bin/bash

# This script is for creating desktop entry of applications from run file.
# Syntax is: desktop_entry.sh <set-name> <path-to-app-run-file> <path-to-app-favicon-file> <username>

echo "Creating desktop entry..."
shortcut_entry="/usr/share/applications/$1.desktop"
touch $shortcut_entry
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
echo "Assigning permissions..."
echo "$4 ALL=NOPASSWD: $2" >> /etc/sudoers
echo "DONE"
