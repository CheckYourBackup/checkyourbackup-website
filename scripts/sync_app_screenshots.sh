#!/usr/bin/env bash
# Copy app UI screenshots into assets/img/ for the website.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/assets/img/app-screenshots"
DST="$ROOT/assets/img"

missing=0
for name in screenshot-start screenshot-results report-pdf; do
  if [[ ! -f "$SRC/${name}.png" ]]; then
    echo "Missing: $SRC/${name}.png"
    missing=1
  fi
done

if [[ "$missing" -eq 1 ]]; then
  echo "Save PNG exports from the app. See assets/img/app-screenshots/README.md"
  exit 1
fi

for name in screenshot-start screenshot-results report-pdf; do
  cp "$SRC/${name}.png" "$DST/${name}.png"
  echo "Updated: assets/img/${name}.png"
done

echo "Done. Run: bash scripts/build_dist_web.sh"
