#!/bin/bash#!/bin/bash
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
        echo -e "$2 is $G success $Ns"
    fi
}
CHECK_ROOT
for PACKAGE in $@
do
  dnf list installed $PACKAGE
if [ $? -ne 0 ]
then 
    echo "$PACKAGE is not installed .going to install it"
    dnf install $PACKAGE -y
    VALIDATE $? "installing it"
else
    echo  "$PACKAGE is already installed sucess . nothing do"
fi    
done
