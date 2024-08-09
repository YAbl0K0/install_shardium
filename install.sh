#!/bin/bash

curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh

expect -c '
set timeout 10

spawn ./installer.sh

expect {
    "By running this installer, you agree to allow the Shardeum team to collect this data. (Y/n)?:" {send "y\r"; exp_continue}
    "What base directory should the node use (default ~/.shardeum):" {send "\r"; exp_continue}
    "Do you want to run the web based Dashboard? (Y/n):" {send "\r"; exp_continue}
    "Set the password to access the Dashboard:" {send "pass\r"; exp_continue}
    "Enter the port (1025-65536) to access the web based Dashboard (default 8080):" {send "8180\r"; exp_continue}
    "If you wish to set an explicit external IP, enter an IPv4 address (default=auto):" {send "\r"; exp_continue}
    "If you wish to set an explicit internal IP, enter an IPv4 address (default=auto):" {send "\r"; exp_continue}
    "This allows p2p communication between nodes. Enter the first port (1025-65536) for p2p communication (default 9001):" {send "\r"; exp_continue}
    "Enter the second port (1025-65536) for p2p communication (default 10001):" {send "\r"; exp_continue}
    eof {break}
}
'

bash <(curl -s https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh)

