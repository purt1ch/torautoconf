if [ "$EUID" -ne 0 ]; then
    echo "❌ Запустите с sudo"
    exit 1
fi

mkdir /etc/tor/torrc.d

# Backup
cp /etc/tor/torrc /etc/tor/torrc.bak
# Replace with new torrc
cp ./deftorrc /etc/tor/torrc
./getbridges.sh
