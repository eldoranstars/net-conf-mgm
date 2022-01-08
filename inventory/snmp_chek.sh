#/bin/bash
# вносим snmp name
echo Plz enter snmp
read -p 'snmp: ' snmp
for host in $(cat iplist.txt)
do
echo "$host"
snmpwalk -v2c -c $host $snmp SNMPv2-MIB::sysDescr.0
done
