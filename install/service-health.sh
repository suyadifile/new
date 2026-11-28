#!/bin/bash
# install/service-health.sh
# Verifikasi akhir: pastikan ssh, dropbear, nginx, xray, stunnel4 aktif & enabled.
# Dipanggil otomatis di akhir ins-xray.sh dan ssh-vpn.sh.

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

FAILED=0

check_service() {
    local unit="$1"
    if ! systemctl list-unit-files 2>/dev/null | grep -q "^${unit}\.service"; then
        echo -e "${YELLOW}[SKIP]${NC} $unit (belum terinstall)"
        return 0
    fi
    systemctl enable "$unit" >/dev/null 2>&1
    if ! systemctl is-active --quiet "$unit"; then
        systemctl restart "$unit" 2>/dev/null
        sleep 2
    fi
    if systemctl is-active --quiet "$unit"; then
        echo -e "${GREEN}[OK]${NC} $unit : active"
        return 0
    fi
    echo -e "${RED}[FAIL]${NC} $unit : inactive"
    journalctl -u "$unit" -n 10 --no-pager 2>/dev/null | sed 's/^/    /'
    FAILED=$((FAILED+1))
}

for svc in ssh dropbear nginx xray stunnel4; do
    check_service "$svc"
done

if command -v nginx >/dev/null 2>&1; then
    if nginx -t >/dev/null 2>&1; then
        echo -e "${GREEN}[OK]${NC} nginx config : valid"
    else
        echo -e "${RED}[FAIL]${NC} nginx config : invalid"
        nginx -t 2>&1 | sed 's/^/    /'
        FAILED=$((FAILED+1))
    fi
fi

if command -v xray >/dev/null 2>&1 && [ -f /etc/xray/config.json ]; then
    if xray -test -config /etc/xray/config.json >/dev/null 2>&1; then
        echo -e "${GREEN}[OK]${NC} xray config  : valid"
    else
        echo -e "${RED}[FAIL]${NC} xray config  : invalid"
        xray -test -config /etc/xray/config.json 2>&1 | sed 's/^/    /'
        FAILED=$((FAILED+1))
    fi
fi

if [ "$FAILED" -gt 0 ]; then
    echo -e "${RED}[SUMMARY]${NC} $FAILED masalah — perbaiki sebelum pakai produksi."
    exit 1
fi
echo -e "${GREEN}[SUMMARY]${NC} Semua service sehat."
exit 0
