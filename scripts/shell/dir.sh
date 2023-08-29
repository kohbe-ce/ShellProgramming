#!/bin/bash


echo -n "File Name : "
read file1

# echo $file1
if [ -f $file1 ] ; then
    echo "[ OK ] Nomal File."
elif [ -d $file1 ] ; then 
    echo "[ OK ] DIR File."
else
    echo "[ FAIL ] It is not File or Directory"
    exit 1
fi


