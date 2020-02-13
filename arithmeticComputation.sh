#!/bin/bash -x

#CONSTANTS
NO_OF_COMPUTES=4

#VARIABLES
count=1

#READ THREE NUMBERS AND ASSIGNED THEM TO VARIABLES
read -p "Enter number one : " a
read -p "Enter number two : " b
read -p "Enter number three : " c

#Computations
echo "scale=2; $a+$b*$c" | bc
compute1=`echo "scale=2; $a+$b*$c" | bc`
compute2=`echo "scale=2; $a*$b+$c" | bc`
compute3=`echo "scale=2; $c+$a/$b" | bc`
compute4=`echo "$a%$b+$c" | bc`

#Declaring Dictionary
declare -A resultDictionary

resultDictionary[compute1]=$compute1
resultDictionary[compute2]=$compute2
resultDictionary[compute3]=$compute3
resultDictionary[compute4]=$compute4

while [ $count -le $NO_OF_COMPUTES ]
do
	resultArray[$count]=${resultDictionary[compute$count]}
	((count++))
done
