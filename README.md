# Скрипт для Tor Proxy на GNOME

Удобный способ настроить tor proxy на GNOME
### [Русский](README.md) [English](README_EN.md)
## Гайд
### Установка
Чтобы установить скрипты запустите установщик `setuptorconf.sh`:
```bash
cd torautoconf
chmod +x .
./setuptorconf.sh
```
Получить мосты из репозитория [igareck](https://github.com/igareck/vpn-configs-for-russia/tree/main) (скопируются в буфер + настроится в конфиге tor):
```bash
getbridges
```
Удалить мосты из конфига:
```bash
removebridges
```
### Если у вас GNOME:
Настроить прокси и запустить tor-сервис:
```bash
torgprox
```
### Удаление программы с системы:
В директории скачанного репозитория -
```bash
./uninstall.sh
```
