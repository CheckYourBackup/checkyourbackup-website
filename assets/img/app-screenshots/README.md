# App UI screenshots for the website

The website uses **three** PNG files from the desktop app:

| Save as | Used on website | Content |
|---|---|---|
| `screenshot-start.png` | **See it in action** (left) | App idle — folder selected, before Analyze |
| `screenshot-results.png` | **See it in action** (right) | App after scan — results table with statuses |
| `report-pdf.png` | **Reports** section | PDF report page (corrupted files table) |

## Not the same as `instagram/captures/`

`instagram/captures/` = marketing slides for Instagram.  
These files = real app/report captures for the website.

## How to update (Windows)

1. Save your three PNG exports here:

```
instagram\captures\app\screenshot-start.png
instagram\captures\app\screenshot-results.png
instagram\captures\app\report-pdf.png
```

2. Sync into `assets\img\`:

```cmd
scripts\sync_app_screenshots.bat
```

3. Rebuild deploy package:

```cmd
scripts\build_dist_web.bat
```

4. Upload `dist_web\` to Freehostia.

5. Optional — refresh Instagram marketing captures after step 2:

```cmd
python3 -m http.server 5173
python3 scripts\capture_instagram_screenshots.py
```

Recommended: PNG, ~1024–1400 px wide for app windows; report can be taller (portrait).
