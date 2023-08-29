#!/bin/bash

# Import

# Variable Definition

# Function Definition

# Code Definition



echo -n "Enter A : "
read a
echo -n "Enter B : "
read b

echo "=============================================="
echo "      (1). +    (2). -    (3). *    (4). /    "
echo "=============================================="

echo -n "Enter Your Choice ? : "
read c

case $c in
    1) echo "$a + $b = $(expr $a + $b)" ;;
    2) echo "$a - $b = $(expr $a - $b)" ;;
    3) echo "$a x $b = $(expr $a \* $b)" ;;
    4) echo "$a / $b = $(expr $a / $b)" ;;
    *) echo "ERROR"
    exit 1 ;;
esac
