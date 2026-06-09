# Downloads — release artifacts

This folder holds the **final production builds** served by the website's
Download section. The section is generated automatically from
[`releases.js`](releases.js) — that is the only file you edit to publish a new
version.

## Current contents

| File | Platform | Status |
|------|----------|--------|
| `CheckYourBackup-Windows-1.0.7.zip` | Windows 10 / 11 | Published |
| `CheckYourBackup-macOS-1.0.7.zip` | macOS (Intel / Apple Silicon) | Published |

> The Windows build must be produced on a Windows machine (PyInstaller does not
> cross-compile). Use `CheckYourBackup/scripts/build_windows.bat`, then copy the
> generated `dist/CheckYourBackup-windows.zip` here as
> `CheckYourBackup-Windows-1.0.0.zip`.

## How to publish a new release

1. Build the app on each platform (see `CheckYourBackup/BUILD.md`).
2. Copy the build zips into this folder, named like
   `CheckYourBackup-<OS>-<version>.zip`.
3. Get each file's exact byte size:
   - macOS/Linux: `stat -f "%z" downloads/<file>.zip`
   - Windows (PowerShell): `(Get-Item downloads\<file>.zip).Length`
4. Edit [`releases.js`](releases.js):
   - update `version` and `releaseDate`,
   - update each platform's `file`, `bytes`, and set `available: true`.

The site formats the size and date and updates the version everywhere
automatically. No HTML changes needed.

## Naming convention

```
CheckYourBackup-Windows-<version>.zip
CheckYourBackup-macOS-<version>.zip
```

## Note on hosting

These zips are sizable (macOS ~39 MB). For a real deployment you may prefer to
host them on GitHub Releases / a CDN and point `file` in `releases.js` to the
absolute URL instead of a local path — the rest of the site works the same.
