#!/bin/bash
lines=`wc sample.txt | awk '{print $1}'`
#echo $lines
declare -a name
readarray -t name < $1
nano q1_output.txt
for ((i=0;i<lines;i++))
do
#echo ${name[i]}
#echo ${#name[i]}
if [ ${#name[i]} -lt 5 ]
then
echo "${name[i]}" >>q1_output.txt
else
k=$(echo ${#name[i]}-4|bc)
echo  -n ${name[i]:0:4} >>q1_output.txt
for ((j=0;j<$k;j++))
do
echo -n "X" >>q1_output.txt
done
echo >>q1_output.txt
fi
done


