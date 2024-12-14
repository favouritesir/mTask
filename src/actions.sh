#!/bin/bash
Add() {
    if $(arr_includes "$1" $(DB_query "SELECT title FROM tasks")); then
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
