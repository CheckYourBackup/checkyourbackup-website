# App screenshots for the website

Drop PNG exports from the **desktop app** and PDF report here. Then run:

```cmd
scripts\sync_app_screenshots.bat
scripts\build_dist_web.bat
```

## Required files

| File | Website section |
|---|---|
| `screenshot-start.png` | See it in action — left (app before scan) |
| `screenshot-results.png` | See it in action — right (results table) |
| `report-pdf.png` | Reports — PDF preview |

Optional (not used on site): `report-validation-cover.png`

Sync copies these into `assets/img/` for the live site and `dist_web/`.

## Open Graph image (`og-image.png`)

Used when sharing **checkyourbackup.com** on WhatsApp, LinkedIn, X, etc.  
**Not** shown on the website itself.

Regenerate after updating the hero or app screenshots:

```cmd
python scripts\generate_og_image.py
scripts\build_dist_web.bat
```

Default source: top crop of `instagram/captures/feed-1080x1350/hero.png` → 1200×630 px.