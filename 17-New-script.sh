#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f 1)
LOGFILE="/tmp/$SCRIPTNAME-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ...$R FAILED $W"
    else
        echo -e "$2 ...$G SUCCESS $W"
    fi
}

if [ $USERID -ne 0 ] #"$0 is contains script name"
then
    echo "Please run the script with root access."
    exit 1 #manually exit if error comes / other than 0 we can use any number
else
    echo "you are super user."
fi

for i in $0 #looping all the parameters what you have given "$i"
do 
    echo "package to install: $i"
    dnf list installed packages $i &>> $LOGFILE  # check the exit status "we use if condition" "or we can use Validate function"
    if [ $? -eq 0 ]
    then
        echo -e "$i already installed... $Y SKIPPING  $N"
    else
        dnf install $i  -y &>> $LOGFILE # redirecting the logfile
        VALIDATE $? "Installation of $i" # Calling "validate" function
    fi
done