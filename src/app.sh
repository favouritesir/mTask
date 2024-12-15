#!/bin/bash

QuiteApp() {
    if [[ -v Resize_pid ]]; then
        if ((Resize_pid > 0)); then
            kill $Resize_pid
        fi
    else
        echo "Variable 'var' is not defined."
    fi
    exit 0

}

handleMenue() {
    while true; do
        local char="$(getch)"
        case "$cScreen" in
        "0")
            case $char in

            "up") AppScreen "$char" ;;
            "down") AppScreen "$char" ;;
            "?" | "h") HelpScreen ;;
            "q") QuiteApp "$char" ;;
            *) AppScreen $char ;;

            esac
            ;;
        "2")
            case "$char" in
            *) AppScreen "$char" ;;
            esac
            ;;
        esac
    done
}

################################################################ Set Background Service
Watch_terminal_size AppScreen &
Resize_pid=$!

################################################################ Show the Application
AppScreen
handleMenue
