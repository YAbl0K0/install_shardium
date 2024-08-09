#!/bin/bash

read -s "Введите пароль: " NEW_PASSWORD

cd $HOME/.shardeum/ && ./shell.sh

operator-cli start
operator-cli gui set password "$NEW_PASSWORD"
operator-cli gui restart
exit

rm ./installer.sh
source $HOME/.shardeum/.env
cd $HOME

echo -e "\033[1;31;40mShardeum установлен. Проверь количество токенов в explorer-sphinx.shardeum.org и делай стейк!\033[m"
