if [ "$EUID" -ne 0 ]; then
    echo "❌ Запустите с sudo"
    exit 1
fi

if [ -z /etc/tor/torrc.d ]; then
    mkdir /etc/tor/torrc.d
fi

# Backup
if [[ -z /etc/tor/torrc.bak ]]; then
    cp /etc/tor/torrc /etc/tor/torrc.bak
    echo "Создал бэкап /etc/tor/torrc.bak"
else
    echo "Бэкап уже есть"
fi
# Replace with new torrc
cp ./deftorrc /etc/tor/torrc
./getbridges.sh
