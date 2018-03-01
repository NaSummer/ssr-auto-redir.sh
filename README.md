ssr-auto-rediur
---
A fork of [PeterCxy/shadowsocks-auto-redir.sh](https://github.com/PeterCxy/shadowsocks-auto-redir.sh) and add shadowsocks-rss support.


## Prerequisite
You should install following tools before use it:  

1. jq
2. ipset
3. shadowsocksr-libev<sup>[Source](https://github.com/shadowsocksr-backup/shadowsocksr-libev)<sup>


If you are using archlinux, you can install them from the offical repo or AUR easily.
```bash
# archlinux
yaourt -S jq ipset shadowsocksr-libev-git
```

## Config
create a json config file in `config` directory, following is an example:  `config/example.json`
```json
{
    "obfs": "your obfs",
    "obfs_param": "your obfs_param",
    "protocol": "your protocol",
    "protocol_param": "your protocol_param",
    "method": "your method",
    "password": "your password",
    "server": "your server",
    "server_port": 443,
    "local_port": 1080,
    "local_address":"127.0.0.1",
    "ssr_redir_options": {
        "bypass_ips": [],
        "bypass_preset": "chnroute",
        "ota": true
    }
}
```


## Usage
```bash
# link this script as a system daemon
./ssr-auto-redir link
# unlink this script 
./ssr-auto-redir unlink
# update the systemd service file
./ssr-auto-redir update
# update the chnroute ip list
./ssr-auto-redir pull
# clear the iptable rules
./ssr-auto-redir clear
# start the proxy service using config file: example in the config directory
./ssr-auto-redir connect example
```

### As a system daemon
After using the link command, you can manage this script as a systemd service:

```bash
# start the proxy service using config file: example in the config directory
sudo systemctl start ssr-auto-redir@example

# show status
systemctl status ssr-auto-redir@example

# stop proxy service
sudo systemctl stop ssr-auto-redir@example

# autostart when you login
sudo systemctl enable ssr-auto-redir@example

# disable service autostart
sudo systemctl disable ssr-auto-redir@example
```






### Enable udp forward
This feature is still in TODO List
<!-- ```json
  "ssr_redir_options": {
    "udp_relay": true
  }
``` -->
