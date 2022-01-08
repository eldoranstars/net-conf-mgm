#!/bin/bash
if [ $(snmpwalk -v2c -c $2 $1 SNMPv2-MIB::sysDescr.0 | awk '{print $5}') = IS-3230 ]
then echo $1 >> inventory_keymile_3230.txt 
fi
