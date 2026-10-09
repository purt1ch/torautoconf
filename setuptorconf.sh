if [ -z /etc/tor/torrc.d ]; then
    sudo mkdir /etc/tor/torrc.d
fi

# Backup
if [[ -z /etc/tor/torrc.bak ]]; then
    sudo cp /etc/tor/torrc /etc/tor/torrc.bak
    echo "Создал бэкап /etc/tor/torrc.bak"
else
    echo "Бэкап /etc/tor/torrc.bak уже есть"
fi

# Replace with new torrc
sudo cp ./deftorrc /etc/tor/torrc

# Добавление в bin для быстрого запуска
sudo cp ./getbridges.sh /usr/bin/getbridges
sudo cp ./removebridges.sh /usr/bin/removebridges
sudo chmod +x /usr/bin/getbridges
sudo chmod +x /usr/bin/removebridges
echo "** Для установки мостов введите: getbridges"
echo "** Для удаления мостов введите: removebridges"

# Установка мостов
echo "Запуск скрипта по установке мостов..."
getbridges
