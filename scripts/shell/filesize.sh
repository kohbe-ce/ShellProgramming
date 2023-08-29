#!/bin/bash
# ./filesize.sh /etc/hosts

if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

