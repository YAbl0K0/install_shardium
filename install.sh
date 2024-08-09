#!/bin/bash

apt install expect -y
bash <(curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/main.sh)
bash <(curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/docker.sh)
curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh

expect -c '
set timeout -1

spawn ./installer.sh

expect "By running this installer, you agree to allow the Shardeum team to collect this data. (Y/n)?:" 
send "y\r"

expect "What base directory should the node use (default ~/.shardeum):" 
send "\r"

expect "Do you want to run the web based Dashboard? (y/n):" 
send "\r"

expect "Set the password to access the Dashboard:"
# ожидание ручного ввода
interact

# продолжение после ручного ввода
expect "Enter the port (1025-65536) to access the web based Dashboard" 
send "8180\r"

expect "If you wish to set an explicit external IP, enter an IPv4 address" 
send "\r"

expect "If you wish to set an explicit internal IP, enter an IPv4 address" 
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

echo -e "\033[1;31;40mShardeum оновлений. Перевір кількість токенів в explorer-sphinx.shardeum.org і зроби стейк!\033[m"
