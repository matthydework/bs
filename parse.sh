#!/bin/bash
txtfile=$1
filename="$txtfile.txt"
cutdata=
echo > $filename
files=~/Downloads/opm/*
echo $filename
for f in $files; do
	stats=$(stat $f | grep "Modify" | cut -d ":" -f2 | cut -d' ' -f2)
	echo "Parsing file:" $f
	#echo $stats $f>> filename1.txt
	echo "====================" >> filename1.txt
	echo "Users in file: " $f >> filename1.txt
	echo "This file was last modified: "$stats >> filename1.txt
	exists=$(cat $f |grep cord | cut -d ":" -f1)
	for e in $exists; do
	#echo -e $exists "\n" >> filename1.txt
		echo $e >> filename1.txt
	done
done
