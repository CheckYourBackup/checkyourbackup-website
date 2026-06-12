# Instagram — marketing assets & documentation

Folder for Instagram content: screenshots, reel drafts, copy notes, and publish checklists.

## Structure

```
instagram/
├── README.md              ← this file
├── captures/              ← auto-generated web screenshots (re-run script to refresh)
│   ├── feed-1080x1350/   ← Feed posts (4:5) — recommended for carousel
│   ├── story-1080x1920/  ← Stories & Reels (9:16)
│   └── square-1080x1080/ ← Square feed posts (1:1)
├── reels/                 ← Reel video drafts, covers, captions (add manually)
└── docs/                  ← Copy, hashtags, publish notes (add manually)
```

## Screenshot sizes (Instagram)

| Folder | Size | Use |
|--------|------|-----|
| `captures/feed-1080x1350/` | 1080 × 1350 px (4:5) | Feed carousel — best reach in 2026 |
| `captures/story-1080x1920/` | 1080 × 1920 px (9:16) | Stories, Reels cover, vertical ads |
| `captures/square-1080x1080/` | 1080 × 1080 px (1:1) | Classic square posts |

Files are captured at **2× device scale** (sharp on retina / mobile).

**Important:** These are **Instagram marketing slides**, not the app screenshots shown on
the website. The live site uses `assets/img/screenshot-start.png` and
`assets/img/screenshot-results.png`. See `assets/img/app-screenshots/README.md`.
After updating those app PNGs, re-run this script to refresh Instagram captures too.

## Regenerate captures

Start the dev server, then:

```bash
python3 -m http.server 5173
python3 scripts/capture_instagram_screenshots.py
```

Requires Playwright Chromium (one-time): `python3 -m playwright install chromium`

## Suggested carousel (feed)

1. `feed-1080x1350/hero.png` — hook + value prop
2. `feed-1080x1350/features.png` — what it does
3. `feed-1080x1350/screenshots.png` — product proof
4. `feed-1080x1350/download.png` — CTA (free download)

## Branding (from AGENTS.md)

- Navy `#1e3a5f` · Blue `#2c6e9e` · Light `#f4f7fa`
- Logo: `assets/img/logo.png`
- Site: https://checkyourbackup.com/

## Get files on your PC (Windows)

These files live in the **Git repo**, not on the website server. After cloning or pulling:

```
<TU_PROYECTO>\instagram\captures\
```

Example if the repo is `Pagina_WEB` on your Desktop:

```
C:\Users\TU_USUARIO\Desktop\Pagina_WEB\instagram\captures\feed-1080x1350\
```

**Option A — git pull** (inside your project folder):

```cmd
git checkout main
git pull origin main
dir instagram\captures\feed-1080x1350
```

**Option B — download one ZIP from GitHub:**

1. Open: https://github.com/CheckYourBackup/checkyourbackup-website/blob/main/instagram/checkyourbackup-instagram-captures.zip
2. Click **Download** (raw file)
3. Unzip anywhere (e.g. `Desktop\instagram-captures\`)

## Notes

- Add reel scripts and caption drafts under `docs/`.
- Drop exported `.mp4` reels under `reels/` before publishing.
- Re-capture after major landing page changes.
