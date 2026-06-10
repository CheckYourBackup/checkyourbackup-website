# Project context for Cursor — Check Your Backup (Website)

> Read this file first. It tells you (the AI assistant) and any developer what
> this project is, what it must achieve, and the boundaries to respect.

## What this project is

This is the **marketing / product website** for an existing desktop application
called **Check Your Backup**. This folder is a **separate, standalone project**:
it must be opened in its own Cursor window and it must **NOT** import, depend on,
or modify the desktop application's source code. The two projects only share
branding (logo + colors).

- This project: a **static website** about the app (landing page, features,
  downloads, etc.).
- The other project: the **Python desktop application** (do not touch it from
  here).

## What the desktop app does (the subject of this website)

**Check Your Backup** is a cross-platform (Windows 10/11 and macOS Intel /
Apple Silicon) desktop tool that verifies files are healthy **before** you trust
a backup. It analyzes files **read-only** and never repairs or modifies them.

Single workflow — **Integrity Check**: scans a folder and classifies each
supported file as `Healthy`, `Corrupted`, `Suspicious`, `Unreadable` or `Skipped`.
Results show objective counts only (no scores or ratings).

Supported file types:

- Images: **JPG, TIFF, PNG**
- RAW: **CR2, NEF, ARW, DNG**
- Archives: **ZIP** (also analyzes images inside the archive)
- Documents: **PDF, DOCX, XLSX, PPTX**

Key features to highlight on the site:

- Read-only, non-destructive analysis.
- Corporate **PDF report** + **CSV export** with objective statistics.
- **Analysis history** stored per user.
- **Multithreaded** analysis with a responsive progress bar.
- **Automatic exclusions** of irrelevant files (system, hidden, temp, the app's
  own reports).
- **Guided onboarding** (how-to steps, status legend, read-only notice).
- **Portable**: no Python, no admin rights, no extra dependencies — download,
  double-click, run.

Current version: **1.0.7**.

## Branding

- Primary navy: `#1e3a5f`
- Accent blue: `#2c6e9e`
- Light background: `#f4f7fa`
- Muted text: `#5a6472`
- Border: `#d8dee6`
- Status colors: Excellent `#1e8449`, Good `#27ae60`, Warning `#e67e22`,
  Critical `#c0392b`
- Logo: `assets/img/logo.png` (also used as `assets/img/favicon.ico`)

## Tech stack of THIS website

Intentionally minimal and dependency-free to start:

- Plain **HTML + CSS + vanilla JS** (no build step required).
- Entry point: `index.html`.
- Styles: `assets/css/styles.css`. Scripts: `assets/js/main.js`.

You are free to migrate this to a framework (Astro, Vite + React, Next.js,
etc.) if the website grows. If you do, keep the content, branding and the
`assets/img/logo.png` asset.

## Goals / next steps for this website

- Polished, modern, responsive landing page (already scaffolded).
- Sections: hero, features, supported formats, how it works, status legend,
  reports, download (Windows/macOS), FAQ, footer.
- Add real screenshots of the app when available (placeholders are in place).
- Wire the download buttons to the real release artifacts (`.exe`, `.app`,
  portable zips) once they are hosted.

## Boundaries

- Do **not** add the Python app's code, dependencies, or build files here.
- Keep the site usable by simply opening `index.html` (or a static server).
- Maintain the brand palette above for visual consistency with the app.

## Cursor Cloud specific instructions

This repo has **no package manager, no install step, and no automated lint or test suite**.
Python 3 is preinstalled on the VM and is the preferred way to serve the site locally.

### Run (development)

From the repo root:

```bash
python3 -m http.server 5173
```

Then open http://localhost:5173. Use a tmux session if the server must stay running in the
background. `npx serve .` also works but requires network for the one-off `serve` download.

### Build (deploy bundle only)

Optional — copies static assets into `dist_web/` for FTP upload:

```bash
bash scripts/build_dist_web.sh
```

### Lint / test

Not configured. Quick manual checks that work without adding tooling:

- `node --check assets/js/main.js` and `node --check downloads/releases.js` (syntax only)
- `curl -s -o /dev/null -w "%{http_code}" http://localhost:5173/` after starting the server

### Gotchas

- Download buttons and version text are rendered client-side from `downloads/releases.js`; serve
  over HTTP (not `file://`) so the script loads correctly.
- Google Fonts load from the CDN at runtime; the page needs network access for Inter.
- Release zips are hosted on GitHub (`CheckYourBackup/downloads`); local `downloads/` may only
  contain `releases.js` metadata.
