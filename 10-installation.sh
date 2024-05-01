#!/bin/bash

USERID=$(id -u)

if [$USERID -NE 0 ]
then
    echo "Please run this root user access"
    exit 1 #Manually exit if error comes
else
    echo "Your super user"
fi
 
 dnf install mysql -y

if [$? -ne 0 ]

then 
    echo "Installation of mysql...FAILURE"
    exit 1 
else 
    echo "Installation of mysql...success"
fi

 echo "is script proceeding"

