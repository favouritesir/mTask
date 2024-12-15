#!/bin/bash

# 1. String Length (JS: `str.length`)
str_len() {
    local str=$1
    echo ${#str}
}

# 2. Substring (JS: `str.substring(start, end)`)
str_substring() {
    echo "${1:$2:$3}"
}

# 3. Convert to Uppercase (JS: `str.toUpperCase()`)
str_toUpperCase() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
}

# 4. Convert to Lowercase (JS: `str.toLowerCase()`)
str_toLowerCase() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

# 5. Trim (JS: `str.trim()`)
str_trim() {
    echo "$1" | xargs
}

# 6. Replace (JS: `str.replace(search, replace)`)
str_replace() {
    echo "$1" | sed "s/$2/$3/g"
}

# 7. Starts With (JS: `str.startsWith(prefix)`)
str_startsWith() {
    [[ "$1" == "$2"* ]] && echo "true" || echo "false"
}

# 8. Ends With (JS: `str.endsWith(suffix)`)
str_endsWith() {
    [[ "$1" == *"$2" ]] && echo "true" || echo "false"
}

# 9. Includes (JS: `str.includes(substring)`)
str_includes() {
    [[ "$1" == *"$2"* ]] && echo "true" || echo "false"
}

# 10. Split (JS: `str.split(delimiter)`)
str_split() {
    local string="$1"  # Input string
    local delimiter=$2 # Delimiter (can be a single character or regex-like string)
    local result=()    # Declare an empty array to hold the result
    echo "${delimiter:0:1}"
    if [[ "${delimiter:0:1}" == '\' ]]; then
        echo "detect$delimiter"
        # Split by the escaped delimiter
        IFS=$'\n' read -r -d '' -a result <<<"$1"
        echo "${result[0]}"
        echo "${result[1]}"
    elif [[ -z "$delimiter" ]]; then
        # Split by each character (including spaces)
        result=($(echo "$string" | grep -o .))
    else
        # Split by the given delimiter
        IFS="$delimiter" read -ra result <<<"$string"
    fi

    # Return the array (we can simply echo the elements as output)
    echo "${result[@]}"
}

# 11. Repeat (JS: `str.repeat(n)`)
str_repeat() {
    local str="$1"
    local n="$2"
    # printf "%${n}s" | tr ' ' "$str"
    local result=""

    for ((i = 0; i < n; i++)); do
        result+="$str"
    done

    echo "$result"
}

# 12. Pad Start (JS: `str.padStart(targetLength, padString)`)
str_padStart() { # str, max_len, delimiter
    [ "$3" != "" ] && delimiter=$3 || delimiter=" "
    local len="$(str_len "$1")"
    local target_length="$(($2 - len))"
    local result="$(str_repeat "$delimiter" $target_length)$1"
    echo "$result"
}

# 13. Pad End (JS: `str.padEnd(targetLength, padString)`)
str_padEnd() { # str, max_len, delimiter
    [ "$3" != "" ] && delimiter=$3 || delimiter=" "
    local len="$(str_len "$1")"
    local target_length="$(($2 - len))"
    local result="$1$(str_repeat "$delimiter" $target_length)"
    echo "$result"
}

# 14. Reverse String (Custom Function)
str_reverse() {
    echo "$1" | rev
}

# 15. Convert First Letter to Uppercase (JS: `str.charAt(0).toUpperCase() + str.slice(1)`)
str_firstToUpper() {
    echo "$1" | sed 's/^\(.\)/\U\1/'
}

# 16. Convert First Letter to Lowercase (JS: `str.charAt(0).toLowerCase() + str.slice(1)`)
str_firstToLower() {
    echo "$1" | sed 's/^\(.\)/\L\1/'
}

# 17. Check if String is Empty (JS: `str.length === 0`)
str_isEmpty() {
    [[ -z "$1" ]] && echo "true" || echo "false"
}

# 18. Convert to Title Case (JS: Custom Function)
str_toTitleCase() {
    echo "$1" | sed -e 's/\b\(.\)/\U\1/g'
}

# 19. Check if String is a Number (JS: `!isNaN(str)`)
str_isNumber() {
    [[ "$1" =~ ^[0-9]+$ ]] && echo "true" || echo "false"
}

# 20. Match some thing (JS: `"".match()`)
str_match() {
    local str="$1"
    local pattern="$2"

    # 'grep -o'
    result=$(echo "$str" | grep -o "$pattern")

    if [ -z "$result" ]; then
        echo "-1"
    else
        echo "$result"
    fi
}
