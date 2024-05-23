#!/bin/bash

set -e 

USERID=$(id -u)

if  [ $USERID -ne 0 ]
then 
    echo "please run the script with root access."
    exit 1
else
    echo "your are a super user."
fi

dnf install mysql -y
dnf install git -y


echo "is script processing"
