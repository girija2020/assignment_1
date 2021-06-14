#!/bin/bash
declare fname
declare lname
declare number
declare office
if getopts ":C:" flag
then
case $OPTARG in
delete)
if getopts ":cv" flag
then
case $flag in
c)
case ${BASH_ARGV[($#-$OPTIND|bc)]} in
fname)
((OPTIND++))
if getopts ":v" flag
then
line=$(awk -F "," '$1~"'${BASH_ARGV[($#-$OPTIND|bc)]}'" ' contacts.csv)
sed -i '/'$line'/d' contacts.csv
((OPTIND++))
fi
;;
lname)
((OPTIND++))
if getopts ":v" flag
then
line=$(awk -F "," '$2~"'${BASH_ARGV[($#-$OPTIND|bc)]}'" ' contacts.csv)
sed -i '/'$line'/d' contacts.csv
((OPTIND++))
fi
;;
mobile)
((OPTIND++))
if getopts ":v" flag
then
line=$(awk -F "," '$3~"'${BASH_ARGV[($#-$OPTIND|bc)]}'" ' contacts.csv)
sed -i '/'$line'/d' contacts.csv
((OPTIND++))
fi;;
office)
((OPTIND++))
if getopts ":v" flag
then
line=$(awk -F "," '$4~"'${BASH_ARGV[($#-$OPTIND|bc)]}'" ' contacts.csv)
sed -i '/'$line'/d' contacts.csv
((OPTIND++))
fi;;
esac;;
v)
value=${BASH_ARGV[($#-$OPTIND|bc)]}
((OPTIND++))
if getopts ":c" flag
then
case ${BASH_ARGV[($#-$OPTIND|bc)]} in
fname)
((OPTIND++))
line=$(awk -F "," '$1~"'$value'" ' contacts.csv)
sed -i '/'$line'/d' contacts.csv
((OPTIND++))
;;
lname)
((OPTIND++))
line=$(awk -F "," '$2~"'$value'" ' contacts.csv)
sed -i '/'$line'/d' contacts.csv
((OPTIND++))
;;
mobile)
((OPTIND++))
line=$(awk -F "," '$3~"'$value'" ' contacts.csv)
sed -i '/'$line'/d' contacts.csv
((OPTIND++))
;;
office)
((OPTIND++))
line=$(awk -F "," '$4~"'$value'" ' contacts.csv)
sed -i '/'$line'/d' contacts.csv
((OPTIND++))
;;
esac
fi
;;
esac
fi
;;
display)
if getopts ":ad" flag
then
echo $flag
case $flag in
a)sort contacts.csv -d ;;
d)sort contacts.csv -d -r;;
esac
fi;;
search)
if getopts ":cv" flag
then
case $flag in
c)
case ${BASH_ARGV[($#-$OPTIND|bc)]} in
fname)
((OPTIND++))
if getopts ":v" flag
then
awk -F "," '$1~"'${BASH_ARGV[($#-$OPTIND|bc)]}'" ' contacts.csv
((OPTIND++))
fi
;;
lname)
((OPTIND++))
if getopts ":v" flag
then
awk -F "," '$2~"'${BASH_ARGV[($#-$OPTIND|bc)]}'" ' contacts.csv
((OPTIND++))
fi;;
mobile)
((OPTIND++))
if getopts ":v" flag
then
awk -F "," '$3~"'${BASH_ARGV[($#-$OPTIND|bc)]}'" ' contacts.csv
((OPTIND++))
fi;;
office)
((OPTIND++))
if getopts ":v" flag
then
awk -F "," '$4~"'${BASH_ARGV[($#-$OPTIND|bc)]}'" ' contacts.csv
((OPTIND++))
fi;;
esac;;
v)
value=${BASH_ARGV[($#-$OPTIND|bc)]}
((OPTIND++))
if getopts ":c" flag
then
case ${BASH_ARGV[($#-$OPTIND|bc)]} in
fname)
((OPTIND++))
awk -F "," '$1~"'$value'" ' contacts.csv
((OPTIND++))
;;
lname)
((OPTIND++))
awk -F "," '$2~"'$value'" ' contacts.csv
((OPTIND++))
;;
mobile)
((OPTIND++))
awk -F "," '$3~"'$value'" ' contacts.csv
((OPTIND++))
;;
office)
((OPTIND++))
awk -F "," '$4~"'$value'" ' contacts.csv
((OPTIND++))
;;
esac
fi
;;
esac
fi;;
insert)
i=0;
while getopts ":flno" flag
do
case $flag in
f) fname=${BASH_ARGV[($#-$OPTIND|bc)]};;
l) lname=${BASH_ARGV[($#-$OPTIND|bc)]};;
n) number=${BASH_ARGV[($#-$OPTIND|bc)]};;
o) office=${BASH_ARGV[($#-$OPTIND|bc)]} ;;
esac
if [ $OPTIND -lt $# ]
then
((OPTIND++))
fi
done
echo "$fname,$lname,$number,$office">>contacts.csv
;;
edit)
if getopts ":k" flag
then
fnamei=${BASH_ARGV[($#-$OPTIND|bc)]}
((OPTIND++))
while getopts ":flno" flag
do
case $flag in
f)
fnamef=${BASH_ARGV[($#-$OPTIND|bc)]}
sed -i 's/'$fnamei'/'$fnamef'/g' contacts.csv
((OPTIND++))
fnamei=$fnamef;;
l)
fnamef=${BASH_ARGV[($#-$OPTIND|bc)]}
numi=$(grep $fnamei contacts.csv|awk -F "," '{print $2}')
sed -i 's/'$numi'/'$fnamef'/g' contacts.csv
((OPTIND++));;
n)
fnamef=${BASH_ARGV[($#-$OPTIND|bc)]}
numi=$(grep $fnamei contacts.csv|awk -F "," '{print $3}')
sed -i 's/'$numi'/'$fnamef'/g' contacts.csv
((OPTIND++));;
o)
officef=${BASH_ARGV[($#-$OPTIND|bc)]}
sed -i '/^'$fnamei',/s/[^,]*$/'$officef'/' contacts.csv
((OPTIND++));;
esac
done
fi;;
esac
fi
