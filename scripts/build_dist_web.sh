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
rm -rf "$OUT"
mkdir -p "$OUT/downloads"

cp "$ROOT/index.html" "$ROOT/robots.txt" "$ROOT/sitemap.xml" "$ROOT/site.webmanifest" "$OUT/"
cp -R "$ROOT/assets" "$ROOT/docs" "$OUT/"
cp "$ROOT/downloads/releases.js" "$OUT/downloads/"

# Remove macOS junk if present
find "$OUT" -name '.DS_Store' -delete 2>/dev/null || true

cat > "$OUT/LEEME-FTP.txt" << 'EOF'
CARPETA LISTA PARA SUBIR — Check Your Backup
============================================

Sube TODO el contenido de esta carpeta (dist_web/) al directorio
público de tu dominio en Freehostia:

  checkyourbackup.com/public_html/

NO subas la carpeta "dist_web" en sí: sube lo que hay DENTRO
(index.html, assets/, docs/, downloads/, etc.).

Estructura que debe quedar en el servidor:
  public_html/
  ├── index.html
  ├── robots.txt
  ├── sitemap.xml
  ├── site.webmanifest
  ├── assets/          (css, js, img — incl. og-image.png para redes)
  ├── docs/            (user-guide, about, changelog)
  └── downloads/
      └── releases.js  (metadatos de descarga — imprescindible)

NO incluido a propósito:
  - CheckYourBackup-macOS-1.0.0.zip  (se descarga desde GitHub)
  - AGENTS.md, README.md, etc.       (notas de desarrollo)

Regenerar esta carpeta tras cambios en la web:
  bash scripts/build_dist_web.sh

Tras subir, comprueba:
  https://checkyourbackup.com/
  https://checkyourbackup.com/downloads/releases.js
EOF

echo ""
echo "Done. Upload the CONTENTS of dist_web/ to:"
echo "  checkyourbackup.com/public_html/"
echo ""
echo "Size: $(du -sh "$OUT" | cut -f1)"
echo "Files: $(find "$OUT" -type f | wc -l | tr -d ' ')"
