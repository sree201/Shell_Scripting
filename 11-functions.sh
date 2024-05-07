#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ] # we can pass the orguments from outside $1 / -ne is the expression 
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
 
dnf install mysql-selinux.noarch -y &>>$LOGFILE
VALIDATE $? "installing mysql-selinux.noarch"

dnf install git -y &>>$LOGFILE
VALIDATE $? "installing Git"