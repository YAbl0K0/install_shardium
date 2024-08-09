#!/bin/bash

# Запрашиваем пароль у пользователя
read -sp "Введите пароль: " NEW_PASSWORD
echo  # Добавляем перевод строки после ввода пароля

# Присваиваем пароль переменной
MY_PASSWORD="$NEW_PASSWORD"

# Переходим в директорию и запускаем команды в новой среде
cd $HOME/.shardeum/ && ./shell.sh << EOF
operator-cli start
operator-cli gui set password "$MY_PASSWORD"
operator-cli gui restart
exit
EOF

# Удаляем установочный скрипт и обновляем окружение
rm ./installer.sh
source $HOME/.shardeum/.env
cd $HOME
