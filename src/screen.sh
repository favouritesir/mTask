#!/bin/bash
Inc_used_line() { #num
    local num=$1
    _used_line="$((num + _used_line))"
}
AppScreen() {
    clear
    _used_line=0
    local cols=$(tput cols)
    local lines=$(tput lines)

    AppHeader $cols
    AppBody $cols $lines
    AppFooter $cols
}

HelpScreenHeader() { #cols
    echo -n "$(AppCenterH "Actions" "$(Width_percent $1 20)")|"
    echo -n "$(AppCenterH "Details" "$(Width_percent $1 80)")"
    echo ""
    Inc_used_line 1
}
HelpScreenRow() { #cols, Actions, Details
    echo -n "$(AppCenterH "$2" "$(Width_percent $1 20)")|"
    echo -n "$(str_padEnd "$3" "$(Width_percent $1 80)")"
    echo ""
    Inc_used_line 1
}

HelpScreen() { #cols, #lines
    AppBar $1 "${APP[divider]}"
    HelpScreenHeader $1
    AppBar $1 "${APP[divider]}"

    HelpScreenRow $1 " open" " Opens the current applications"

    Inc_used_line 3
}

AppHeader() { #cols, #lines
    AppBar $1 "${APP[border_h]}"
    AppCenterH "${APP[name]}" $1
    AppBar $1 "${APP[border_h]}"
    Inc_used_line 5 # with footer line 3+2=5

}
AppFooter() { #col_numbers
    AppBar $1 "${APP[border_h]}"
    echo "‖ ? ► help ‖ up/down/left/right ► nevigate ‖ enter ► Edit / OK ‖"
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
    HelpScreen $1 $2

    for ((i = 1; i < ($2 - _used_line); i++)); do
        echo ""
    done
}
