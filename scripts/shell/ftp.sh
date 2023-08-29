#!/bin/bash

# Variable Definition

# Function Definition
Help(){
    cat << EOF
    -----------------------------------------------------
    -----------------------------------------------------
    -----------------------------------------------------
    -----------------------------------------------------
    -----------------------------------------------------
EOF
}

Ls() {
    echo "Ls Function Execution."
}

# Code Definition
while true
do
    echo -n "ftp> "
    read CMD
    case $CMD in
        'help') Help ;;
        'ls') Ls ;;
        'q'|'quit') break ;;
        *) echo "? Invalid command" ;;
    esac
done

