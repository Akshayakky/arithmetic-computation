#!/bin/bash -x

#CONSTANTS
NO_OF_COMPUTES=4

#VARIABLES
count=1

#READ THREE NUMBERS AND ASSIGNED THEM TO VARIABLES
read -p "Enter number one : " a
read -p "Enter number two : " b
read -p "Enter number three : " c

#COMPUTATIONS
compute1=`echo "scale=2; $a+$b*$c" | bc`
compute2=`echo "scale=2; $a*$b+$c" | bc`
compute3=`echo "scale=2; $c+$a/$b" | bc`
compute4=`echo "$a%$b+$c" | bc`

#DECLARING DICTIONARY
declare -A resultDictionary

#STORING THE RESULTS IN DICTIONARY
resultDictionary[compute1]=$compute1
resultDictionary[compute2]=$compute2
resultDictionary[compute3]=$compute3
resultDictionary[compute4]=$compute4

#STORING RESULTS FROM DICTIONARY TO ARRAY
while [ $count -le $NO_OF_COMPUTES ]
do
	resultArray[$count]=${resultDictionary[compute$count]}
	((count++))
done

#FUNCTION TO SORT ARRAY IN DESCENDING ORDER
function  descendingSort(){
array=("$@")
for (( i=0;i<$((${#array[@]}-1));i++ ))
do
	for (( j=0;j<$((${#array[@]}-1));j++ ))
	do
		if (( $(echo "${array[j]} < ${array[j+1]}" |bc -l) ))
		then
			temp=${array[j]}
			array[j]=${array[j+1]}
			array[j+1]=$temp
		fi
	done
done
echo ${array[@]}
}

#STORING SORTED ARRAY IN DESCENDINGSORTEDARRAY
descendingSortedArray=($(descendingSort ${resultArray[@]}))


#FUNCTION TO SORT ARRAY IN ASCENDING ORDER
function  ascendingSort(){
array=("$@")
for (( i=0;i<$((${#array[@]}-1));i++ ))
do
	for (( j=0;j<$((${#array[@]}-1));j++ ))
	do
		if (( $(echo "${array[j]} > ${array[j+1]}" |bc -l) ))
		then
			temp=${array[j]}
			array[j]=${array[j+1]}
			array[j+1]=$temp
		fi
	done
done
echo ${array[@]}
}

#STORING SORTED ARRAY IN ASCENDINGSORTEDARRAY
ascendingSortedArray=($(ascendingSort ${resultArray[@]}))
