#!/bin/bash
# service.sh UNIT start|stop
# -> systemctl start&&enable|stop&&disable UNIT

. /root/shell/function.sh

srv=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <UNIT> start|stop|restart"
    exit 1
fi

echo " What do you want $1 make status?"
echo -n "1)start 2)stop : "
read action

case $action in
# ServiceStart in function.sh
    1)
        ServiceStart $srv ;;
# ServiceStop in function.sh
    2)
        ServiceStop $srv ;;
# Error Explain
    *)  
        echo "Usage: $0 <UNIT> <start: 1| stop: 2" && exit 1 ;;
esac