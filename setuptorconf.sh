if [ -z /etc/tor/torrc.d ]; then
    sudo mkdir /etc/tor/torrc.d
fi

# Backup
if [[ -f /etc/tor/torrc.bak ]]; then
    echo "Бэкап /etc/tor/torrc.bak уже есть"
else
    sudo cp /etc/tor/torrc /etc/tor/torrc.bak
    echo "Создал бэкап /etc/tor/torrc.bak"
fi

# Replace with new torrc
sudo cp ./deftorrc /etc/tor/torrc

# Добавление в bin для быстрого запуска
sudo cp ./getbridges.sh /usr/bin/getbridges
sudo cp ./removebridges.sh /usr/bin/removebridges
sudo cp ./torgprox.sh /usr/bin/torgprox
sudo chmod +x /usr/bin/getbridges
sudo chmod +x /usr/bin/removebridges
sudo chmod +x /usr/bin/torgprox

echo "** Для установки мостов введите: getbridges"
echo "** Для удаления мостов введите: removebridges"
echo "** Для запуска/остановки прокси TOR введите: torgprox"

# Установка мостов
echo "Запуск скрипта по установке мостов..."
getbridges
