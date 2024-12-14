#!/bin/bash
file="setup/sortcutName.txt"
text=$(cat "$file")
if [ "$text" = "" ]; then
    echo "Sorry app not Found"
else
    read -p "Are you sure you want to uninstall (y/n)?: " confirm
    if [ $confirm = "y" ]; then
        sudo rm "/usr/local/bin/$text"
        echo "" >$file
        echo "MashaAllah!!! we successfully remove the application"
    fi
fi
