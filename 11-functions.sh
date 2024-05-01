#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this root user access"
    exit 1 #Manually exit if error comes
else
    echo "Your super user."
fi
 
dnf install mysql-selinux.noarch -y
VALIDATE $? "installing mysql-selinux.noarch"

dnf install git -y 
VALIDATE $? "installing mysql-selinux.noarch"
