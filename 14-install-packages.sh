#!/bin/bash 
#"Shibang is the location of shell interpretter so it will read the commands and execute the commands "

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
    dnf list install mysql-selinux.noarch $i -y &>>$LOGFILE  # check the exit status "we use if condition" "or we can use Validate function"
    if [ $? -eq 0 ] # Special variable for exit status "$?"
    then
        echo -e "$i already installed...$Y SKIPPING  $N"
    else
        dnf install git $i -y &>>$LOGFILE # redirecting the logfile
        VALIDATE $? "Installation of $i" # Calling "validate" function
    fi
done