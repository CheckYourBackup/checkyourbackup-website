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

## Last session

**2026-06-12** — Audit of image folders and site navigation across local, GitHub (`main`), and production (`checkyourbackup.com`).

- Verified all 7 files in `assets/img/` exist and are referenced correctly in HTML.
- Confirmed all 11 header anchor links on `index.html` resolve to existing section IDs.
- Confirmed doc pages (`docs/*.html`) load with correct relative paths to assets and back-links.
- Compared local `assets/img/` with `origin/main`: identical file list and byte sizes.
- No broken images, broken links, or navigation issues found.

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

**Other references:** `og-image.png` and screenshots also referenced in Open Graph / Twitter meta tags and JSON-LD on `index.html`. `site.webmanifest` references `logo.png`. No image references in CSS.

**Local vs GitHub:** file list and byte sizes match `origin/main` exactly.

## Navigation audit

Checked **2026-06-12** via automated anchor validation and browser walkthrough on `localhost:5173`.

### `index.html` — header nav

| Link | Target `id` | Status |
|------|---------------|--------|
| Features | `#features` | OK |
| Formats | `#formats` | OK |
| Read-only | `#readonly` | OK |
| How it works | `#how` | OK |
| Screenshots | `#screenshots` | OK |
| Status | `#status` | OK |
| Story | `#story` | OK |
| Docs | `#docs` | OK |
| FAQ | `#faq` | OK |
| Contact | `#contact` | OK |
| Download | `#download` | OK |

Browser check: each link scrolls to the correct section and updates the URL fragment.

### Documentation pages (`docs/`)

| Page | Local | Production | Notes |
|------|-------|------------|-------|
| `user-guide.html` | 200 | 200 | Logo, CSS, back-link to `../index.html#docs`, link to `#download` |
| `about.html` | 200 | 200 | Logo, CSS, back-link to `../index.html#docs` |
| `changelog.html` | 200 | 200 | Logo, CSS, back-link to `../index.html#docs` |

Doc cards in the `#docs` section on the landing page link correctly to all three pages.

### Verdict

No broken images, broken internal links, or navigation issues detected in local, GitHub, or production.

## Build

| Artifact | Status |
|----------|--------|
| `dist_web/` (FTP deploy bundle) | Not built this session |

Generate with: `bash scripts/build_dist_web.sh`

## Validation

| Check | Command | Last result |
|-------|---------|-------------|
| JS syntax | `node --check assets/js/main.js` | Not run this session |
| Releases syntax | `node --check downloads/releases.js` | Not run this session |
| HTTP smoke | `curl` → http://localhost:5173/ | Pass (all pages + images 200) |
| Image / nav audit | Manual + browser | Pass (2026-06-12) |

## Notes

- Static site: HTML + CSS + vanilla JS. No `npm install` or build step for local dev.
- See `AGENTS.md` for branding, boundaries, and Cloud-specific instructions.
- Re-run asset/nav checks after adding screenshots, changing nav labels, or restructuring `docs/`.
