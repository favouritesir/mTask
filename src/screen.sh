#!/bin/bash
cScreen=0
Inc_used_line() { #num
    local num=$1
    _used_line="$((num + _used_line))"
}
AppScreen() {
    clear
    _used_line=0
    cScreen=0
    local cols=$(tput cols)
    local lines=$(tput lines)

    AppHeader $cols "${APP[name]}"
    AppBody $cols $lines
    AppFooter $cols "‖ ?/h ► help ‖ up/down/left/right ► nevigate ‖"
}

HelpScreenRow() { #cols, 1stcol, 2thcol
    echo -n "$(str_padEnd "$2 " "$(Width_percent $1 60)" "-")>"
    echo -n "$(str_padEnd "$3 " "$(Width_percent $1 39)")"
    echo ""
    Inc_used_line 1
}

HelpScreen() { #cols, #lines
    clear
    _used_line=0
    cScreen=2
    local cols=$(tput cols)
    local lines=$(tput lines)
    local com="$(cat "$Root/setup/sortcutName.txt")"

    AppHeader $cols "${APP[name]} HELP SCREEN #"
    echo " Quick Actions:"
    Inc_used_line 1
    HelpScreenRow $cols " $com " " Open the Application"
    HelpScreenRow $cols " $com add title date" " Create new task."
    HelpScreenRow $cols " $com get title date" " View tasks "
    HelpScreenRow $cols " $com change title new_title date" " Update a task"
    HelpScreenRow $cols " $com del title" " Delete a task"
    HelpScreenRow $cols " $com find title_substring" " Search tasks"
    HelpScreenRow $cols " $com done title" " Mark a task as completed"
    HelpScreenRow $cols " $com !done title" " Mark a task as incompleted"
    echo ""
    echo " In Application:"
    Inc_used_line 2
    HelpScreenRow $cols " [ up / down / right / left ] arrow key" " Navigate the app"
    HelpScreenRow $cols " [ insert / c / + ] key" " Create new task"
    HelpScreenRow $cols " [ e / u / > ] key" " Edit or Update"
    HelpScreenRow $cols " [ delete ] key" " Delete selected task"
    HelpScreenRow $cols " [ esc / q ] key" " Quit the Application"

    echo ""
    echo "NB: For more information see the documentation"
    echo "GitHub: https://github.com/favouritesir/mTask"
    Inc_used_line 3

    AppBody $cols $lines
    AppFooter $cols "‖ Press any key to go back ‖"
}

AppHeader() { #cols, header_text
    AppBar $1 "${APP[border_h]}"
    AppCenterH "$2" $1
    AppBar $1 "${APP[border_h]}"
    Inc_used_line 5 # with footer line 3+2=5

}
AppFooter() { #col_numbers, footer_text
    AppBar $1 "${APP[border_h]}"
    echo $2
}

AppBar() { #col_numbers, #delimiter
    echo "$(str_repeat "$2" $1)"
}

AppCenterH() { #string, #max_length,
    len=$(str_len "$1")
    if [ $len -lt $2 ]; then
        str=$(str_repeat " " "$((($2 / 2) - (len / 2)))")
        echo "$str$1$str"
    fi
}

AppBody() { #cols, #lines

    for ((i = 1; i < ($2 - _used_line); i++)); do
        echo ""
    done
}
