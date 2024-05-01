#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
    echo "How r u doing"
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
