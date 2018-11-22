#!/bin/sh

#############################################################################
#                                                                           #
#                   MySQL script for killing slow queries                   #
#                                 by                                        #
#                           Jithin John Jose                                #
#                                                                           #
#                                                                           #
#############################################################################

MYSQL=/usr/bin/mysql

# Credentials for a MySQL user 
USERNAME=root
PASSWORD=drRdhkr46
HOST=localhost
PORT=3306

TIMEOUT=60   # 1 minute

#Killing MySQL sleep quries with timeout > 60 and user as root

kill=`$MYSQL -u$USERNAME -p$PASSWORD -h$HOST -P$PORT -e 'SHOW FULL PROCESSLIST;' 2>&1 | grep -v "Warning:" | cut -f 1,2,6 | awk '{ if ($3 > $TIMEOUT && $2 == "root") print "KILL " $1 ";" }'`

$MYSQL -u$USERNAME -p$PASSWORD -h$HOST -P$PORT -e "$kill"  2>&1 | grep -v "Warning:"
