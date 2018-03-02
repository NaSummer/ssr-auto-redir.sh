ssr-auto-rediur
---
A fork of [PeterCxy/shadowsocks-auto-redir.sh](https://github.com/PeterCxy/shadowsocks-auto-redir.sh) with shadowsocksr support.


## Prerequisite

1. jq
2. ipset
3. shadowsocksr-libev<sup>[Source](https://github.com/shadowsocksr-backup/shadowsocksr-libev)<sup>


 You can install them from the offical repo or AUR directly if you are using archlinux.

```bash
# archlinux
yaourt -S jq ipset shadowsocksr-libev-git
```

## Config
### local configuration
Create a `local.json` in the project root directory: 
```json
{
  "local_port": 4411,
  "chnroute_url":"http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest",
  "sub_url": "http://your_subscribe_url",
  "bypass_ips": [],
  "bypass_preset": "chnroute",
  "ota": false
}
```
### server configuration
To add a server manually, create a json config file in `config` directory, eg: `config/example.json`
```json
{
    "obfs": "your obfs",
    "obfs_param": "your obfs_param",
    "protocol": "your protocol",
    "protocol_param": "your protocol_param",
    "method": "your method",
    "password": "your password",
    "server": "your server",
    "server_port": 443
}
```


## Usage
```bash
# link this script as a service
./ssr-auto-redir link

# unlink this script 
./ssr-auto-redir unlink

# update the systemd service file
./ssr-auto-redir update

# update server configs from subscribe url
./ssr-auto-redir subscribe

# update the chnroute ip list
./ssr-auto-redir pull

# clear the iptable rules
./ssr-auto-redir clear

# start the proxy using config file: config/example.json
./ssr-auto-redir connect example
```

### As a system service
After using the link command, you can manage this script as a systemd service:

```bash
# start the proxy using config file: config/example.json
sudo systemctl start ssr-auto-redir@example

# monitor the status
systemctl status ssr-auto-redir@example

# stop proxy service
sudo systemctl stop ssr-auto-redir@example

# self-start when login
sudo systemctl enable ssr-auto-redir@example

# disable self-start
sudo systemctl disable ssr-auto-redir@example
```
