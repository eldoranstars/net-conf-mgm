#!/bin/bash
# проверяем наличие перечня хостов
if [ ! -f inventory/inventory_keymile_3230.txt ]
then echo inventory/inventory_keymile_3230.txt is absent && exit 1
fi
# выбираем модуль
echo List of accessible modules:
ls modules/keymile_3230/
echo Plz copy module to play from list above:
read -p "modules/keymile_3230/" module
# проверяем наличие модуля
if [ ! -f modules/keymile_3230/$module ]
then echo modules/keymile_3230/$module is absent && exit 1
fi
echo Plz enter your login
read -p 'login: ' login
echo Plz enter your password
read -sp 'password: ' pswd
echo -e "\r"
# выполнение модуля
for host in $(cat inventory/inventory_keymile_3230.txt)
do
./modules/keymile_3230/$module $host $pswd $login> output/keymile_3230/$host.txt 2>&1 &
done
# ожидание окончания работы всех процессов
wait
# для данного модуля нужно выполнить чистку ненужных файлов
if [ "$module" = scp_conf.exp ]
then rm output/keymile_3230/*.txt
fi
