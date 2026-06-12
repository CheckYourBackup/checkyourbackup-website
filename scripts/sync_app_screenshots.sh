#!/usr/bin/env bash
# Copy app UI screenshots from instagram/captures/app/ into assets/img/ for the website.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/instagram/captures/app"
DST="$ROOT/assets/img"
FALLBACK="$ROOT/assets/img/app-screenshots"

if [[ ! -d "$SRC" ]] || [[ ! -f "$SRC/screenshot-start.png" ]]; then
  if [[ -f "$FALLBACK/screenshot-start.png" ]]; then
    SRC="$FALLBACK"
    echo "Using fallback: assets/img/app-screenshots/"
  else
    echo "Missing: instagram/captures/app/screenshot-start.png"
    echo "Save app PNGs in instagram/captures/app/ (see README there)."
    exit 1
  fi
else
  echo "Source: instagram/captures/app/"
fi

missing=0
for name in screenshot-start screenshot-results report-pdf; do
  if [[ ! -f "$SRC/${name}.png" ]]; then
    echo "Missing: $SRC/${name}.png"
    missing=1
  fi
done
[[ "$missing" -eq 0 ]] || exit 1

for name in screenshot-start screenshot-results report-pdf; do
  cp "$SRC/${name}.png" "$DST/${name}.png"
  echo "Updated: assets/img/${name}.png"
done

echo "Done. Run: bash scripts/build_dist_web.sh"
