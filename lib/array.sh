#!/bin/bash

# Check if a variable is an array
arr_isArr() {
    local var_name=$1
    if declare -p "$var_name" 2>/dev/null | grep -q "declare -a"; then
        echo "true"
    else
        echo "false"
    fi
}

# Get the length of an array
arr_len() {
    local arr=("$@")
    echo "${#arr[@]}"
}

# Join array elements into a string
arr_join() {
    local delimiter=$1
    shift
    local arr=("$@")
    IFS="$delimiter"
    echo "${arr[*]}"
    unset IFS
}

# Add elements to the end of an array
arr_push() {
    local arr_name=$1
    shift
    eval "$arr_name+=(\"\$@\")"
}

# # Remove and return the last element
# arr_pop() {
#     local arr_name=$1
#     eval "local last_index=\$((\${#arr_name[@]} - 1))"
#     eval "local value=\${arr_name[last_index]}"
#     eval "unset ${arr_name[last_index]}"
#     echo "$value"
# }

# Remove and return the first element
# arr_shift() {
#     local arr_name=$1
#     eval "local value=\${$arr_name[0]}"
#     eval "$arr_name=(\"\${$arr_name[@]:1}\")"
#     echo "$value"
# }

# Add elements to the beginning of an array
# arr_unshift() {
#     local arr_name=$1
#     shift
#     eval "$arr_name=(\"\$@\" \"\${$arr_name[@]}\")"
# }

# Find the first index of a value
arr_indexOf() {
    local value=$1
    shift
    local arr=("$@")
    for i in "${!arr[@]}"; do
        if [[ "${arr[i]}" == "$value" ]]; then
            echo "$i"
            return
        fi
    done
    echo "-1"
}

# Check if an array includes a value
arr_includes() {
    local value=$1
    shift
    local arr=("$@")
    for element in "${arr[@]}"; do
        if [[ "$element" == "$value" ]]; then
            echo "true"
            return
        fi
    done
    echo "false"
}

# Reverse an array
arr_reverse() {
    local arr=("$@")
    local reversed=()
    for ((i = ${#arr[@]} - 1; i >= 0; i--)); do
        reversed+=("${arr[i]}")
    done
    echo "${reversed[@]}"
}

# Extract a section of an array
arr_slice() {
    local start=$1
    local end=$2
    shift 2
    local arr=("$@")
    echo "${arr[@]:$start:$((end - start))}"
}

# Sort an array
arr_sortDef() {
    local arr=("$@")
    IFS=$'\n' sorted=($(sort <<<"${arr[*]}"))
    unset IFS
    echo "${sorted[@]}"
}

arr_sort() {
    local callback=$1 # Callback function
    shift
    local arr=("$@") # Array elements
    local sorted=()
    local i j temp

    # Bubble sort for simplicity
    for ((i = 0; i < ${#arr[@]}; i++)); do
        for ((j = 0; j < ${#arr[@]} - 1; j++)); do
            if $callback "${arr[j]}" "${arr[j + 1]}"; then
                # Swap elements
                temp="${arr[j]}"
                arr[j]="${arr[j + 1]}"
                arr[j + 1]="$temp"
            fi
        done
    done
    echo "${arr[@]}"
}

# Filter an array (using a callback command)
arr_filter() {
    local callback=$1
    shift
    local arr=("$@")
    local filtered=()
    for element in "${arr[@]}"; do
        if $callback "$element"; then
            filtered+=("$element")
        fi
    done
    echo "${filtered[@]}"
}

# Map over an array (using a callback command)
arr_map() {
    local callback=$1
    shift
    local arr=("$@")
    local mapped=()
    for element in "${arr[@]}"; do
        mapped+=("$($callback "$element")")
    done
    echo "${mapped[@]}"
}

# Reduce an array (using a callback command)
arr_reduce() {
    local callback=$1
    local accumulator=$2
    shift 2
    local arr=("$@")
    for element in "${arr[@]}"; do
        accumulator=$($callback "$accumulator" "$element")
    done
    echo "$accumulator"
}

arr_forEach() {
    local callback=$1 # Callback function
    shift
    local arr=("$@") # Array elements
    for element in "${arr[@]}"; do
        $callback "$element"
    done
}

arr_every() {
    local callback=$1 # Callback function
    shift
    local arr=("$@") # Array elements
    for element in "${arr[@]}"; do
        if ! $callback "$element"; then
            echo "false"
            return
        fi
    done
    echo "true"
}

arr_some() {
    local callback=$1 # Callback function
    shift
    local arr=("$@") # Array elements
    for element in "${arr[@]}"; do
        if $callback "$element"; then
            echo "true"
            return
        fi
    done
    echo "false"
}
