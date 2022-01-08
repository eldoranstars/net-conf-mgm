#!/bin/bash
# удаляем и формируем перечень активного оборудования
if [ -f inventory_moxa_510.txt ]
then rm inventory_moxa_510.txt
else touch inventory_moxa_510.txt
fi
# вносим snmp name
echo Plz enter snmp
read -p 'snmp: ' snmp
# наполняем перечень активного оборудования перебором адресов из файла iplist.txt
for host in $(cat iplist.txt)
do
./snmp_moxa_510.sh $host $snmp 2>/dev/null &
done
# ожидание окончания работы всех процессов
wait
