#!/bin/bash

icons=(▢ ▣ ■ ▥ ▦ ▤ □ ▧ ▨ ▩ ● ▶ ◙ ◌ ○ ◍ ◐ ◕ ◔ ● ◉ ○ ► ⋊ ⋉ ⫸ ⫷ © ☘ 🍀 🌿 🌾 🌳 🏵 🍓 ❌ ⭕ ⛔ 🛑 ✅ ❎ 💠 🔰 💯 ♻ 🔳 💭)
arrow=(⇨ ⇦ ⇧ ⇩)
important=(🟠 🔴 🟡 🔵 🟣 🟤 🟢 ⚫ ⚪)
important_sqr=(🟥 🟧 🟨 🟦 🟪 🟫 🟩 ⬛ ⬜)

sqliteDateFormat() {
    echo "$(date -d "$1" +"%Y-%m-%d")"
}
Width_percent() { #max_length,#percentage
    echo "$((($1 * $2) / 100))"
}
Message() {
    echo ""
    echo "▦ Message:"
    echo "    $1"
    echo ""
    echo "▦ Hints:"
    echo "    $2"
}
getch() {

    local res

    # Read the first character
    read -rsn1 char

    # Get ASCII code of the first character
    ascii_code=$(printf "%d" "'$char")

    if [ "$ascii_code" -eq 27 ]; then

        # Read the other character
        read -rsn1 char2
        read -rsn1 char3

        # Check the sequence
        if [[ "$char2" == "[" ]]; then
            case "$char3" in
            "A") res="up" ;;
            "B") res="down" ;;
            "C") res="right" ;;
            "D") res="left" ;;
            "H") res="home" ;;
            "F") res="end" ;;
            "5")
                read -rsn1 char4
                res="pgup"
                ;;
            "6")
                read -rsn1 char4
                res="pgdown"
                ;;
            "3")
                read -rsn1 char4
                res="del"
                ;;
            "2")
                read -rsn1 char4
                res="insert"
                ;;
            *) echo "$char$char2$char3" ;;
            esac
        else
            res="esc"
        fi
    elif [ "$ascii_code" -eq 8 ]; then
        res="backspace"
    else
        res="$char"
    fi

    echo "$res"

}
