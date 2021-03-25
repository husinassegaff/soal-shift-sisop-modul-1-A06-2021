#!/bin/bash

grep -oP '(?<=ERROR\ ).*?(?=\ \()' syslog.log | sort | uniq -c | sort -nr > text1.txt
paste <(cut -c 9-50 text1.txt) <(cut -c 1-8 text1.txt) > error_message.csv