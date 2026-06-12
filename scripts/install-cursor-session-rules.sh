#!/usr/bin/env bash
#
# Copy hola/adios Cursor rules to another project.
# Usage: bash scripts/install-cursor-session-rules.sh /path/to/target-project
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="${1:?Usage: $0 /path/to/target-project}"

GLOBAL="$SOURCE_ROOT/.cursor/rules/hola-adios-global.mdc"
PROJECT="$SOURCE_ROOT/.cursor/rules/hola-adios-project.mdc"

if [[ ! -f "$GLOBAL" ]]; then
  echo "Error: missing $GLOBAL" >&2
  exit 1
fi

mkdir -p "$TARGET/.cursor/rules"
cp "$GLOBAL" "$TARGET/.cursor/rules/"

if [[ "${2:-}" == "--with-website-project-rule" ]] || [[ "${INSTALL_WEBSITE_RULE:-}" == "1" ]]; then
  cp "$PROJECT" "$TARGET/.cursor/rules/"
  echo "Installed: hola-adios-global.mdc + hola-adios-project.mdc (website)"
else
  echo "Installed: hola-adios-global.mdc only"
  echo "Tip: pass --with-website-project-rule to also copy the website overlay"
fi

echo "Target: $TARGET/.cursor/rules/"
echo "Next: cd \"$TARGET\" && git add .cursor/rules && git commit -m \"Add hola/adios Cursor session workflow rules\""
