if [ "$EUID" -ne 0 ]; then echo "❌ Запустите с sudo"
    exit 1
fi

get_bridges() {
    local link=$1
    local name
    if [[ $link == "webtunnel"* ]]; then
        name="webtunnel"
    elif [[ $link == "obfs4"* ]]; then
        name="obfs4"
    else
        name="top100"
    fi
    touch $name.conf
    curl -s $link | while IFS= read -r line; do
        if [[ "$line" == "webtunnel"* || "$line" == "obfs4"* || "$line" == [0-9]* ]]; then
            echo "Bridge $line" >> $name.conf
        fi
    done
    mv $name.conf /etc/tor/torrc.d/$name.conf
}


# top100 bridges
get_bridges https://raw.githack.com/igareck/vpn-configs-for-russia/main/TOR-BRIDGES/TOR_BRIDGES_WEBTUNNEL.txt
