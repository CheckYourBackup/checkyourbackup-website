# Check Your Backup — Website

Marketing / product website for the **Check Your Backup** desktop app.

Production domain: **https://checkyourbackup.com/**

> This is a **standalone project**, separate from the desktop application. Open
> this `Pagina_WEB` folder as its own project in Cursor. See [`AGENTS.md`](AGENTS.md)
> for full context about the app, and [`PROJECT_BRIEF.md`](PROJECT_BRIEF.md) for
> the content plan.

## Tech stack

Plain HTML + CSS + vanilla JavaScript. **No build step, no dependencies.**

## Run it

Just open `index.html` in a browser, or serve it locally:

```bash
# Python (built in on macOS/Linux)
python3 -m http.server 5173

# or Node, if you prefer
npx serve .
```

Then visit http://localhost:5173

## Structure

```
Pagina_WEB/
├── index.html            # the landing page
├── assets/
│   ├── css/styles.css    # all styles (brand palette)
│   ├── js/main.js        # nav + renders the download section
│   └── img/
│       ├── logo.png      # app logo (shared branding)
│       └── favicon.ico   # favicon
├── downloads/            # release artifacts + metadata
│   ├── releases.js       # EDIT THIS to publish a new version
│   ├── CheckYourBackup-macOS-1.0.0.zip
│   └── README.md         # how to add future releases
├── AGENTS.md             # context for Cursor / new devs
├── PROJECT_BRIEF.md      # product + content brief
└── README.md
```

## Publishing a release

The Download section (version, file size, release date and buttons) is generated
automatically from [`downloads/releases.js`](downloads/releases.js). To publish a
new version, drop the build zip into `downloads/` and edit that one file. See
[`downloads/README.md`](downloads/README.md) for details.

Current status: **Windows and macOS builds published** for v1.0.7 via the
[`CheckYourBackup/downloads`](https://github.com/CheckYourBackup/downloads) repo.

## Next steps

- The Reports section now uses a real PDF cover (`assets/img/report-pdf.png`).
  Add app UI screenshots (e.g. for the hero) when available.
- Optionally migrate to a framework (Astro / Vite / Next.js) if the site grows.

## Branding

Navy `#1e3a5f` · Blue `#2c6e9e` · Light `#f4f7fa`. Logo in `assets/img/logo.png`.
