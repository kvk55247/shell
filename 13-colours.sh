#!/bin/bash


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m]"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: please run this script with root access $N"
    exit 1
else
    echo "you are running with root access"
fi

VALIDATE(){
 if [ $? -eq 0 ]
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
   echo -e " nothing to do MYSQL .... $y  already installed $N "
fi



dnf list installed python3

if [ $? -ne 0 ]
then
    echo "PYTHON3 is not installed ... going to install it"
    dnf install python3 -y
   VALIDATE $? "PYTHON3"
else
 echo -e " nothing to do python3.... $y  already installed $N "
fi



dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed ... going to install it"
    dnf install nginx -y
     VALIDATE 
     
     #? "nginx"
else
   echo -e " nothing to do python3.... $y  already installed $N "
fi
