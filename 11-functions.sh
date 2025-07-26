#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run this script with root access"
    exit 1
else
    echo "you are running with root access"
fi

VALIDATE(){
 if [ $1 -eq 0 ]
then
    echo "Installing $2 is .... success"
else
    echo "Installing $2 is ....FAILURE"
    exit 1
fi
}



dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed ... going to install it"
    dnf install mysql -y
   VALIDATE #? "MYSQL"
else
   echo "MYSQL is already installed .... nothing to do"
fi



dnf list installed python3

if [ $? -ne 0 ]
then
    echo "PYTHON3 is not installed ... going to install it"
    dnf install python3 -y
   VALIDATE $? "PYTHON3"
else
   echo "PYTHON3 is already installed .... nothing to do"
fi



dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed ... going to install it"
    dnf install nginx -y
validate #? "nginx"
else
   echo "NGINX is already installed .... nothing to do"
fi
