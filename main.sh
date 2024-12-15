#!/bin/bash
#check password
$(sudo echo "")

# Initialize Root variable if not set
if [ -z "$Root" ]; then
    Root="."
fi
################################################################ libraries #
source $Root/lib/string.sh
source $Root/lib/array.sh
source $Root/lib/utils.sh
source $Root/lib/dataBase.sh
source $Root/lib/resize.sh

source $Root/src/settings.sh
source $Root/src/screen.sh
source $Root/src/actions.sh

############################################################### get flags #

# while getopts ":d" opt; do
#     case $opt in
#     d) f_date="$OPTARG" ;;
#     \?)
#         # echo "Invalid option: -$OPTARG"
#         ;;
#     esac
# done

################################################################ actions #
shopt -s nocasematch # start case insensitive mode

case "$1" in
#--------------------------------------------------------------- Add New Task
"add" | "create" | "new" | "+")
    [ $(Add "$2" "$3") -eq 1 ] && echo "MaShaAllah!!! Success." || Add_newDate $2 $3
    ;;

#--------------------------------------------------------------- Delete Task
"rm" | "del" | "remove" | "delete" | "-") echo "you want to remove somthing" ;;

#--------------------------------------------------------------- Mark Task as completed or incomplete
"done" | "complete" | ">") echo "you want to mark something as done " ;;
"!done" | "!complete" | "<") echo "you want to mark something as not done" ;;

#--------------------------------------------------------------- See Tasks
"li" | "list" | "get" | "fetch" | "for") List $2 $3 ;;

#--------------------------------------------------------------- Update Task
"update" | "change" | "up" | "=" | "edit") echo "you want to update" ;;

#--------------------------------------------------------------- Search Tasks
"s" | "search" | "find" | ".") echo "you want to find" ;;

#--------------------------------------------------------------- show available commands
"help" | "h" | "?")
    HelpScreen
    char="$(getch)"
    ;;

#--------------------------------------------------------------- Show the Application
*) source $Root/src/app.sh ;;

esac

shopt -u nocasematch # end case insensitive mode
