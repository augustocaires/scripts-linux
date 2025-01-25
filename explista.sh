#!/bin/bash

dos2unix GRUPOS.txt

GRUPO=`cat GRUPOS.txt | sort -n`
echo > lista.csv
#\rm -rf tmp tmpgrp expgrp lista.csv
#mkdir tmp tmpgrp expgrp 

#for h in `echo $GRUPO`; do
#	net group $h /do | grep -Ev 'A solicita|Nome de grupo|Coment|Membros|-------|Comando conclu' | tr " " "\n" | awk NF > tmp/$h
#	#net group $h /do | grep -E 'F0|P0' | tr " " "\n" | grep -E 'F0|P0' > tmp/$h
#	#net localgroup $h | grep -E 'F0|P0' | tr " " "\n" | grep -E 'F0|P0' > tmp/$h
#
#done

dos2unix tmp/*

for i in `echo $GRUPO`; do

	for j in `cat tmp/$i`; do

		#echo "`net user $j /do | grep "Nome completo" | awk -F" " '{print substr($0,index($0,$3))}' | dos2unix` ($j)" >> tmpgrp/$i
		echo $i > expgrp/$i
		sort tmpgrp/$i >> expgrp/$i

	done

done

dos2unix expgrp/*

LISTA=`find expgrp/ -type f`

#echo -n $GRUPO | tr " " ";" ;echo ; paste -d\; `echo $LISTA`
paste -d\; `echo $LISTA` | tee -a lista.csv

