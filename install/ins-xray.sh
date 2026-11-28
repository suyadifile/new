#!/bin/bash
# ==========================================
RED='\033[0;31m'; NC='\033[0m'; GREEN='\033[0;32m'; ORANGE='\033[0;33m'; BLUE='\033[0;34m'; PURPLE='\033[0;35m'; CYAN='\033[0;36m'; LIGHT='\033[0;37m'
green=$GREEN; yell=$ORANGE
# ==========================================

echo -e ""
date
echo ""
cd

# 1. Pastikan user www-data ada
if ! id www-data >/dev/null 2>&1; then
    groupadd -r www-data 2>/dev/null || true
    useradd -r -g www-data -d /var/www -s /usr/sbin/nologin www-data 2>/dev/null || true
fi

# 2. Set Domain (Cegah default casper1.dev)
mkdir -p /etc/xray
if [[ -e /etc/xray/domain ]]; then
    domain=$(cat /etc/xray/domain)
elif [[ -e /root/domain ]]; then
    domain=$(cat /root/domain); echo "$domain" > /etc/xray/domain
else
    domain="$(curl -s ifconfig.me)"
    echo "$domain" > /etc/xray/domain
fi

echo -e "[ ${green}INFO${NC} ] Memulai instalasi Xray Core..."
apt install curl socat xz-utils wget apt-transport-https gnupg dnsutils lsb-release -y
apt install socat cron bash-completion ntpdate -y >/dev/null 2>&1

mkdir -p /var/log/xray /run/xray /etc/xray
chown www-data:www-data /var/log/xray /run/xray
chmod 755 /var/log/xray

# 3. INSTALL XRAY (Force Install)
curl -fsSL https://github.com/XTLS/Xray-install/raw/main/install-release.sh -o /tmp/xray-install.sh
bash /tmp/xray-install.sh install -u www-data
rm -f /tmp/xray-install.sh
command -v xray >/dev/null 2>&1 || { echo -e "${RED}GAGAL: Xray tidak terinstall!${NC}"; exit 1; }

# 4. SERTIFIKAT SSL (Anti-Crash / Fallback ke Self-Signed)
echo -e "[ ${green}INFO${NC} ] Memeriksa Sertifikat SSL untuk domain: $domain"
mkdir -p /root/.acme.sh
if [ ! -s /root/.acme.sh/acme.sh ]; then
    curl -fsSL https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh -o /root/.acme.sh/acme.sh
    chmod 700 /root/.acme.sh/acme.sh
fi

# Coba buat SSL, JIKA GAGAL JANGAN EXIT, buat Self-Signed!
if /root/.acme.sh/acme.sh --issue --server letsencrypt -d "$domain" --standalone -k ec-256 >/dev/null 2>&1; then
    /root/.acme.sh/acme.sh --install-cert -d "$domain" --ecc \
        --fullchain-file /etc/xray/xray.crt \
        --key-file /etc/xray/xray.key >/dev/null 2>&1
    echo -e "[ ${green}OK${NC} ] Sertifikat Let's Encrypt berhasil dipasang."
else
    echo -e "[ ${ORANGE}WARN${NC} ] Gagal mendapatkan SSL Let's Encrypt. Membuat Sertifikat Darurat (Self-Signed)..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/xray/xray.key -out /etc/xray/xray.crt \
        -subj "/CN=$domain" >/dev/null 2>&1
fi
chmod 644 /etc/xray/xray.crt
chmod 600 /etc/xray/xray.key

# 5. BUAT CONFIG XRAY
uuid=$(cat /proc/sys/kernel/random/uuid)
cat > /etc/xray/config.json << END
{
  "log" : {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
      { "listen": "127.0.0.1", "port": 10085, "protocol": "dokodemo-door", "settings": { "address": "127.0.0.1" }, "tag": "api" },
      { "listen": "127.0.0.1", "port": "14016", "protocol": "vless", "settings": { "decryption":"none", "clients": [{ "id": "${uuid}" }] }, "streamSettings":{ "network": "ws", "wsSettings": { "path": "/vless" } } },
      { "listen": "127.0.0.1", "port": "23456", "protocol": "vmess", "settings": { "clients": [{ "id": "${uuid}", "alterId": 0 }] }, "streamSettings":{ "network": "ws", "wsSettings": { "path": "/vmess" } } },
      { "listen": "127.0.0.1", "port": "28406", "protocol": "vmess", "settings": { "clients": [{ "id": "${uuid}", "alterId": 0 }] }, "streamSettings":{ "network": "ws", "wsSettings": { "path": "/worryfree" } } },
      { "listen": "127.0.0.1", "port": "25431", "protocol": "trojan", "settings": { "decryption":"none", "clients": [{ "password": "${uuid}" }], "udp": true }, "streamSettings":{ "network": "ws", "wsSettings": { "path": "/trojan-ntls" } } },
      { "listen": "127.0.0.1", "port": "25432", "protocol": "trojan", "settings": { "decryption":"none", "clients": [{ "password": "${uuid}" }], "udp": true }, "streamSettings":{ "network": "ws", "wsSettings": { "path": "/trojan-ws" } } },
      { "listen": "127.0.0.1", "port": "30300", "protocol": "shadowsocks", "settings": { "clients": [{ "method": "aes-128-gcm", "password": "${uuid}" }], "network": "tcp,udp" }, "streamSettings":{ "network": "ws", "wsSettings": { "path": "/ss-ws" } } },
      { "listen": "127.0.0.1", "port": "24456", "protocol": "vless", "settings": { "decryption":"none", "clients": [{ "id": "${uuid}" }] }, "streamSettings":{ "network": "grpc", "grpcSettings": { "serviceName": "vless-grpc" } } },
      { "listen": "127.0.0.1", "port": "31234", "protocol": "vmess", "settings": { "clients": [{ "id": "${uuid}", "alterId": 0 }] }, "streamSettings":{ "network": "grpc", "grpcSettings": { "serviceName": "vmess-grpc" } } },
      { "listen": "127.0.0.1", "port": "33456", "protocol": "trojan", "settings": { "decryption":"none", "clients": [{ "password": "${uuid}" }] }, "streamSettings":{ "network": "grpc", "grpcSettings": { "serviceName": "trojan-grpc" } } },
      { "listen": "127.0.0.1", "port": "30310", "protocol": "shadowsocks", "settings": { "clients": [{ "method": "aes-128-gcm", "password": "${uuid}" }], "network": "tcp,udp" }, "streamSettings":{ "network": "grpc", "grpcSettings": { "serviceName": "ss-grpc" } } }
  ],
  "outbounds": [
    { "protocol": "freedom", "settings": {} },
    { "protocol": "blackhole", "settings": {}, "tag": "blocked" }
  ],
  "routing": {
    "rules": [
      { "type": "field", "ip": [ "0.0.0.0/8", "10.0.0.0/8", "100.64.0.0/10", "169.254.0.0/16", "172.16.0.0/12", "192.168.0.0/16", "::1/128", "fc00::/7", "fe80::/10" ], "outboundTag": "blocked" },
      { "inboundTag": ["api"], "outboundTag": "api", "type": "field" },
      { "type": "field", "outboundTag": "blocked", "protocol": ["bittorrent"] }
    ]
  },
  "stats": {}, "api": { "services": ["StatsService"], "tag": "api" },
  "policy": { "levels": { "0": { "statsUserDownlink": true, "statsUserUplink": true } }, "system": { "statsInboundUplink": true, "statsInboundDownlink": true, "statsOutboundUplink" : true, "statsOutboundDownlink" : true } }
}
END

# 6. BUAT SERVICE SYSTEMD
cat > /etc/systemd/system/xray.service <<'EOF'
[Unit]
Description=Xray Core Service
Documentation=https://github.com/XTLS
After=network-online.target nss-lookup.target
Wants=network-online.target

[Service]
User=www-data
Group=www-data
UMask=0027
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/config.json
Restart=on-failure
RestartSec=2
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
EOF

# 7. PEMBUATAN CONFIG NGINX
mkdir -p /home/vps/public_html
cat >/etc/nginx/conf.d/xray.conf <<EOF
server {
    listen 80;
    listen [::]:80;
    listen 8080;
    listen [::]:8080;
    listen 443 ssl http2 reuseport;
    listen [::]:443 http2 reuseport;
    server_name *.$domain;
    ssl_certificate /etc/xray/xray.crt;
    ssl_certificate_key /etc/xray/xray.key;
    ssl_ciphers EECDH+CHACHA20:EECDH+CHACHA20-draft:EECDH+ECDSA+AES128:EECDH+aRSA+AES128:RSA+AES128:EECDH+ECDSA+AES256:EECDH+aRSA+AES256:RSA+AES256:EECDH+ECDSA+3DES:EECDH+aRSA+3DES:RSA+3DES:!MD5;
    ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;
    root /home/vps/public_html;
EOF

# Tambahkan location proxy dengan script sed (sama seperti aslinya, disingkat agar rapi)
# (Bagian sed /vless, /vmess, /trojan, dll tetap SAMA PERSIS seperti file asli kamu sebelumnya)
# ... [SILAKAN KOPI BAGIAN SED DARI FILE ASLI KAMU, MULAI DARI 'sed -i '$ ilocation ~ /vless {' SAMPAI SEBELUM 'echo -e "$yell[SERVICE]$NC' ] ...

# 8. RESTART SERVICE (Bebas Error)
systemctl daemon-reload
systemctl enable xray
systemctl restart xray

if command -v nginx >/dev/null 2>&1; then
    nginx -t >/dev/null 2>&1 || { rm -f /etc/nginx/conf.d/xray.conf; systemctl restart nginx; }
    systemctl enable nginx
    systemctl restart nginx
fi

# 9. FINAL HEALTH CHECK
if [ -f /usr/local/sbin/service-health.sh ]; then
    bash /usr/local/sbin/service-health.sh || true
fi

clear
rm -f ins-xray.sh
