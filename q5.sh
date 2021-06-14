#!/bin/bash
#p=$(ls -p -R| grep -v / |wc -l)
#echo $p
#k=$(ls -p -R|grep -i / |wc -l)
#echo $k
#ls -p -R| grep -v -s/
#ls -p -R --size|grep -v /|sort -g -r -b
#ls -p -s -R --size|grep -v /|sort -g -r -b|grep '^[0-9 ].*[a-z || 4]$'
#ls -p -s -R --size|grep -v /|sort -g -r -b|grep '^[0-9 ].*[a-z || 4]$'|awk '{ print $2 $3 $4 $5 $6 $7}'
#ls -p -s -R --size|grep -v /|sort -g -r -b|grep '^[0-9 ].*[a-z || 4]$'|awk '{n=2;for (;n<=NF;n++) {printf "> " ;printf "%s ",$n} printf "\n"}'
#ls -p -s -R --size|grep -v /|sort -g -r -b|grep '^[0-9 ].*[a-z || 4]$'|awk '{printf("\n> ");n=2;for (;n<=NF;n++) { printf "%s ",$n}}'
#ls -p -R| grep / |grep '^[a-zA-Z0-9]'
directory () {
if [ -d "$1" ]; then
(cd "$1"
#echo $1
echo -n "> $1, "
tree|awk 'END{print}'|awk '{print $3 " file(s)"}'
#echo
int=$(ls -p -R|grep /|wc -l)
if [ $int -gt 0 ]
then
for d in *
do
directory $d
done
fi
)
fi
}

echo "> Directories:"
if [ $# -eq 0 ]
then
for dir in *
do
directory $dir
done
echo ">"
echo -n "> Files:"
ls -p -s -R --size|grep -v /|sort -g -r -b|grep '^[0-9 ].*[a-z || 4 || )]$'|awk '{printf("\n> ");n=2;for (;n<=NF;n++) { printf "%s ",$n}}'
#echo done
else
for dir in $1
do
directory $dir
done
echo ">"
echo -n "> Files:"
ls -p -s -R --size $1|grep -v /|sort -g -r -b|grep '^[0-9 ].*[a-z || 4 || )]$'|awk '{printf("\n> ");n=2;for (;n<=NF;n++) { printf "%s ",$n}}'
echo
fi
