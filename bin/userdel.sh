#!/bin/bash

# Import
userlist=user.list

# Variable Definition

# Function Definition

# Code Definition



cat $userlist | while read UNAME UPASS
do
	userdel $UNAME > /dev/null 2>&1 \
        && echo "[ OK ] $UNAME removed." \
        || echo "[ FAIL ] $UNAME not removed"
done 
