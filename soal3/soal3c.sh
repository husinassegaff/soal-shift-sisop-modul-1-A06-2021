#!/bin/bash

PWD=`pwd`;

folder_kucing=`ls -d Kucing_* | wc -l`
folder_kelinci=`ls -d Kelinci_* | wc -l`

if [ $folder_kucing -le $folder_kelinci ]
then	
	newdir="Kucing_$(date +"%d-%m-%Y")"
	mkdir $newdir

	for ((num=1 ; num<=23; num=num+1))
	do
		wget -a Foto.log -nv  https://loremflickr.com/320/240/kitten
	done
	mv Foto.log $newdir
	md5sum * | sort | awk 'BEGIN{hash = ""} $1 == hash {print $2} {hash = $1}' | xargs rm

	ke=1
	for file in *
	do
		if [[ $file == *"kitten"* ]]
		then
			namafile=`printf "Kucing_%02d.jpg" $ke`
			mv $file $namafile
			ke=$((ke+1))
			mv *.jpg $PWD/$newdir
		fi
	done
elif [ $folder_kucing -gt $folder_kelinci ]
then
	newdir="Kelinci_$(date +"%d-%m-%Y")"
	mkdir $newdir

	for ((num=1 ; num<=23; num=num+1))
	do
		wget -a Foto.log -nv  https://loremflickr.com/320/240/bunny
	done
	mv Foto.log $newdir
	md5sum * | sort | awk 'BEGIN{hash = ""} $1 == hash {print $2} {hash = $1}' | xargs rm

	ke=1
	for file in *
	do
		if [[ $file == *"bunny"* ]]
		then
			namafile=`printf "Kelinci_%02d.jpg" $ke`
			mv $file $namafile
			ke=$((ke+1))
			mv *.jpg $PWD/$newdir
		fi
	done
fi