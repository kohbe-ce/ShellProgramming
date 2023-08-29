#!/bin/bash

echo -n "Program name : "
read CMD

# echo $CMD
if [ -x "$CMD" ] ; then
    $CMD
else
    echo "[ FAIL ] Have not permission"
    exit 1
fi



