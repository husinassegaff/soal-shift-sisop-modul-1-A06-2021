#!/bin/bash

#no1a

grep -oP "(INFO.*)|(ERROR.*)" syslog.log 

#no1b

grep -oP '(?<=ERROR ).*(?= )' syslog.log | sort |  uniq -c | cut -b 6-99 | sort -nr | cut -b 1-2 > temps1b1.txt
grep -oP '(?<=ERROR ).*(?= )' syslog.log | sort |  uniq -c | cut -b 6-99 | sort -nr | cut -b 4-99 > temps1b2.txt
paste -d '\t\t' temps1b2.txt temps1b1.txt

#no1c

grep -oP '(?=\().*' syslog.log > s1c1.txt
grep -oP '(ERROR|INFO)' syslog.log > s1c2.txt
paste s1c1.txt s1c2.txt > s1c3.txt
tr -d '\r' < s1c3.txt > s1c4.txt
column -s $'\t' -t < s1c4.txt > s1c5.txt
sort < s1c5.txt | uniq -c | cut -b 7-80> s1jadi.txt
cut -b 1 < s1jadi.txt > s1count.txt
cut -b 18-23 < s1jadi.txt > s1errorinfo.txt
cut -b 3-16 < s1jadi.txt > s1username.txt
paste s1username.txt s1errorinfo.txt s1count.txt

#no1d

grep -oP '(?<=ERROR\ ).*?(?=\ \()' syslog.log | sort | uniq -c | sort -nr | cut -b 6-7 > temp1.txt
grep -oP '(?<=ERROR\ ).*?(?=\ \()' syslog.log | sort | uniq -c | sort -nr | cut -b 9-50 > temp2.txt
sed 's/$/ ,/' temp2.txt > temp3.txt
printf "Error,Count\n" > error_message.csv
paste temp3.txt temp1.txt >> error_message.csv

