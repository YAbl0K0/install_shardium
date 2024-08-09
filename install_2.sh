#!/bin/bash

# Запрашиваем пароль у пользователя
read -sp "Введите пароль: " NEW_PASSWORD
echo  # Перевод строки после ввода пароля

# Выполняем команды внутри контейнера Docker
docker exec -i shardeum-dashboard operator-cli start
docker exec -i shardeum-dashboard operator-cli gui set password "$NEW_PASSWORD"
docker exec -i shardeum-dashboard operator-cli gui restart

# Удаление установочного скрипта и обновление окружения
rm ./installer.sh
source $HOME/.shardeum/.env
cd $HOME
