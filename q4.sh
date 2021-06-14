#!/bin/bash

func () {
int=$(wc -l < $2)
#echo $int
for ((i=1;i<=$int;i++))
do
it=$(cat $2 | awk 'FNR == '$i' {print}')
sed -i -e 's/\<'${it}'\>//g' $1
#sed -i -e '/\b'${it}'\b/d' $1
#sed -i -e '${it}/d' $1
done
}

func $1 $2
#nano Output.txt
num=$(cat $1|wc -l)
for ((i=1;i<=$num;i++))
do
cat $1|awk 'BEGIN {ORS=", "}; FNR == '$i' {print}'|tr -s " ">>Output.txt
int=$(cat $1|awk 'FNR == '$i' {print}'|tr -d ,.?\!\;|wc -w)
#echo $int
intnum=$(cat $1|awk 'FNR == '$i' {print}' |grep -o -w $3|wc -w)
echo "scale=2; ${intnum}/${int}"|bc>>Output.txt
done

