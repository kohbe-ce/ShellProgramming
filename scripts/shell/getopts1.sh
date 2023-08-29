#!/bin/bash

# Import

# Variable Definition

# Function Definition

# Code Definition

Usage() {
    echo "Usage: $0 [-x] [-y foo]"; 
    exit 1; 
}

while getopts xy options 2>/dev/null
do
    case $options in
        x) echo "Your Entered : X" ;;
        y) echo "Your Entered : Y" ;;
        \?) Usage ;;
        *) Usage
           exit 1 ;;
    esac
done

shift $(expr $OPTIND)
echo "$@"

