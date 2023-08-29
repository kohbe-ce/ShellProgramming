#!/bin/bash

cat << EOF

====================================================
  (1). who      (2). date     (3). pwd              
====================================================

EOF

echo -n "Choice! : "
read choice

echo $choice
case $choice in
    1) who ;;
    2) date ;;
    3) pwd ;;
    *) echo "[ FAIL ] Over Range"
       exit 1;;
esac

