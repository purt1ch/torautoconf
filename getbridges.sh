
if [ "$EUID" -ne 0 ]; then
    echo "❌ Запустите с sudo"
    exit 1
fi
curl -s https://raw.githack.com/igareck/vpn-configs-for-russia/main/TOR-BRIDGES/TOR_BRIDGES_WEBTUNNEL.txt | while IFS= read -r line; do
    # IFS` (Internal Field Separator) — это системная переменная в Bash, которая определяет **разделитель полей** (слов) в строках. 
    # По умолчанию её значениями являются **пробел, табуляция и перевод строки**. 
    # Когда мы пишем `IFS= read -r line`, мы временно (только для команды `read`) делаем эту переменную **пустой**.
    # Здесь вы можете обрабатывать каждую строку (переменная $line)
    # Например, запишем её в файл:
    echo "$line" > /etc/tor/torrc.d/webtunnel.conf
    if [ $? -eq 0 ]; then
    	touch /etc/torrc.d/webtunnel.conf
    fi
done

curl -s https://raw.githack.com/igareck/vpn-configs-for-russia/main/TOR-BRIDGES/TOR_BRIDGES_OBFS4.txt | while IFS= read -r line; do
    echo "$line" > /etc/tor/torrc.d/obfs4.conf
    if [ $? -eq 0 ]; then
        touch /etc/torrc.d/obfs4.conf
    fi
done

