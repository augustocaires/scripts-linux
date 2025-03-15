#!/bin/bash
###############################################################################################################
#          SCRIPT DE BACKUP UTILIZANDO RSYNC COM ENVIO DO LOG E INFORMATIVO VIA E-MAIL                        #
###############################################################################################################
####
###
##             VARIAVEIS DE E-MAIL
#
EMAIL_DE=mail@mail.com
EMAIL_PARA=mail-support@mail.com
SERVIDOR_SMTP=smtp.mail.com:587
SERVIDOR_SMTP_USUARIO=mail@mail.com
SERVIDOR_SMTP_SENHA=SenhaMail@123 
#
##
###
####
###############################################################################################################
####
###
##             VARIAVEIS DO BACKUP
#
LOCAL_DE="/var/lib/unifi /usr/lib/unifi"
LOCAL_PARA="/media/external-storage/backup-unifi/"
DIR_LOG="/media/external-storage/backup-unifi/";
#
##
###
####
###############################################################################################################
####
###
##             CONFIGURAÇÃO DE PARAMETROS RSYNC E LOG
#
ARQUIVO_LOG=`date +%d%m%Y%k%M%S`;
ARGUMENTO_RSYNC="-ravzp --delete"
#
##
###
####
###############################################################################################################
####
###
##             EXECUÇÃO DO RSYNC E ENVIO DE E-MAIL
#
DATA=`date +%d/%m/%Y-%k:%M:%S`;
/usr/bin/rsync $ARGUMENTO_RSYNC $LOCAL_DE $LOCAL_PARA > $DIR_LOG$ARQUIVO_LOG".log"

/usr/bin/sendEmail -f $EMAIL_DE -t $EMAIL_PARA -s $SERVIDOR_SMTP -o tls=yes -xu $SERVIDOR_SMTP_USUARIO -xp $SERVIDOR_SMTP_SENHA -u "Backup externo UniFi executado em $DATA" -a $DIR_LOG$ARQUIVO_LOG".log" -m "Verifique se o backup foi executado corretamente, log em anexo." >> $DIR_LOG$ARQUIVO_LOG".log"
#
##
###
####
###############################################################################################################
