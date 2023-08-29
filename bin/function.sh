#!/bin/bash

# Import

# Variable Definition

# Function Definition

# Code Definition

WebServerUsage(){
    echo "Usage: $0 {httpd|nginx}"
    exit 1
}

PkgInstall(){
    PKG=$*
    yum -q -y install $PKG >/dev/null 2>&1 \
        && echo "[ OK ] $PKG Complete." \
        || echo "[ FAIL ] $PKG Install ERROR." 
}

ServiceStart(){
    SRV=$1
    case $SRV in
        nginx) INVERSE_SRV=httpd ;;
        httpd) INVERSE_SRV=nginx ;;
        *    ) echo "[ FAIL ] nginx|httpd"
    esac

    systemctl disable --now $INVERSE_SRV >/dev/null 2>&1
    systemctl enable --now $SRV >/dev/null 2>&1 \
        && echo "[ OK ] $SRV Service Started" \
        || echo "[ FAIL ] $SRV Service Not Started"
}

