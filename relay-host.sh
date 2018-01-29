#!/bin/bash
# Add CIDR networks to postfix safe sender list
# Author: Ciaran Owens
# 28/01/2018

NETWORK=$2
ACTION=$3
COMMAND=$1
STRING="$NETWORK $ACTION"

addEntry() {
    echo "$STRING" >> /etc/postfix/network_table
    syncTables
    echo "added $STRING to postfix allowed relay table"
    
}

removeEntry() {
    sed -i /$STRING/d /etc/postfix/network_table
    syncTables
    echo "added $STRING to postfix allowed relay table"
}

showEntries() {
    cat /etc/postfix/network_table
}

errorPrint() {
    echo "syntax: add/del <network/cidr> <OK/REJECT>"
    echo "example: add 10.6.0.0/24 OK"
    echo "example: del 10.6.0.0/24 REJECT"
    exit
}

syncTables() {
    echo >> /dev/null
}

if [[ $ACTION = "OK" || $ACTION = "REJECT" ]]; then
    echo >> /dev/null
else errorPrint
fi

if [[ $COMMAND = "add" ]]; then
    addEntry
elif [[ $COMMAND = "del" ]]; then
    removeEntry
elif [[ $COMMAND = "show" ]]; then
    showEntries
else errorPrint
fi