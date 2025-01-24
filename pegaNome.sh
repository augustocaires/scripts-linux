#!/bin/bash

echo > lista.csv

dos2unix matricula.txt

for i in `cat matricula.txt`; do
echo "$i - `net user $i /do | grep "Nome completo" | awk -F" " '{print substr($0,index($0,$3))}'`" >> lista.csv 
done

