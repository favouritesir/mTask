#!/bin/bash

# Initialize Root variable if not set
# if [ -z "$Root" ]; then
#     Root="."
# fi

# Set DB path
DB="$Root/src/DB/tasks.db"

# Initialize the database
DB_init() {
    if ! sqlite3 "$DB" "create table if not exists tasks (
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
    results=$(sqlite3 "$DB" "$@") # Use command substitution correctly
    # Convert the result into a Bash array
    IFS=$'\n' read -r -d '' -a result_array <<<"$results"
    echo "${result_array[@]}"
}
