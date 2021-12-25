#!/bin/bash

USER="yc-user"
IP_INSTANCE=`yc compute instance get reddit-app --format json | jq -r '.network_interfaces[] .primary_v4_address .one_to_one_nat .address'`

ssh $USER@$IP_INSTANCE \
"sudo apt update && \
sudo apt install -y ruby-full git ruby-bundler build-essential"
