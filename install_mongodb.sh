#!/bin/bash

USER="yc-user"
IP_INSTANCE=`yc compute instance get reddit-app --format json | jq -r '.network_interfaces[] .primary_v4_address .one_to_one_nat .address'`




ssh $USER@$IP_INSTANCE \
"wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add - && \
echo \"deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse\" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list && \
sudo apt update && \
sudo apt-get install -y mongodb-org && \
sudo systemctl start mongod && \
sudo systemctl enable mongod && \
sudo systemctl status mongod"
