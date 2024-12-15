#!/bin/bash
Add() { #title, date
    DB_query "SELECT title FROM tasks where title = '$1'"
    if [[ ${#DB_Last_Result[@]} -gt 0 ]]; then
        echo "0"
    else
        DB_query "insert into tasks (title, date) values ('$1', '$(sqliteDateFormat "$2")')"
        echo "1"
    fi
}

Add_newDate() {

    echo "Sorry, task already exists."
    echo "Do you want to update date? (y/n): "
    local char="$(getch)"
    case "$char" in
    y)
        DB_query "update tasks set date = '$(sqliteDateFormat "$2")' where title = '$1'"
        echo "MashaAllah!!! Successfully update date"
        ;;
    esac

}

List() { #date1, date 2

    if [[ $2 ]]; then
        date1="$(sqliteDateFormat "$1")"
        date2="$(sqliteDateFormat "$2")"
    else
        date1="$(sqliteDateFormat "today")"
        date2="$(sqliteDateFormat "$1")"
    fi

    if [[ $date1 > date2 ]]; then
        temp=$date1
        date1=$date2
        date2=$temp
    fi

    # echo "Tasks between "$date1" and "$date2":"

    DB_query "SELECT title, date, completed FROM tasks where date between '$date1' and '$date2' order by date ASC"

    for ((i = 0; i < "${#DB_Last_Result[@]}"; i++)); do
        echo "${DB_Last_Result[$i]}"
    done
}
