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
    echo "Добавлено $bridgecount актуальных мостов из $name"
    head -n $bridgecount "$name.conf" > temp.txt
    rm "$name.conf"
    cat temp.txt | xclip -selection clipboard
    if [ $? -eq 0 ]; then
        echo "Папка успешно скопирована в буфер обмена"
        if [ -z xclip ]; then
            rm xclip
        fi
    else
        echo "Не удалось скопировать в буфер обмена. Проверьте установку xclip"
    fi
    mv temp.txt /etc/tor/torrc.d/$name.conf
}

# top100 bridges
get_bridges top100 5 https://raw.githubusercontent.com/igareck/vpn-configs-for-russia/refs/heads/main/TOR-BRIDGES/TOR_BRIDGES_TOP100.txt
