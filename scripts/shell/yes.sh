#!/bin/bash


echo -n "What's your choice? (yes or no) : "
read answer

case $answer in
    yes|YES|Yes|YeS|yES|y|Y) echo "[ YES ]" ;;
    no|No|n|N|NO|nO) echo "[ NO ]" ;;
    *) echo "FuckYou"
        exit 1 ;;
esac

