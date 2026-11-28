#!/usr/bin/env bash
# Repair and validate the Xray API outbound used by install/ins-xray.sh.
set -Eeuo pipefail

if [[ ${EUID} -ne 0 ]]; then
  echo "Jalankan sebagai root." >&2
  exit 1
fi

config=/etc/xray/config.json
xray_bin=/usr/local/bin/xray
[[ -f "$config" ]] || { echo "Config tidak ditemukan: $config" >&2; exit 1; }
[[ -x "$xray_bin" ]] || { echo "Binary Xray tidak ditemukan: $xray_bin" >&2; exit 1; }

backup="${config}.bak.$(date +%Y%m%d%H%M%S)"
cp -a "$config" "$backup"

# The installer routes its API inbound to outboundTag=api, but its generated
# outbounds omit that tagged outbound. Insert one without removing metadata
# comments used by the panel's account-management scripts.
python3 - "$config" <<'PY'
import pathlib
import re
import sys

path = pathlib.Path(sys.argv[1])
text = path.read_text()
if re.search(r'"tag"\s*:\s*"api"', text):
    print("Outbound API sudah ada; tidak perlu diubah.")
    raise SystemExit(0)

pattern = re.compile(r'("outbounds"\s*:\s*\[)(.*?)(\]\s*,\s*"routing"\s*:)', re.S)
match = pattern.search(text)
if not match:
    raise SystemExit('Tidak menemukan blok outbounds sebelum routing; config tidak diubah.')
inner = match.group(2)
separator = '' if not inner.strip() else ('' if inner.rstrip().endswith(',') else ',')
api_outbound = '\n    {"protocol":"freedom","settings":{},"tag":"api"}\n  '
updated = text[:match.start()] + match.group(1) + inner + separator + api_outbound + match.group(3) + text[match.end():]
path.write_text(updated)
print("Outbound API ditambahkan.")
PY

if ! "$xray_bin" run -test -config "$config"; then
  echo "Validasi Xray gagal; file cadangan: $backup" >&2
  exit 1
fi

systemctl daemon-reload
systemctl enable xray
systemctl restart xray
if ! systemctl is-active --quiet xray; then
  echo "Xray belum aktif. Log terakhir:" >&2
  journalctl -u xray -n 50 --no-pager >&2
  echo "Cadangan config: $backup" >&2
  exit 1
fi

echo "Xray aktif. Cadangan config: $backup"
