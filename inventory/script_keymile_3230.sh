#!/bin/bash
# удаляем и формируем перечень активного оборудования
if [ -f inventory_keymile_3230.txt ]
then rm inventory_keymile_3230.txt
else touch inventory_keymile_3230.txt
fi
# вносим snmp name
echo Plz enter snmp
read -p 'snmp: ' snmp
# наполняем перечень активного оборудования перебором адресов из файла iplist.txt
for host in $(cat iplist.txt)
do
./snmp_keymile_3230.sh $host $snmp 2>/dev/null &
done
# ожидание окончания работы всех процессов
wait
