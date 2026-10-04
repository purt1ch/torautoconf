if [ "$EUID" -ne 0 ]; then echo "❌ Запустите с sudo"
    exit 1
fi
touch webtunnel.conf
touch obfs4.conf
curl -s https://raw.githack.com/igareck/vpn-configs-for-russia/main/TOR-BRIDGES/TOR_BRIDGES_WEBTUNNEL.txt | while IFS= read -r line; do
    # IFS` (Internal Field Separator) — это системная переменная в Bash, которая определяет **разделитель полей** (слов) в строках. 
    # По умолчанию её значениями являются **пробел, табуляция и перевод строки**. 
    # Когда мы пишем `IFS= read -r line`, мы временно (только для команды `read`) делаем эту переменную **пустой**.
    # Здесь вы можете обрабатывать каждую строку (переменная $line)
    # Например, запишем её в файл:
    if [[ "$line" == webtunnel* ]]; then
        echo "Bridge $line" >> webtunnel.conf
    fi
done
if [ $? -ne 0 ]; then
    touch /etc/tor/torrc.d/webtunnel.conf
    echo "Попробуйте снова"
    exit 1
fi

mv webtunnel.conf /etc/tor/torrc.d/webtunnel.conf

curl -s https://raw.githack.com/igareck/vpn-configs-for-russia/main/TOR-BRIDGES/TOR_BRIDGES_OBFS4.txt | while IFS= read -r line; do
    if [[ "$line" == obfs4* ]]; then
        echo "Bridge $line" >> obfs4.conf
    fi    
done

if [ $? -ne 0 ]; then
    touch /etc/tor/torrc.d/obfs4.conf
    echo "Попробуйте снова"
    exit 1
fi

mv obfs4.conf /etc/tor/torrc.d/obfs4.conf
