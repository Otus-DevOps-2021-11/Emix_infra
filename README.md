# Emix_infra
Emix Infra repository

get IP bastion
yc compute instance get bastion --format json | -r jq '.network_interfaces[] .primary_v4_address .one_to_one_nat .address'



task1

ssh -A -t 62.84.114.0 ssh emil@10.128.0.32


tesk2

Host internal
  User emil
  ProxyCommand ssh emil@62.84.114.0 nc 10.128.0.32 22


bastion_IP = 62.84.117.108
someinternalhost_IP = 10.128.0.32
