sudo rm /usr/bin/getbridges /usr/bin/removebridges /usr/bin/torgprox
if [ $? -eq 0 ]; then
    echo "Удалил скрипты установки/удалния мостов"
fi
sudo cp /etc/tor/torrc /etc/tor/torrc.script.bak
sudo mv /etc/tor/torrc.bak /etc/tor/torrc
if [ $? -eq 0 ]; then
    echo "Восстановил бэкап"
fi
