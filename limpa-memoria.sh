#!/bin/bash
#Limpa cache da memoria RAM

#Verificar aonde está montado o swap antes de rodar este script, verificar no arquivo /etc/fstab e outros casos rodar o comando fdisk -l 
MEM0=sync
echo $MEM0
MEM1=`free|awk '/Mem:/ {print int(100*$3/$2)}'`
free -m
echo "**************************************************************************"
echo "Uso de memoria RAM antes de fazer a limpeza:" $MEM1% 
echo "**************************************************************************"
echo " "
echo "Limpando RAM..."
sleep 4
echo 3 > /proc/sys/vm/drop_caches
echo "Limpando Swap..."
sleep 4
swapoff -a
swapon /dev/sda3
echo "**************************************************************************"
MEM2=`free|awk '/Mem:/ {print int(100*$3/$2)}'`
free -m 
echo "**************************************************************************"
echo "Uso de memoria RAM apos limpeza:" $MEM2% "Economia de: " `expr $MEM1 - $MEM2`"%" 
echo "**************************************************************************" 
