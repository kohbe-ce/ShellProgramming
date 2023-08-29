#!/bin/bash

# Import
. /root/shell/function.sh

# Variable Definition
result=/root/shell/result.txt
messfile=/root/shell/mess.txt
> $result
num=0
mess=""

# Code Definition

echo "welcome lecture score : start press anykey"
read

for i in $(seq 3)
do
    num=$i
    mess=$(sed -n "$i"p $messfile)
    EvalLecture "$num" "$mess"
done


cat result.txt