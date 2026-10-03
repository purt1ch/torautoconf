if [ "$EUID" -ne 0 ]; then
    echo "❌ Запустите с sudo"
    exit 1
fi

mkdir /etc/tor/torrc.d
touch /etc/tor/torrc.d/webtunnel.conf
touch /etc/tor/torrc.d/obfs4.conf
# Backup
cp /etc/tor/torrc /etc/tor/torrc.bak
# Replace with new torrc
cp ./deftorrc /etc/tor/torrc
./getbridges.sh
