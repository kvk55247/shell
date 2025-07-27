#!/bin/bash


USERID=$(id-u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m]"
LOGS_FOLDER="/var/logs/shell-logs"
SCRIPT_NAME=$(echo $0 | cut d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOG_FILE


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: please run this script with root access $N" &>>$LOG_FILE
    exit 1
else
    echo "you are running with root access" &>>$LOG_FILE
fi

VALIDATE(){
 if [ $? -eq 0 ]
then
    echo "Installing $2 is .... success" &>>$LOG_FILE
else
    echo "Installing $2 is ....FAILURE" &>>$LOG_FILE
    exit 1
fi
}



dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "mysql is not installed ... going to install it" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
   VALIDATE #? "MYSQL"
else
   echo -e " nothing to do MYSQL .... $y  already installed $N " &>>$LOG_FILE
fi



dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "PYTHON3 is not installed ... going to install it" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "PYTHON3"
else
 echo -e " nothing to do python3.... $y  already installed $N " &>>$LOG_FILE
fi



dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "nginx is not installed ... going to install it" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
     VALIDATE 
     
     #? "nginx"
else
   echo -e " nothing to do python3.... $y  already installed $N " &>>$LOG_FILE
fi
