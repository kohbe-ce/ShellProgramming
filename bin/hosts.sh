#!/bin/bash

# Import

# Variable Definition

# Function Definition

# Code Definition


HOSTS=hosts
> $HOSTS
NET=192.168.10

cat << EOF >> $HOSTS
#
# Linux Server List
#
EOF

for i in $(seq 10 50)
do
    echo "$NET.$i linux$i.example.com linux$i" >> $HOSTS
done


