/*
 * Release metadata for Check Your Backup downloads.
 * -------------------------------------------------------------
 * THIS IS THE ONLY FILE YOU NEED TO EDIT TO PUBLISH A NEW RELEASE.
 *
 * For each new version:
 *   1. Drop the build zip into this `downloads/` folder.
 *   2. Update `version` and `releaseDate` below.
 *   3. For each platform, update `file`, `bytes` and set `available: true`.
 *
 * Tip to get the exact byte size:
 *   macOS/Linux:  stat -f "%z" downloads/yourfile.zip
 *   Windows:      (Get-Item downloads\yourfile.zip).Length
 *
 * The website formats size and date automatically.
 */
window.CYB_RELEASES = {
  version: "1.0.7",
  releaseDate: "2026-06-09", // YYYY-MM-DD

  platforms: [
    {
      id: "windows",
      name: "Windows",
      detail: "Windows 10 / 11 · 64-bit",
      file: "https://github.com/CheckYourBackup/downloads/raw/main/CheckYourBackup-Windows-1.0.7.zip",
      bytes: 46001085,
      available: true
    },
    {
      id: "macos",
      name: "macOS",
      detail: "Intel / Apple Silicon",
      file: "https://github.com/CheckYourBackup/downloads/releases/download/v1.0.7/CheckYourBackup-macOS-1.0.7.zip",
      bytes: 39977427,
      available: true
    }
  ]
};
