#!/bin/bash

#no1a

grep -oP "(INFO.*)|(ERROR.*)" syslog.log 

#no1b

grep -oP '(?<=ERROR ).*(?= )' syslog.log | sort |  uniq -c | cut -b 6-99 | sort -nr | cut -b 1-2 > temps1b1.txt
grep -oP '(?<=ERROR ).*(?= )' syslog.log | sort |  uniq -c | cut -b 6-99 | sort -nr | cut -b 4-99 > temps1b2.txt
paste -d '\t\t' temps1b2.txt temps1b1.txt

#no1c


#no1d

grep -oP '(?<=ERROR\ ).*?(?=\ \()' syslog.log | sort | uniq -c | sort -nr | cut -b 6-7 > temp1.txt
grep -oP '(?<=ERROR\ ).*?(?=\ \()' syslog.log | sort | uniq -c | sort -nr | cut -b 9-50 > temp2.txt
sed 's/$/ ,/' temp2.txt > temp3.txt
printf "Error,Count\n" > error_message.csv
paste temp3.txt temp1.txt >> error_message.csv

