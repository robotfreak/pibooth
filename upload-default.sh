#!/bin/bash    
HOST="<FTP-HOSTNAME>"
USER="<FTP-USER>"
PASS="<FTP-PASSWORD>"
FTPURL="ftp://$USER:$PASS@$HOST"
LCD="~/Pictures/pibooth"
RCD="~/<FTP-DIRECTORY>"
#DELETE="--delete"
echo upload photo: $1
qr <WEBSPACE-URL>/$1 >~/qrcode.png
gpicview ~/qrcode.png &
lftp -c "set ftp:list-options -a; set ssl:verify-certificate no;
open '$FTPURL';
lcd $LCD;
cd $RCD;
mirror --reverse \
       $DELETE \
       --verbose \
       --exclude-glob a-dir-to-exclude/ \
       --exclude-glob a-file-to-exclude \
       --exclude-glob a-file-group-to-exclude* \
       --exclude-glob other-files-to-exclude"


