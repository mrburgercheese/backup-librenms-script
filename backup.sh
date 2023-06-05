# GNU nano 4.8                                              backup2.sh                                               Modified

#!/bin/sh

#----------------------------------------------------------
# a simple mysql database backup script.
# version 2, updated March 26, 2011.
# copyright 2011 alvin alexander, http://alvinalexander.com
#----------------------------------------------------------
# This work is licensed under a Creative Commons
# Attribution-ShareAlike 3.0 Unported License;
# see http://creativecommons.org/licenses/by-sa/3.0/
# for more information.
#----------------------------------------------------------

# (1) set up all the mysqldump variables
FILE=DB_LibreNMS_`date +"%Y%m%d"`.sql
DBSERVER=127.0.0.1
DATABASE=libredb
USER=libredb
PASS=Bestari008
FOLDERRRD=rrd_`date +"%Y%m%d"`

# (2) in case you run this more than once a day, remove the previous version of the file
#unalias rm     2> /dev/null
#rm ${FILE}     2> /dev/null
#rm ${FILE}.gz  2> /dev/null


# (3) do the mysql database backup (dump)

# use this command for a database server on a separate host:
#mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}

# use this command for a database server on localhost. add other options if need be.
echo "====================="
echo "Proses Mysql Dump"
echo "====================="
echo "..."
echo "..."
echo "..."
echo "..."


mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}
echo "====================="
echo "Mysql dump sudah kelar"
echo "====================="
echo "..."
echo "..."
echo "..."
echo "..."


#copy rrd
echo "====================="
echo "Proses Copy RRD"
echo "====================="
cp -r /opt/librenms/rrd /home/libreftpuser/${FOLDERRRD}
ls -l
echo "====================="
echo "Copy RRD sudah kelar"
echo "====================="
echo "..."
echo "..."
echo "..."
echo "..."

# (4) gzip the mysql database dump file and rrd file
gzip $FILE
echo "====================="
echo "Gzip DB File sudah kelar"
echo "====================="
echo "..."
echo "..."
echo "..."
echo "..."

# (5) show the user the result
echo "${FILE}.gz telah dibuat:"
ls -l ${FILE}.gz
ls -l


