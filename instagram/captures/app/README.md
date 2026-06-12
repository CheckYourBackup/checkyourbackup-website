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
