#!/bin/bash
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
"add" | "Create" | "new" | "+")
    [ $(Add $2 $3) -eq 1 ] && echo "MaShaAllah!!! Success." || Add_newDate $2 $3
    ;;

#--------------------------------------------------------------- Delete Task
"rm" | "del" | "remove" | "delete" | "-") source $Root/src/del.sh ;;

#--------------------------------------------------------------- Mark Task as completed or incomplete
"mark" | "set") source $Root/src/mark.sh ;;

#--------------------------------------------------------------- See Tasks
"li" | "list" | "get" | "view" | "show" | "fetch") source $Root/src/get.sh ;;

#--------------------------------------------------------------- Update Task
"update" | "edit") source $Root/src/update.sh ;;

#--------------------------------------------------------------- Search Tasks
"search" | "find") source $Root/src/find.sh ;;

#--------------------------------------------------------------- show available commands
"help" | "h") source $Root/src/help.sh ;;

#--------------------------------------------------------------- Show the Application
*) source $Root/src/app.sh ;;

esac

shopt -u nocasematch # end case insensitive mode
