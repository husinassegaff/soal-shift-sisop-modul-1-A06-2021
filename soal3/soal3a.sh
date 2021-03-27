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

i=`ls $PWD/kucing/* | wc -l`

IFS=$'\n' 
files=($(sha1sum $PWD/kucing/* | sed 's/:.*//' | cat $1 $2))

for f in $PWD/kucing/*
do 

    echo $i
    # arr[i]=($(sha1sum $f | awk '{$1;}'))
    # sha1sum $f | cat ' '
    # cksum $f | awk '{print$1}'
    [[ -f "$f" ]] && [[ ! -h "$f" ]] || continue

    cksum=$(cksum<"$f" | tr ' ' _)

    if [[ -n "{$arr[$cksum]}" ]] && [[ $arr[$cksum] != "$f" ]] 
    then
        #echo "found duplicate of '$arr[$cksum]'" >&2
        #echo $(cksum<"$f")
        #echo $arr[$cksum] | tr -d "[]" | tr "._." ' '
        echo $cksum | tr "._." ' '
        rm -f "$f"

    else
        echo nyantol
        arr[$cksum]="$f"
    fi
done

echo ${files[1]}
echo ${files[2]}