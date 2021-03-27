#!/bin/bash

PWD=`pwd`

str=1
end=23

for ((i = str; i <= end; i += 1))
do
    wget https://loremflickr.com/320/240/kitten -P $PWD/kucing/
done

declare -a arr

for f in $PWD/kucing/*
do 
    echo lewat;
    # arr[i]=($(sha1sum $f | awk '{$1;}'))
    # sha1sum $f | cat ' '
    # cksum $f | awk '{print$1}'
    [[ -f "$f" ]] && [[ ! -h "$file" ]] || continue

        echo $arr[$cksum] | tr -d "[]" | tr "._." ' '

    cksum=$(cksum<"$f" | tr ' ' _)

    if [[ -n "{$arr[$cksum]}" ]] && [[ $arr[$cksum] -ne "$f" ]] && [[ $arr[$cksum] -ne 0 ]]
    then
        #echo "found duplicate of '$arr[$cksum]'" >&2
        echo $(cksum<"$f")
        rm -f "$f"
        echo $(cksum<"$f")
    else
        echo nyantol
        arr[$cksum]="$f"
    fi
done
echo ${arr[1]}