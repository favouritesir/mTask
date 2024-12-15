#!/bin/bash
# source lib/array.sh
source lib/dataBase.sh
source lib/utils.sh
source src/actions.sh

Root="."

# DB_query "select title from tasks where title='ab c'"
# DB_query "insert into tasks (title, date) values ('alhamdulillah', '$(sqliteDateFormat "today")')"

# DB_query "select * from tasks order by id"
# DB_query "SELECT title,date FROM tasks where date = '$(sqliteDateFormat "")'"
List yesterday +2days
newArr=("${DB_Last_Result[@]}")
for ((i = 0; i < "${#DB_Last_Result[@]}"; i++)); do
    echo "${DB_Last_Result[$i]}"
done
arr=("abc" "ab c")
# echo "$(arr_includes "abc" $(DB_query "select * from tasks"))"
# echo "$(arr_includes "abc" "${arr[@]}")"
