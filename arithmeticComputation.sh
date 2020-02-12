#!/bin/bash -x

# read three numbers and assigned them to 3 vars
read -p "Enter number one : " a
read -p "Enter number two : " b
read -p "Enter number three : " c

#Computations
compute1=`echo "scale=2; $a+$b*$c" | bc`
compute2=`echo "scale=2; $a*$b+$c" | bc`
compute3=`echo "scale=2; $c+$a/$b" | bc`
compute4=`echo "$a%$b+$c" | bc`
