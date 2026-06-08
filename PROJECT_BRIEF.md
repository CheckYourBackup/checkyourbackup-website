# Product brief — Check Your Backup website

This brief describes the product and the content plan for the website. Use it as
the source of truth for copywriting and structure.

## The product in one sentence

Check Your Backup verifies that your files are healthy **before** you trust a
backup — by opening each supported file read-only — without ever modifying your
data.

## Who it is for

- Photographers and creatives with large image/RAW libraries.
- Anyone migrating data to a new disk, NAS or cloud.
- People who keep long-term archives and want proof their backups are intact.

## The problem it solves

Backups can silently contain corrupted, truncated or missing files. You only
find out when it's too late. Check Your Backup detects these issues up front and
documents them in a clear report.

## Core value props (use as feature cards)

1. **Read-only & safe** — never repairs or changes your files.
2. **One simple workflow** — select a folder, run an integrity check, review results.
3. **Wide format support** — images, RAW, ZIP, PDF and Office documents.
4. **Clear reports** — branded PDF + CSV with objective counts.
5. **Fast** — multithreaded analysis with a live progress bar.
6. **Portable** — download, double-click, run. No Python, no admin rights.
7. **Cross-platform** — Windows 10/11 and macOS (Intel / Apple Silicon).

## Supported formats (for a "formats" section)

- Images: JPG, TIFF, PNG
- RAW: CR2, NEF, ARW, DNG
- Archives: ZIP (analyzes images inside too)
- Documents: PDF, DOCX, XLSX, PPTX

## How it works (3 steps)

1. **Select a folder** — archive, backup copy or NAS mount.
2. **Run the analysis** — watch the live progress bar.
3. **Review the results** and open the generated PDF/CSV report.

## Status classification (for a legend/visual)

- `Healthy` — file opened and verified correctly.
- `Corrupted` — file is damaged / cannot be decoded.
- `Suspicious` — opened but with warning signs (e.g. truncated).
- `Unreadable` — could not be read.
- `Skipped` — intentionally excluded (system/hidden/temp/report files).

Results show objective counts only — no scores or ratings.

## Suggested page structure

1. **Hero** — name, tagline, primary CTA (Download), secondary CTA (See how it
   works), app logo.
2. **Trust bar** — "Read-only", "No admin rights", "Windows & macOS".
3. **Features** — the value-prop cards above.
4. **Supported formats** — grid of badges.
5. **How it works** — 3 steps.
6. **Status legend** — how files are classified.
7. **Reports** — show what the PDF/CSV deliver (screenshot placeholders).
8. **Download** — Windows and macOS buttons (link to release artifacts).
9. **FAQ** — safety, privacy (all local, nothing uploaded), platforms, signing.
10. **Footer** — version, links, disclaimer.

## Tone

Trustworthy, calm, professional. This is about protecting irreplaceable data.

## Important disclaimer (include in footer)

Check Your Backup does not certify that files are error-free; it documents known
issues detected during analysis. Final responsibility for data verification
remains with the user. All analysis runs locally — no files are uploaded.

## Release facts (current)

- Version: 1.0.7
- Build sizes (reference): macOS zip ~40 MB; Windows expected < 100 MB.
- Distribution: portable builds (`.exe`, `.app`) + optional portable zips via GitHub Releases.
