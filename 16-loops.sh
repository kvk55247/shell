#!/bin/bash


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m]"
LOGS_FOLDER="/var/logs/shell-logs"
SCRIPT_NAME=$(echo $0 | cut  -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("MYSQL" "PYTHON3" "NGINX" "HTTPD")
mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" tee -a $LOG_FILE


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: please run this script with root access $N"  tee -a $LOG_FILE
    exit 1
else
    echo "you are running with root access"  tee -a $LOG_FILE
fi

VALIDATE(){
 if [ $? -eq 0 ]
then
    echo "Installing $2 is .... success"  tee -a $LOG_FILE
else
    echo "Installing $2 is ....FAILURE"  tee -a $LOG_FILE
    exit 1
fi
}

for package in ${PACKAGES[@]}
do

dnf list installed $package &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "$package is not installed ... going to install it"  tee -a $LOG_FILE
    dnf install $package -y &>>$LOG_FILE
   VALIDATE $? "$package"
else
   echo -e " nothing to do $package .... $y  already installed $N "  tee -a $LOG_FILE
fi
done

