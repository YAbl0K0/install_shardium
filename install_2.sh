#!/bin/bash

rm ./installer.sh
cd $HOME/.shardeum/ && ./shell.sh
operator-cli start
exit

source $HOME/.shardeum/.env
cd $HOME

echo -e "\033[1;31;40mShardeum установлен. Проверь количество токенов в explorer-sphinx.shardeum.org и делай стейк!\033[m"
