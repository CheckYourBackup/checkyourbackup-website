# Project status — Check Your Backup website

Rolling log for session state, builds, and deploy. Updated by the **adios** workflow.

## Current state

| Item | Value |
|---|---|
| Site version | 1.0.7 |
| Branch | `main` |
| Last commit | `0d46a56` — Keep main nav links visible; Menu dropdown for Formats, Read-only, Screenshots, Status, Guides |
| Repository | [CheckYourBackup/checkyourbackup-website](https://github.com/CheckYourBackup/checkyourbackup-website) |
| Production | https://checkyourbackup.com/ |

## Last session

**Date:** 2026-06-12 (UTC)

**Work done:**

- New app screenshots synced from `instagram/captures/app/` → `assets/img/`
- Generated `og-image.png` from marketing hero (1200×630) for social previews
- Header nav: main links visible + **Menu** dropdown (Formats, Read-only, Screenshots, Status, Guides, docs)
- Removed hamburger; fixed nav text wrapping CSS
- hola/adios rules with local PC path `C:\Users\mpinar\checkyourbackup-website`

## Build

| Item | Value |
|---|---|
| Last build | 2026-06-12 (UTC) |
| Output | `dist_web/` (gitignored) |
| Files | 31 |
| Size | 1.5 MB |
| `index.html` size | 41,499 bytes |
| `index.html` MD5 | `959759a006b05c61ccca09f667d2cd78` |
| Build script | `bash scripts/build_dist_web.sh` / `scripts\build_dist_web.bat` |

## Validation (last adios)

| Check | Result |
|---|---|
| Required source files | pass |
| Homepage marketing strings | pass |
| Menu dropdown in header | pass |
| `robots.txt` → `sitemap.xml` | pass |
| `node --check` (main.js, releases.js) | pass |
| Dev server HTTP 200 (/, releases.js) | pass |
| `dist_web/index.html` MD5 = root | pass |
| App screenshots synced | pass |
| `og-image.png` (hero, 1200×630) | pass |

## Pending branches (obsolete — safe to close)

| Branch | Notes |
|---|---|
| `cursor/hola-adios-workflow-198b` | Superseded by `main` |
| `cursor/session-workflow-rule-000e` | Replaced by global + project rules |
| `cursor/reduce-em-dashes-000e` | Merged content already on `main` |
| `cursor/dev-env-setup-198b` | Optional AGENTS.md cloud docs only |

## Deploy

| Item | Status |
|---|---|
| FTP upload | pending — upload contents of `dist_web/` to `public_html/` |
| Cloudflare cache | purge after upload (especially `og-image.png`) |

## Local sync (your PC)

**adios updates GitHub only.** On your PC after every session:

```cmd
cd C:\Users\mpinar\checkyourbackup-website
git checkout main
git pull origin main
scripts\build_dist_web.bat
```

| Asset | Path |
|---|---|
| Project root | `C:\Users\mpinar\checkyourbackup-website\` |
| Instagram PNGs | `C:\Users\mpinar\checkyourbackup-website\instagram\captures\feed-1080x1350\` |
| App screenshots source | `C:\Users\mpinar\checkyourbackup-website\instagram\captures\app\` |
| Deploy package | `C:\Users\mpinar\checkyourbackup-website\dist_web\` |

## Notes

- Menu dropdown: Formats, Read-only, Screenshots, Status, Guides + User guide, About, Changelog
- Regenerate og-image: `python scripts\generate_og_image.py`
