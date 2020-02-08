#!/bin/bash

####################################
#   Function: backup postgres open_lmis database
#   Period :  every day
#   Crontab 
#
###################################

BACKUP_PATH="/data/backup"

echo " ${BASH_SOURCE[0]} Backup  postgres ..."

date

PGPASSWORD="<YOUR_PWD>" pg_dump -h 127.0.0.1 -p 5432 -U postgres -d open_lmis | gzip > ${BACKUP_PATH}/`date +%Y%m%d%H`_pg.gz

echo "Delete old files"

find ${BACKUP_PATH} -name "*.gz" -ctime +3 -type f -exec rm -f {} \;