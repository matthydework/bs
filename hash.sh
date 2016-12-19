#!/bin/bash
filepath=~/Desktop/Investigate/emailswithzips/bins/*.bin
exepath=/~Desktop/Investigate/emailswithzips/bins/*.exe


for files in $filepath;do
	echo $files
	strings $files | grep Base64 | cut -d '"' -f2 | base64 -d > $files.exe
	echo "MD5" >> hashs.txt
	md5sum $files.exe >> hashs.txt
	echo "============================" >> hashs.txt
	echo "SHA256" >> hashs.txt
	sha256sum $files.exe >> hashs.txt
	echo "============================" >> hashs.txt
done