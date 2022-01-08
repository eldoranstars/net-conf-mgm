#!/bin/bash
# проверяем наличие перечня хостов
if [ ! -f inventory/inventory_moxa_510.txt ]
then echo inventory/inventory_moxa_510.txt is absent && exit 1
fi
# выбираем модуль
echo List of accessible modules:
ls modules/moxa_510/
echo Plz copy module to play from list above:
read -p "modules/moxa_510/" module
# проверяем наличие модуля
if [ ! -f modules/moxa_510/$module ]
then echo modules/moxa_510/$module is absent && exit 1
fi
echo Plz enter your login
read -p 'login: ' login
echo Plz enter your password
read -sp 'password: ' pswd
echo -e "\r"
# выполнение модуля
for host in $(cat inventory/inventory_moxa_510.txt)
do
./modules/moxa_510/$module $host $pswd $login> output/moxa_510/$host.txt 2>&1 &
done
# ожидание окончания работы всех процессов
wait
