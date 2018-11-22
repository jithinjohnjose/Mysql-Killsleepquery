#!/bin/sh

#############################################################################
#                                                                           #
#               MySQL script for killing sleeping queries                   #
#                                 by                                        #
#                           Jithin John Jose                                #
#                                                                           #
#                                                                           #
#############################################################################

MYSQL=/usr/bin/mysql

# Credentials for a MySQL user with PROCESS, SUPER permissions
USERNAME=root
PASSWORD=******
HOST=localhost
PORT=3306

# Killing MySQL sleeping process

kill=`$MYSQL -u$USERNAME -p$PASSWORD -h$HOST -P$PORT -e "select concat('KILL ',id,';') from information_schema.processlist where Command='Sleep';"  2>&1 | egrep -v "Warning:|concat"`

$MYSQL -u$USERNAME -p$PASSWORD -h$HOST -P$PORT -e "$kill" 2>&1 | grep -v "Warning:"
