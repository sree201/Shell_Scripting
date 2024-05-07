#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

VALIDATE(){
if [ $1 -ne 0 ] # we can pass the orguments from outside $1 / -ne is the expression 
    then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
fi

}


if [ $USERID -ne 0 ] # 0 contains script name
then 
    echo "Please run this script with root user access."
    exit 1 
else
    echo "your super user"
fi

for i in $0 #looping all the parameters what you have given "$i"
do 
    echo "package to install: $i"
    dnf list installed $i &>> $LOGFILE  # check the exit status "we use if condition" "or we can use Validate function"
    if [ $? -eq 0 ]
    then
        echo -e "$i already installed...$Y SKIPPING  $N"
    else
        dnf install $i  -y &>> $LOGFILE # redirecting the logfile
        VALIDATE $? "Installation of $i" # Calling "validate" function
    fi
done
