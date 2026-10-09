if [ "$EUID" -ne 0 ]; then echo "❌ Запустите с sudo"
    exit 1
fi

get_bridges() {
    local link=$3
    local name=$1
    local bridgecount=$2
    touch "$name.conf"
    curl -s $link | while IFS= read -r line;
    do
        if [[ "$line" == "webtunnel"* || "$line" == "obfs4"* || "$line" == [0-9]* ]]; then
            echo "Bridge $line" >> "$name.conf"
        fi
    done
    echo $bridgecount
    head -n 5 "$name.conf" > temp.txt
    mv temp.txt /etc/tor/torrc.d/$name.conf
}

# top100 bridges
get_bridges top100 5 https://raw.githubusercontent.com/igareck/vpn-configs-for-russia/refs/heads/main/TOR-BRIDGES/TOR_BRIDGES_TOP100.txt
