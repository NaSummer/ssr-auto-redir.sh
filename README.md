shadowsocks-auto-redir.sh
---
A fork of [PeterCxy/shadowsocks-auto-redir.sh](https://github.com/PeterCxy/shadowsocks-auto-redir.sh) add a bunch of features.

### update chnroute list
```bash
sudo ./install.sh pull
```

### enable udp forward
```json
  "ss_redir_options": {
    "udp_relay": true
  }
```
