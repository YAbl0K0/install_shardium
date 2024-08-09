#!/bin/bash

apt install expect -y
bash <(curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/main.sh)
bash <(curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/docker.sh)
curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh

expect -c '
set timeout 5

spawn ./installer.sh

while 1 {
    expect {
        "By running this installer, you agree to allow the Shardeum team to collect this data. (Y/n)?:" {send "y\r"}
        "What base directory should the node use (default ~/.shardeum):" {send "\r"}
        "Do you want to run the web based Dashboard? (Y/n):" {send "\r"}
        "Set the password to access the Dashboard:" {interact}
        "Enter the port (1025-65536) to access the web based Dashboard" {send "8180\r"}
        "If you wish to set an explicit external IP, enter an IPv4 address" {send "\r"}
        "If you wish to set an explicit internal IP, enter an IPv4 address" {send "\r"}
        "This allows p2p communication between nodes. Enter the first port (1025-65536) for p2p communication (default 9001):" {send "\r"}
        "Enter the second port (1025-65536) for p2p communication (default 10001):" {send "\r"}
        eof {break}
    }
}
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
