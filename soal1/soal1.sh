#!/bin/bash

#nomor1a

grep -oP "(INFO.*)|(ERROR.*)" syslog.log 

#nomor1b

grep -oP '(?<=ERROR ).*(?= )' syslog.log | sort |  uniq -c | cut -b 6-99 | sort -nr | cut -b 1-2 > temps1b1.txt
grep -oP '(?<=ERROR ).*(?= )' syslog.log | sort |  uniq -c | cut -b 6-99 | sort -nr | cut -b 4-99 > temps1b2.txt
paste -d '\t\t' temps1b2.txt temps1b1.txt

#nomor1c

user=$(grep -rohP "(\([a-zA-Z.]+\))" syslog.log | sort | uniq | grep -oP "(?<=\().*(?=\))")

for i in $user
do
    printf "USER\t= %s\n" $i;
    printf "INFO\t= %d\n" $(grep -cP "INFO.*$i" syslog.log);
    printf "ERROR\t= %d\n\n" $(grep -cP "ERROR.*$i" syslog.log);

done

#nomor1d

grep -oP '(?<=ERROR\ ).*?(?=\ \()' syslog.log | sort | uniq -c | sort -nr | cut -b 6-7 > temp1.txt
grep -oP '(?<=ERROR\ ).*?(?=\ \()' syslog.log | sort | uniq -c | sort -nr | cut -b 9-50 > temp2.txt
sed 's/$/ ,/' temp2.txt > temp3.txt
printf "Error,Count\n" > error_message.csv
paste temp3.txt temp1.txt >> error_message.csv

