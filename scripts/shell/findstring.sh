#!/bin/bash

fi [$# -ne 2 ]; then
    echo "Usage : $0 <partten> <filename>"
    exit 1
fi

PATTERN=$1
FILE1=$2

grep -q $PATTERN $FILE1
if [ $? -eq 0 ]; then
    echo "[ OK ] Find Pattern."
else
    echo "[ FAIL ] Can't Find Pattern."
fi


