#!/bin/bash

# Import

# Variable Definition

# Function Definition

# Code Definition

: << EOF
for LINE in $(cat input.txt)
do
    echo $LINE
done
EOF


#: << EOF
cat input.txt | while read LINE
do
    echo $LINE
done
#EOF