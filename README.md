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
