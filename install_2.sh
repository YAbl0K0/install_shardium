#!/bin/bash

# Запрос пароля у пользователя
read -sp "Введите пароль: " NEW_PASSWORD

# Переход в директорию Shardeum и запуск оболочки
cd $HOME/.shardeum/ && ./shell.sh

sudo operator-cli start
sudo operator-cli gui set password "$NEW_PASSWORD"
sudo operator-cli gui restart

# Удаление установочного скрипта и обновление окружения
rm ./installer.sh
source $HOME/.shardeum/.env
cd $HOME
