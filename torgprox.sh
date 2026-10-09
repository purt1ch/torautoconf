socks5port="$(gsettings get org.gnome.system.proxy.socks port)"
socks5host="$(gsettings get org.gnome.system.proxy.socks host)"
proxymode="$(gsettings get org.gnome.system.proxy mode)"


if [[ $proxymode != "'manual'" || $socks5port != "9050" || $socks5host != "'127.0.0.1'" ]]; then
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy use-same-proxy true
    gsettings set org.gnome.system.proxy.ftp host ''
    gsettings set org.gnome.system.proxy.ftp port 0
    gsettings set org.gnome.system.proxy.http authentication-password ''
    gsettings set org.gnome.system.proxy.http authentication-user ''
    gsettings set org.gnome.system.proxy.http enabled false
    gsettings set org.gnome.system.proxy.http host ''
    gsettings set org.gnome.system.proxy.http port 0
    gsettings set org.gnome.system.proxy.http use-authentication false
    gsettings set org.gnome.system.proxy.https host ''
    gsettings set org.gnome.system.proxy.https port 0
    gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
    gsettings set org.gnome.system.proxy.socks port 9050
    gsettings set org.gnome.system.smb display-mode 'disabled'
    sudo systemctl restart tor -v
else
    gsettings set org.gnome.system.proxy mode 'none'
fi
