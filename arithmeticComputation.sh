#!/bin/bash -x

# read three numbers and assigned them to 3 vars
read -p "Enter number one : " a
read -p "Enter number two : " b
read -p "Enter number three : " c

#Computations
compute1=`echo $(($a+$b*$c)) | bc`
compute2=`echo $(($a*$b+$c)) | bc`
