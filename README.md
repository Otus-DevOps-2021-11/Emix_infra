# Emix_infra
Emix Infra repository

task1

ssh -A -t 62.84.114.0 ssh emil@10.128.0.32


tesk2

Host internal
  User emil
  ProxyCommand ssh emil@62.84.114.0 nc 10.128.0.32 22
