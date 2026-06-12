# Project status — Check Your Backup (website)

> Rolling status log for development sessions. Updated at the end of each session (`adios`).

## Current state

| Field | Value |
|-------|-------|
| **Site version** | 1.0.7 (see `downloads/releases.js`) |
| **Branch** | `cursor/hola-adios-workflow-198b` |
| **Last updated** | 2026-06-12 |
| **Dev server** | `python3 -m http.server 5173` → http://localhost:5173 |
| **Assets / navigation** | OK (see audit below) |
| **Instagram assets** | 14 captures in `instagram/captures/` |
| **Deploy bundle** | `dist_web/` — 480 KB, 18 files (regenerated this session) |

## Last session

**2026-06-12** — Session close (`adios`).

- Added hola/adios Cursor workflow rule and `PROJECT_STATUS.md` / `TODO.md`.
- Audited `assets/img/` and site navigation (local, GitHub `main`, production) — all OK.
- Created `instagram/` folder with 14 Instagram-ready screenshots + capture script.
- Regenerated `dist_web/` deploy bundle (480 KB, 18 files).

## Assets audit — `assets/img/`

Checked **2026-06-12** in local (`localhost:5173`), GitHub (`CheckYourBackup/checkyourbackup-website` branch `main`), and production (`https://checkyourbackup.com`).

| File | Size | Local | GitHub `main` | Production |
|------|------|-------|---------------|------------|
| `favicon.ico` | 9 KB | 200 | 200 | 200 |
| `logo.png` | 1 KB | 200 | 200 | 200 |
| `screenshot-start.png` | 47 KB | 200 | 200 | 200 |
| `screenshot-results.png` | 55 KB | 200 | 200 | 200 |
| `report-pdf.png` | 91 KB | 200 | 200 | 200 |
| `manuel-pinar.jpg` | 58 KB | 200 | 200 | 200 |
| `og-image.png` | 72 KB | 200 | 200 | 200 |

**HTML references:** 17 image references across `index.html` and `docs/*.html` — all resolve to existing files (0 missing).

**Local vs GitHub:** file list and byte sizes match `origin/main` exactly.

## Navigation audit

Checked **2026-06-12** — 11/11 header anchors OK; `docs/*.html` back-links and assets OK; browser walkthrough passed.

## Build

| Artifact | Status |
|----------|--------|
| `dist_web/` (FTP deploy bundle) | **Built** — 480 KB, 18 files (2026-06-12) |

Generate with: `bash scripts/build_dist_web.sh`

Upload the **contents** of `dist_web/` to `checkyourbackup.com/public_html/`.

## Validation

| Check | Command | Last result |
|-------|---------|-------------|
| JS syntax | `node --check assets/js/main.js` | Pass (2026-06-12) |
| Releases syntax | `node --check downloads/releases.js` | Pass (2026-06-12) |
| HTTP smoke | `curl` → http://localhost:5173/ | Pass — index 200, releases.js 200 |
| Image / nav audit | Manual + browser | Pass (2026-06-12) |

## Notes

- Static site: HTML + CSS + vanilla JS. No `npm install` or build step for local dev.
- `dist_web/` is gitignored — regenerate before each FTP upload.
- Instagram captures: `python3 scripts/capture_instagram_screenshots.py` (requires Playwright).
- See `AGENTS.md` for branding, boundaries, and Cloud-specific instructions.
