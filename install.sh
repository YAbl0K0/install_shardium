#!/bin/bash

curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh

expect -c '
set timeout 5

spawn ./installer.sh

expect "By running this installer, you agree to allow the Shardeum team to collect this data. (Y/n)?:"
send "y\r"

expect "What base directory should the node use (default ~/.shardeum):"
send "\r"

expect "Do you want to run the web based Dashboard? (Y/n):"
send "\r"

# Ввод пароля вручную
expect "Set the password to access the Dashboard:"
interact

# Продолжение после ручного ввода пароля
expect "Enter the port (1025-65536) to access the web based Dashboard (default 8080):"
send "8180\r"

expect "If you wish to set an explicit external IP, enter an IPv4 address (default=auto):"
send "\r"

expect "If you wish to set an explicit internal IP, enter an IPv4 address (default=auto):"
send "\r"

expect "This allows p2p communication between nodes. Enter the first port (1025-65536) for p2p communication (default 9001):"
send "\r"

expect "Enter the second port (1025-65536) for p2p communication (default 10001):"
send "\r"

expect eof
'

rm ./installer.sh
cd $HOME
source $HOME/.shardeum/.env
cd /root/.shardeum
./shell.sh
operator-cli start
exit
cd $HOME

echo -e "\033[1;31;40mShardeum установлен. Проверь количество токенов в explorer-sphinx.shardeum.org и делай стейк!\033[m"
