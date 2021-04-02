#!/bin/bash

PWD=`pwd`

str=1
end=23

for ((i = str; i <= end; i += 1))
do
    wget https://loremflickr.com/320/240/kitten -P $PWD/kucing/
done

declare -a arr
declare -a files
declare -a uf

i=`ls $PWD/kucing/* | wc -l`

IFS=$'\n' 
files=($(sha1sum $PWD/kucing/* | sed 's/:.*//' | cut -c 1-40))
uf=($(echo "${files[*]}" | uniq))

echo ${uf[1]}
echo ${uf[2]}
echo ${uf[0]}

m=${#uf[*]}

echo $m

for((num=0; num<$m; num=num+1))
do
flag=0
    for f in $PWD/kucing/*
    do 
        sha1sum=($(sha1sum<"$f" | cut -c 1-40))
        if [[ $sha1sum -eq ${uf[$num]} ]] && [[ $flag == 0 ]] 
        then
            flag=1
        elif [[ $sha1sum -eq ${uf[$num]} ]] && [[ $flag == 1 ]]
        then    
            echo ada yang sama
            rm -f "$f"
        else
            continue
        fi
    done
done

echo $m