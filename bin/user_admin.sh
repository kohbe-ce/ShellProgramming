#!/bin/bash

# Import

# Variable Definition

# Function Definition
AdminList(){
    cat << EOF
(관리 목록)
------------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
------------------------------------
EOF
}
UserAdd() {
        echo -n "추가할 사용자 이름은? : "
        read UNAME1

        cat /etc/passwd | awk -F: '{print $1}' | grep -w $UNAME1 >/dev/null 2>&1
        if [ $? -eq 0 ] ; then
                echo "---------------------------------"
                echo "사용자가 존재합니다."
                echo "---------------------------------"
        else
                useradd $UNAME1 >/dev/null 2>&1
                echo $UNAME1 | passwd --stdin $UNAME1 >/dev/null 2>&1
                echo "---------------------------------"
                echo "사용자가 추가되었습니다."
                echo "---------------------------------"
        fi
}

UserList() {
    echo "------------------------------------"
    echo "사용자 목록"
        awk -F: '$3 > 1000 && $3 < 60000 {print $1}' /etc/passwd | cat -n
    echo "------------------------------------"
}

UserDel() {
        echo -n "삭제할 사용자 이름? : "
        read UNAME2

        cat /etc/passwd | awk -F: '{print $1}' | grep -w $UNAME2 >/dev/null 2>&1
        if [ $? -eq 0 ] ; then
                userdel -r $UNAME2
                echo "---------------------------------"
                echo "사용자가 삭제되었습니다."
                echo "---------------------------------"
        else
                echo "---------------------------------"
                echo "사용자가 없습니다."
                echo "---------------------------------"
        fi
}


# Code Definition

while true
do
        echo
        AdminList
        echo -n "선택 번호? : "
        read CHOICE1

        case $CHOICE1 in
                1) UserAdd ;;
                2) UserList ;;
                3) UserDel ;;
                4) break ;;
                *) echo "[ INFO ]Invalid Number" ; echo ;;
        esac
        echo ; echo
done
