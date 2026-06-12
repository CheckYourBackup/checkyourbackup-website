# Project status — Check Your Backup website

Rolling log for session state, builds, and deploy. Updated by the **adios** workflow.

## Current state

| Item | Value |
|---|---|
| Site version | 1.0.7 |
| Branch | `main` |
| Last commit | `f1af605` — Add hola/adios Cursor rule without commit confirmation step |
| Repository | [CheckYourBackup/checkyourbackup-website](https://github.com/CheckYourBackup/checkyourbackup-website) |
| Production | https://checkyourbackup.com/ |

## Last session

**Date:** 2026-06-12 (UTC)

**Work done:**

- Merged `cursor/reduce-em-dashes-000e` into `main` (blog, blog images, homepage sections, sitemap cleanup, `.htaccess`, build scripts)
- Title-cased guides section heading (`Photo Backup & Integrity Guides`)
- Added `.cursor/rules/hola-adios-workflow.mdc` — **adios** commits and pushes without confirmation prompt
- Audited image folders and navigation (local, GitHub, production) — all aligned after merge

## Build

| Item | Value |
|---|---|
| Last build | 2026-06-12 (UTC) |
| Output | `dist_web/` |
| Files | 28 |
| Size | 1.2 MB |
| `index.html` size | 40,977 bytes |
| `index.html` MD5 | `e152959161805d1ba8eb35cc33531dc5` |
| Build script | `bash scripts/build_dist_web.sh` |

## Validation (last adios)

| Check | Result |
|---|---|
| Required source files | pass |
| Homepage marketing strings | pass |
| `robots.txt` → `sitemap.xml` | pass |
| `node --check` (main.js, releases.js) | pass |
| Dev server HTTP 200 (/, releases.js) | pass |
| `dist_web/index.html` MD5 = root | pass |

## Deploy

| Item | Status |
|---|---|
| FTP upload | pending — upload contents of `dist_web/` to `public_html/` |
| Cloudflare cache | purge after upload |

## Notes

- `dist_web/` is gitignored; build locally before each deploy.
- Open PRs may exist for older branches (`session-workflow-rule-000e`, `hola-adios-workflow-198b`); canonical rule on `main` is `hola-adios-workflow.mdc`.
- Google Search Console: submit `https://checkyourbackup.com/sitemap.xml`.
