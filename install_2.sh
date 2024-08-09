#!/bin/bash

# Запрос пароля у пользователя
read -sp "Введите пароль: " NEW_PASSWORD

# Переход в директорию Shardeum и запуск оболочки
cd $HOME/.shardeum/ && ./shell.sh << EOF
operator-cli start
operator-cli gui set password "$NEW_PASSWORD"
operator-cli gui restart
exit
EOF

# Удаление установочного скрипта и обновление окружения
rm ./installer.sh
source $HOME/.shardeum/.env
cd $HOME
