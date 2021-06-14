#!/bin/bash
intyear=$(date +%Y)
intmonth=$(date +%m)
intday=$(date +%d)
read -a name < $1
int=$(wc -w < $1)
inty=`echo ${name[($int-1|bc)]: -4}`
intm=`echo ${name[($int-1|bc)]:3:2}`
intd=`echo ${name[($int-1|bc)]:0:2}`
nano q2_output.txt
if [ $intm -gt $intmonth ]
then
for ((i=0;i<($int-1|bc);i++))
do
echo -n ${name[$i]}" " >> q2_output.txt
done
echo $intyear-$inty-1|bc >> q2_output.txt
else if [ $intm -lt $intmonth ]
then
for ((i=0;i<($int-1|bc);i++))
do
echo -n ${name[$i]}" " >> q2_output.txt
done
echo $intyear-$inty|bc >> q2_output.txt
else if [ $intm -eq $intmonth ]
then
if [ $intd -gt $intday ]
then
for ((i=0;i<($int-1|bc);i++))
do
echo -n ${name[$i]}" " >> q2_output.txt
done
echo $intyear-$inty-1|bc >>q2_output.txt
else if [ $intd -lt $intday ]
then
for ((i=0;i<($int-1|bc);i++))
do
echo -n ${name[$i]}" " >> q2_output.txt
done
echo $intyear-$inty|bc >> q2_output.txt
else if [ $intd -eq $intday ]
then
for ((i=0;i<($int-1|bc);i++))
do
echo -n ${name[$i]}" " >> q2_output.txt
done
echo $intyear-$inty|bc >> q2_output.txt
fi
fi
fi

fi
fi
fi
