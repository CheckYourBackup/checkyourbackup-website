# Project status — Check Your Backup (website)

> Rolling status log for development sessions. Updated at the end of each session (`adios`).

## Current state

| Field | Value |
|-------|-------|
| **Site version** | 1.0.7 (see `downloads/releases.js`) |
| **Branch** | — |
| **Last updated** | — |
| **Dev server** | `python3 -m http.server 5173` → http://localhost:5173 |

## Last session

_No session recorded yet._

## Build

| Artifact | Status |
|----------|--------|
| `dist_web/` (FTP deploy bundle) | Not built this session |

Generate with: `bash scripts/build_dist_web.sh`

## Validation

| Check | Command |
|-------|---------|
| JS syntax | `node --check assets/js/main.js` |
| Releases syntax | `node --check downloads/releases.js` |
| HTTP smoke | `curl` → http://localhost:5173/ |

## Notes

- Static site: HTML + CSS + vanilla JS. No `npm install` or build step for local dev.
- See `AGENTS.md` for branding, boundaries, and Cloud-specific instructions.
