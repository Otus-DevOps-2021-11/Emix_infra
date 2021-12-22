#!/bin/bash

USER="yc-user"
IP_INSTANCE=`yc compute instance get reddit-app --format json | jq -r '.network_interfaces[] .primary_v4_address .one_to_one_nat .address'`


ssh $USER@$IP_INSTANCE \
"git clone -b monolith https://github.com/express42/reddit.git && \
cd reddit/ && \
bundle install && \
puma -d"


echo "http://$IP_INSTANCE:9292/"
