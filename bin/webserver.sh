#!/bin/bash

# Import
. /root/bin/function.sh

# Variable Definition

# Function Definition

# Code Definition

# webserver.sh httpd|nginx

[ $# -ne 1 ] && WebServerUsage
WEBTYPE=$1

case $WEBTYPE in
    httpd) httpd.sh ;;
    nginx) nginx.sh ;;
    *    ) WebServerUsage ;;
esac
