#!/bin/bash
# Authors : Zach Richardson
# Date: 2/7/2020

#Problem 1 Code:
	#use echo and read to save user input
echo "Enter search file: "
read file_name

echo "Enter search expression: "
read reg_ex

	#use syntax: grep <search pattern> <file name>
echo "-----Results-----"
grep $reg_ex $file_name
echo "-----------------"
echo ""
	#serch for phone numbers
	#use more robust search "... - ... - ...."
	#-c will count number of matches
echo "---Phone Numbers---"
output=$(grep -P -c '(\d{3}-\d{3}-\d{4})' regex_practice.txt)
echo "Found: ($output)"
grep -P -o '(\d{3}-\d{3}-\d{4})' regex_practice.txt

echo "---(303) Numbers---"
output=$(grep -P -c '(303-\d{3}-\d{4})' regex_practice.txt)
echo "Found: ($output)"
grep -P -o '(303-\d{3}-\d{4})' regex_practice.txt

	#find and save the number of 'geocities.com' emails in regex
	#use '>>' to send results of search
output=$(grep -P -c "geocities.com" regex_practice.txt)
echo "---Saving ($output) 'geocities.com' emails..---"

rm email_results.txt
grep "@geocities.com" regex_practice.txt >> email_results.txt
git add email_results.txt
git commit -m "geocities.com emails from regex_practice.text"
git remote add origin https://github.com/zari7694/CSCI3308-Labs
git push origin master

echo "-----Done-----"
