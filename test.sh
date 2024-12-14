#!/bin/bash

# ডাটাবেস ফাইলের নাম
DB_FILE="src/DB/test.db"

# টেবিল তৈরি ফাংশন
create_table() {
    sqlite3 $DB_FILE "CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL,
        email TEXT NOT NULL
    );"
    echo "Table 'users' created or already exists."
}

# ডাটাবেসে ডাটা সংযোজন
insert_data() {
    read -p "Enter Name: " name
    read -p "Enter Age: " age
    read -p "Enter Email: " email

    sqlite3 $DB_FILE "INSERT INTO users (name, age, email) VALUES ('$name', $age, '$email');"
    echo "Data inserted successfully."
}

# ডাটাবেস থেকে ডাটা পড়া
read_data() {
    sqlite3 $DB_FILE "SELECT * FROM users;" | while read -r row; do
        echo "$row"
    done
}

# ডাটাবেসে ডাটা আপডেট
update_data() {
    read -p "Enter User ID to update: " user_id
    read -p "Enter new Name: " name
    read -p "Enter new Age: " age
    read -p "Enter new Email: " email

    sqlite3 $DB_FILE "UPDATE users SET name = '$name', age = $age, email = '$email' WHERE id = $user_id;"
    echo "Data updated successfully."
}

# ডাটাবেস থেকে ডাটা মুছা
delete_data() {
    read -p "Enter User ID to delete: " user_id
    sqlite3 $DB_FILE "DELETE FROM users WHERE id = $user_id;"
    echo "Data deleted successfully."
}

# মেনু দেখানো
show_menu() {
    echo "Choose an operation:"
    echo "1. Create Table"
    echo "2. Insert Data"
    echo "3. Read Data"
    echo "4. Update Data"
    echo "5. Delete Data"
    echo "6. Exit"
}

# মূল ফাংশন
main() {
    while true; do
        show_menu
        read -p "Enter your choice: " choice
        case $choice in
        1) create_table ;;
        2) insert_data ;;
        3) read_data ;;
        4) update_data ;;
        5) delete_data ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *) echo "Invalid choice. Please try again." ;;
        esac
    done
}

# স্ক্রিপ্ট শুরু
main
