#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run this script with root access"
    exit 1
else
    echo "you are running with root access"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
   echo "Installing mysql is ... success"
else
   echo "Installing mysql is ...Failure"
   exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
   echo "MYSQL is not installed ... going to install it"
   dnf install mysql -y
   if [ $? -eq 0 ]
    echo "Installing mysql is ... success"
else
   echo "Installing mysql is ...Failure"
   exit 1
fi
else
    echo "MYSQL is already installed ... nothing to do"
fi