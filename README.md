ssr-auto-rediur
---
A fork of [PeterCxy/shadowsocks-auto-redir.sh](https://github.com/PeterCxy/shadowsocks-auto-redir.sh) and add shadowsocks-rss support.


### Prerequisite
You should install following tools before use it:  

1. jq
2. ipset
3. shadowsocksr-redir

```bash
# archlinux
sudo pacman -S jq ipset shadowsocksr-redir
```

### install 
```bash
# install
sudo ./install.sh link

# uninstall
sudo ./install.sh unlink

# update chnroute list
sudo ./install.sh pull
```

### Config
following is an example:  `config/example.json`
```json
{
    "obfs": "your obfs",
    "protocol": "your protocol",
    "method": "your method",
    "password": "your password",
    "server": "your server",
    "server_port": 443,
    "local_port": 1080,
    "ssr_redir_options": {
        "bypass_ips": [],
        "bypass_preset": "chnroute",
        "ota": true
    }
}
```
# Usage
```bash
# start proxy service
sudo systemctl start ssr-auto-redir@example

# show status
systemctl status ssr-auto-redir@example

# stop proxy service
sudo systemctl stop ssr-auto-redir@example

# clear iptable settings
sudo systemctl start ssr-auto-redir@clear

# autostart
sudo systemctl enable ssr-auto-redir@example

# disable autostart
sudo systemctl disable ssr-auto-redir@example

```



### enable udp forward
```json
  "ssr_redir_options": {
    "udp_relay": true
  }
```
