#!/bin/bash

INICIO=`date +%d/%m/%Y-%H:%M:%S`
LOG=/var/log/`date +%Y-%m-%d`_backup.txt

echo " " >> $LOG
echo " " >> $LOG
echo "|-----------------------------------------------" >> $LOG
echo " Sincronização iniciada em $INICIO" >> $LOG


sudo rsync -Cravzp /pasta-de-origem/ /pasta-de-destino/ >> $LOG
FINAL=`date +%d/%m/%Y-%H%:M:%S`


echo " Sincronização Finalizada em $FINAL" >> $LOG
echo "|-----------------------------------------------" >> $LOG
echo " " >> $LOG
echo " " >> $LOG