#!/bin/bash

# Запрос пароля у пользователя
read -sp "Введите пароль: " NEW_PASSWORD

# Переход в директорию Shardeum и запуск оболочки
expect -c '
spawn bash -c \"cd $HOME/.shardeum/ && ./shell.sh\"

expect \"node@b16999ac25f0:~#\" {send \"operator-cli start\r\"; exp_continue}
expect \"node@b16999ac25f0:~#\" {send \"operator-cli gui set password $NEW_PASSWORD\r\"; exp_continue}
expect \"node@b16999ac25f0:~#\" {send \"operator-cli gui restart\r\"; exp_continue}
expect \"node@b16999ac25f0:~#\" {send \"exit\r\"; exp_continue}
'

# Удаление установочного скрипта и обновление окружения
rm ./installer.sh
source $HOME/.shardeum/.env
cd $HOME
