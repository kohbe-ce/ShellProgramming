#!/bin/bash



ServiceStart(){
        systemctl enable $srv > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[ OK ] $srv enable!"
        else
            echo "[ FAIL ] $srv not enable!"
        fi
        systemctl restart $srv > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[ OK ] $srv started!"
        else
            echo "[ FAIL ] $srv not started!"
        fi
}

ServiceStop(){
        systemctl stop $srv > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[ OK ] $srv stopped!"
        else
            echo "[ FAIL ] $srv not stopped!"
        fi
        systemctl disable $srv > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[ OK ] $srv disable!"
        else
            echo "[ FAIL ] $srv not disable!"
        fi
}

EvalLecture(){
    num=$1
    mess=$2
    on=no
    
    while [ "$on" = 'no' ]
    do 
    echo "$num. $mess    (0~100)"
    read point

    echo "$point is correct?"
    read confirm

    case $confirm in
        yes|y) 
            on=yes 
            echo " $num: $point" >> $result
            ;;
        no|n) 
            on=no ;;
        *) 
            echo "yes or no"
            on=no ;; 
    esac
    done
}