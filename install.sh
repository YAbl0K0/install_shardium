#!/bin/bash

apt install expect -y
bash <(curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/main.sh)
bash <(curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/docker.sh)
curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh

expect -c '
set timeout 5

spawn ./installer.sh

expect "By running this installer, you agree to allow the Shardeum team to collect this data. (Y/n)?:" 
send "\r"

expect "What base directory should the node use (default ~/.shardeum):" 
send "\r"

expect "Do you want to run the web based Dashboard? (y/n):" 
send "\r"

expect eof
'

bash <(curl -s https://raw.githubusercontent.com/YAbl0K0/install_shardium/main/install_2.sh)
