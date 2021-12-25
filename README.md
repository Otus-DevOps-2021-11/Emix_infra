# Emix_infra
Emix Infra repository

get IP bastion

```
yc compute instance get bastion --format json | -r jq '.network_interfaces[] .primary_v4_address .one_to_one_nat .address'
```



### task1

ssh -A -t 62.84.114.0 ssh emil@10.128.0.32


### task2

```
Host internal
  User emil
  ProxyCommand ssh emil@62.84.117.108 nc 10.128.0.32 22
```


testapp_IP = 84.252.133.83
testapp_port = 9292

REQUIREMENTS
------------
* Yandex CLI
* Yandec Cloud Account

#### Создаем виртуальную машину
```bash
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-c,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/id_rsa.pub
```

#### Установка Ruby

```bash
./install_ruby.sh
```
#### Установка MongoDB

```bash
./install_ruby.sh
```

#### Деплой приложения

```bash
./deploy.sh
```

#### Результат
```
* Version 3.10.0 (ruby 2.3.1-p112), codename: Russell's Teapot
* Min threads: 0, max threads: 16
* Environment: development
* Daemonizing...
http://84.252.133.83:9292/
```

#### Packer

Запуск создания образа для Yandex.Cloud без установки Packer



```
cd packer

docker run --env YC_TOKEN=$YC_TOKEN -it --rm \
-v `pwd`:/workspace -w /workspace \
hashicorp/packer:latest \
build -var-file=variables.json immutable.json

```
