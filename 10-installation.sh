#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this root user access"
    exit 1 #Manually exit if error comes
else
    echo "Your super user"
fi
 
dnf install mysql-server -y

if [ $? -ne 0 ]

then 
    echo "Installation of mysql-server...FAILURE"
    exit 1 
else 
    echo "Installation of mysql-server...SUCCESS"
fi

dnf install git -y 

if [ $? -ne 0 ]

then 
    echo "Installation of git...FAILURE"
    exit 1 
else 
    echo "Installation of Git...SUCCESS"
fi

 echo "is script proceeding?"

