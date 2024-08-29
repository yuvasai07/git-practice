#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
       echo "please run the script with root prevelages"
       exit 1
    fi 
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N"
        exit 1
    else
        echo -e "$2 is $G success $N"
    fi
}
dnf list installed git
if [ $? -ne 0 ]
then 
    echo "git is not installed .going to install it"
    dnf install git -y
    VALIDATE $? "installing it"
else
    echo  "git is already installed sucess . nothing do"
fi    
dnf list installed msql
if [ $? -ne 0 ]
then 
    echo" mysql is not installed .going to install it"
    dnf install mysql -y
    VALIDATE $? "installin it"
else
    echo "mysql is already installed.nothing to do"
fi    

