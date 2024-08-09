#!/bin/bash

curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh

read -sp "Введите пароль для Dashboard: " PASSWORD

expect -c '
set timeout 10

spawn ./installer.sh

expect {
    "By running this installer, you agree to allow the Shardeum team to collect this data. (Y/n)?:" {send "y\r"; exp_continue}
    "What base directory should the node use (default ~/.shardeum):" {send "\r"; exp_continue}
    "Do you want to run the web based Dashboard? (Y/n):" {send "\r"; exp_continue}
    "Set the password to access the Dashboard:" {send "'"$PASSWORD"'\r"; exp_continue}
    "Enter the port (1025-65536) to access the web based Dashboard (default 8080):" {send "8180\r"; exp_continue}
    "If you wish to set an explicit external IP, enter an IPv4 address (default=auto):" {send "\r"; exp_continue}
    "If you wish to set an explicit internal IP, enter an IPv4 address (default=auto):" {send "\r"; exp_continue}
    "This allows p2p communication between nodes. Enter the first port (1025-65536) for p2p communication (default 9001):" {send "\r"; exp_continue}
    "Enter the second port (1025-65536) for p2p communication (default 10001):" {send "\r"; exp_continue}
    eof {break}
}
'

rm ./installer.sh
cd $HOME/.shardeum/ && ./shell.sh
operator-cli start
exit

source $HOME/.shardeum/.env
cd $HOME

echo -e "\033[1;31;40mShardeum установлен. Проверь количество токенов в explorer-sphinx.shardeum.org и делай стейк!\033[m"
