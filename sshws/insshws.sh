#!/usr/bin/env bash
set -Eeuo pipefail

if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
  echo "Jalankan installer sebagai root." >&2
  exit 1
fi

REPO="https://raw.githubusercontent.com/suyadifile/new/main/sshws"
install -d -m 0755 /usr/local/bin

if ! command -v python3 >/dev/null 2>&1; then
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y python3
fi

fetch_script() {
  local remote="$1" target="$2"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$REPO/$remote" -o "$target"
  else
    wget -qO "$target" "$REPO/$remote"
  fi
  chmod 0755 "$target"
  /usr/bin/python3 -m py_compile "$target"
}

fetch_script ws-dropbear /usr/local/bin/ws-dropbear
fetch_script ws-ovpn /usr/local/bin/ws-ovpn
fetch_script ws-stunnel /usr/local/bin/ws-stunnel

cat > /etc/systemd/system/ws-dropbear.service <<'UNIT'
[Unit]
Description=SUYADI VPN WebSocket bridge for Dropbear
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/python3 -u /usr/local/bin/ws-dropbear 2095
Restart=on-failure
RestartSec=2
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
UNIT

cat > /etc/systemd/system/ws-ovpn.service <<'UNIT'
[Unit]
Description=SUYADI VPN WebSocket bridge for OpenVPN
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/python3 -u /usr/local/bin/ws-ovpn 2086
Restart=on-failure
RestartSec=2
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
UNIT

cat > /etc/systemd/system/ws-stunnel.service <<'UNIT'
[Unit]
Description=SUYADI VPN local WebSocket bridge
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/python3 -u /usr/local/bin/ws-stunnel 700
Restart=on-failure
RestartSec=2
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
UNIT

systemctl daemon-reload
systemctl enable --now ws-dropbear.service ws-ovpn.service ws-stunnel.service
systemctl --no-pager --full status ws-dropbear.service ws-ovpn.service ws-stunnel.service || true
