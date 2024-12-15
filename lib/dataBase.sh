#!/bin/bash

# Initialize Root variable if not set
if [ -z "$Root" ]; then
    Root="."
fi

# Set DB path
DB_File="$Root/src/DB/tasks.db"
declare -A DB_Last_Result

# Initialize the database
DB_init() {
    if ! sqlite3 "$DB_File" "create table if not exists tasks (
        id integer primary key autoincrement,
        title text not null,
        date text,
        completed boolean default false
    );"; then
        echo "Failed to initialize the database."
        exit 1
    fi
}

# Execute a query on the DB
DB_query() {
    results=$(sqlite3 "$DB_File" "$@") # Use command substitution correctly
    # Convert the result into a Bash array
    IFS=$'\n' read -r -d '' -a result_array <<<"$results"
    local i=0
    DB_Last_Result=()

    for row in "${result_array[@]}"; do
        DB_Last_Result[$i]="$row"
        i="$((i + 1))"
    done
    # unset IFS
    # DB_Last_Result=("${result_array[@]}")

    # echo "${result_array[@]}"
}
