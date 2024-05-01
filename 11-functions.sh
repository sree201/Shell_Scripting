#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
 SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
 LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
 R="\e[31m"
 G="\e[32m"
 N="\e[33m"

 echo "Script started executed at: $TIMESTAMP"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
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

dnf install docker -y &>>$LOGFILE
VALIDATE $? "installing Docker"
