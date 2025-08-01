#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run this script with root access"
    exit 1
else
    echo "you are running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed ... going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
then
    echo "Installing my sql is .... success"
else
    echo "Installing MYSQL is ....FAILURE"
    exit 1
fi
else
   echo "MYSQL is already installed .... nothing to do"
fi

