#!/bin/bash

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
    }
}
'

bash <(curl -s https://raw.githubusercontent.com/YAbl0K0/install_shardium/main/install_2.sh)
