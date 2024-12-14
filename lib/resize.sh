#!/bin/bash
Resize_pid=0

Watch_terminal_size() {
    trap $1 SIGWINCH
    while :; do

        sleep 0.1
    done
}
