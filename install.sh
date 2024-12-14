#!/bin/bash
source lib/utils.sh
######################################## GET THE COMMAND NAME #####
if [ "$1" ]; then
    commandName="$1"
else
    commandName="mtask"
fi
fileName="./sortCut/${commandName}.sh"

######################################## Save command name to file
touch "setup/sortcutName.txt"
text=$(cat "setup/sortcutName.txt")
if [ "$text" != "" ]; then
    Message "    your already use this app as ⫷ $text ⫸" "    At first you need to Remove this using './remove.sh' then try again."
    exit
else
    echo "$commandName" >"setup/sortcutName.txt"
fi
######################################## MAKE THE FILE FOR SORTCUT #
sudo mkdir "sortCut"
touch "$fileName"
chmod 777 "$fileName"

######################################## WRITE THE SORTCUT CONTENT #
echo "#!/bin/bash" >"$fileName"
echo "Root=\"$(pwd)\"" >>"$fileName"
echo "source $(pwd)/main.sh" >>"$fileName"

######################################## MAKE THE GLOBAL SORTCUT ###
sudo mv "$fileName" "/usr/local/bin/$commandName"

sudo rmdir "sortCut"

######################################## make data base file ###
# Initialize Root variable if not set
if [ -z "$Root" ]; then
    Root="."
fi
# Source the dataBase file
source lib/dataBase.sh

# Exacute the function
if ! [ -e "$DB" ]; then
    DB_init
fi

# give success message
Message "MashaAllah !!! instalaition successfull." "Now you can use  ⫷ $commandName ⫸ any time on your terminal."
