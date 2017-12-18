#!/bin/bash
link() {
    ln -sf $PWD /opt/ssr-auto-redir
    cp $PWD/systemd/ssr-auto-redir@.service /etc/systemd/system/ssr-auto-redir@.service
    systemctl daemon-reload
}

unlink() {
    rm -rf /opt/ssr-auto-redir
    rm -rf /etc/systemd/system/ssr-auto-redir@.service
    systemctl daemon-reload
}

update() {
    rm -rf /etc/systemd/system/ssr-auto-redir@.service
    cp $PWD/systemd/ssr-auto-redir@.service /etc/systemd/system/ssr-auto-redir@.service
    systemctl daemon-reload
}
pull(){
    mv -f $PWD/routes/chnroute.txt $PWD/routes/chnroute.txt.bak
    curl 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | grep ipv4 | grep CN | awk -F\| '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > $PWD/routes/chnroute.txt
    systemctl daemon-reload
}

# MUST be run as root
if [ `id -u` != "0" ]; then
    echo "This script MUST BE run as ROOT"
    exit 1
fi

if [[ "$1" == "link" ]]; then
    link
elif [[ "$1" == "unlink" ]]; then
    unlink
elif [[ "$1" == "update" ]]; then
    update
elif [[ "$1" == "pull" ]]; then
    pull
else
    echo "Unknown option: $1, available options: link unlink update pull"
fi
