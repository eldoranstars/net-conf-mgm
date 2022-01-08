#!/bin/bash
if [[ $(snmpwalk -v2c -c $2 $1 SNMPv2-MIB::sysDescr.0 | awk '{print $4}') = *"EDS-510"* ]]
then echo $1 >> inventory_moxa_510.txt 
fi
