#!/bin/bash

USERID=$(id -u)

for i in $0 # Looping all the parameters what you have $i
do
    ehco "Package to install: $i"
    dnf list installed packages $i # check the exit status "we use if condition" or we use validate function"
if [ $? -eq 0 ] # "$?" Special variable for exit status
then
    echo $i "Already installed...SKIPPING"
    exit 1
else
    dnf install $i
done