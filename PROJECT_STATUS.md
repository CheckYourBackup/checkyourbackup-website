# Project status — Check Your Backup website

Rolling log for session state, builds, and deploy. Updated by the **adios** workflow.

## Current state

| Item | Value |
|---|---|
| Site version | 1.0.7 |
| Branch | `main` |
| Last commit | `c12ff54` — Expand hola/adios rules: global workflow, local PC sync, pending branches, install script |
| Repository | [CheckYourBackup/checkyourbackup-website](https://github.com/CheckYourBackup/checkyourbackup-website) |
| Production | https://checkyourbackup.com/ |

## Last session

**Date:** 2026-06-12 (UTC)

**Work done:**

- Expanded **adios** rule: global + project layers, local PC `git pull` reminder, pending branch audit, Instagram ZIP
- Added `hola-adios-global.mdc` (all projects) and `hola-adios-project.mdc` (this site)
- Added install scripts: `scripts/install-cursor-session-rules.sh` / `.bat`
- Added `docs/CURSOR_SESSION_WORKFLOW.md`
- Instagram captures + ZIP on `main` (`instagram/captures/`, `checkyourbackup-instagram-captures.zip`)

## Build

| Item | Value |
|---|---|
| Last build | 2026-06-12 (UTC) |
| Output | `dist_web/` (gitignored) |
| Files | 29 |
| Size | 1.2 MB |
| `index.html` size | 40,977 bytes |
| `index.html` MD5 | `e152959161805d1ba8eb35cc33531dc5` |
| Build script | `bash scripts/build_dist_web.sh` / `scripts\build_dist_web.bat` |

## Validation (last adios)

| Check | Result |
|---|---|
| Required source files | pass |
| Homepage marketing strings | pass |
| `robots.txt` → `sitemap.xml` | pass |
| `node --check` (main.js, releases.js) | pass |
| Dev server HTTP 200 (/, releases.js) | pass |
| `dist_web/index.html` MD5 = root | pass |
| Instagram captures on `main` | 14 PNG |
| Instagram ZIP | `instagram/checkyourbackup-instagram-captures.zip` (5.6 MB) |

## Pending branches (not merged — safe to close)

| Branch | Notes |
|---|---|
| `cursor/hola-adios-workflow-198b` | Superseded by `main` (rules + instagram already merged) |
| `cursor/session-workflow-rule-000e` | Old `session-workflow.mdc` — replaced by global + project rules |
| `cursor/dev-env-setup-198b` | Optional AGENTS.md cloud dev docs only |

## Deploy

| Item | Status |
|---|---|
| FTP upload | pending — upload contents of `dist_web/` to `public_html/` |
| Cloudflare cache | purge after upload |

## Local sync (your PC)

**adios updates GitHub only.** After every hola and adios, on your PC:

```cmd
cd C:\Users\mpinar\checkyourbackup-website
git checkout main
git pull origin main
```

| Asset | Path |
|---|---|
| Project root | `C:\Users\mpinar\checkyourbackup-website\` |
| Instagram PNGs | `C:\Users\mpinar\checkyourbackup-website\instagram\captures\feed-1080x1350\` |
| Instagram ZIP | `C:\Users\mpinar\checkyourbackup-website\instagram\checkyourbackup-instagram-captures.zip` |
| Deploy package | `scripts\build_dist_web.bat` → `dist_web\` → FTP |

GitHub ZIP direct: https://github.com/CheckYourBackup/checkyourbackup-website/blob/main/instagram/checkyourbackup-instagram-captures.zip

## Notes

- Install hola/adios in other repos: `scripts\install-cursor-session-rules.bat <ruta-proyecto>`
- Google Search Console: https://checkyourbackup.com/sitemap.xml
