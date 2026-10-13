# Script for easy TOR proxy installation
### and getting bridges
## Guide
### Installation
Run the `setuptorconf.sh` to install the script:
```bash
cd torautoconf
chmod +x .
./setuptorconf.sh
```
To get bridges from [igareck](https://github.com/igareck/vpn-configs-for-russia/tree/main) (copies into buffer and auto-injects into torrc) use:
```bash
getbridges
```
To delete bridges fror torrc use:
```bash
removebridges
```
### If you use GNOME:
Configure proxy and start(restart) tor.service using:
```bash
torgprox
```
### If you want to remove script from your system:
Go to directory of your `repo`  -
```bash
./uninstall.sh
```
