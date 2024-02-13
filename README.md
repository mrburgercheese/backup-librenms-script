# backup-librenms-script
Backup script for librenms

OS version : Ubuntuk 20.04.06 LTS <br>
Database : Maria DB 10.3.38-MariaDB

Rule Script
- Backup database using mysqldump
- Copy RRD folder from /opt/librenms/rrd to /home/librenmsftpuser
- after msyqldump and copy folder rrd done, you can download db and rrd file via ftp.

Note : this script can send backup file automatic via ftp or scp

Regrads
