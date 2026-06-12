#!/usr/bin/env bash
#
# Build dist_web/ — ready-to-upload folder for Freehostia FTP.
# Run from the Pagina_WEB project root:
#
#   bash scripts/build_dist_web.sh
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUT="$ROOT/dist_web"

echo "==> Building $OUT"

if [[ -f "$ROOT/instagram/captures/app/screenshot-start.png" ]]; then
  echo "==> Syncing app screenshots from instagram/captures/app/"
  bash "$SCRIPT_DIR/sync_app_screenshots.sh"
fi

rm -rf "$OUT"
mkdir -p "$OUT/downloads"

cp "$ROOT/index.html" "$ROOT/robots.txt" "$ROOT/sitemap.xml" "$ROOT/site.webmanifest" "$ROOT/.htaccess" "$OUT/"
cp -R "$ROOT/assets" "$ROOT/docs" "$ROOT/blog" "$OUT/"
cp "$ROOT/downloads/releases.js" "$OUT/downloads/"

# Remove macOS junk if present
find "$OUT" -name '.DS_Store' -delete 2>/dev/null || true

echo ""
echo "Done. Upload the CONTENTS of dist_web/ to:"
echo "  checkyourbackup.com/public_html/"
echo ""
echo "Size: $(du -sh "$OUT" | cut -f1)"
echo "Files: $(find "$OUT" -type f | wc -l | tr -d ' ')"
