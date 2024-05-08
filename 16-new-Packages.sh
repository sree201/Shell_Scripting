#!/bin/bash

echo "Enter MySQL DB Password:"
read -s mysql_root_password # ExpenseApp@1

dnf module disable nodejs -y &>> $LOGFILE
VALIDATE $? "Disabling default NodeJS"

dnf module enable nodejs:20 -y &>> $LOGFILE
VALIDATE $? "Enabling NodeJS:20"

dnf install nodejs -y &>> $LOGFILE
VALIDATE $? "Installing NodeJS:20"

id expense &>> $LOGFILE

if [ $? -ne 0 ]
then
    useradd expense &>> $LOGFILE
    VALIDATE $? "Adding User: expense"
else
    echo -e "User expense is already present...$Y SKIPPED $W"
fi

mkdir -p /app &>> $LOGFILE

curl -o /tmp/backend.zip "https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip" &>> $LOGFILE
VALIDATE $? "Downloading Source Code"

rm -r /app/*
cd /app
unzip /tmp/backend.zip &>> $LOGFILE
VALIDATE $? "Unzipping the file"

npm install &>> $LOGFILE
VALIDATE $? "Installing NodeJS dependencies"

# CODE COMMENTED FOR READABILITY