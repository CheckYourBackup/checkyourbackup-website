# Cursor session workflow — hola / adios

Install the **hola** (start session) and **adios** (end session) rules in every Check Your Backup
project and any other repo you open in Cursor.

## What it does

| Command | Agent (cloud/IDE) | Your PC |
|---------|-------------------|---------|
| **hola** | fetch, pull, warn, summarize, dev server | reminds you to `git pull` |
| **adios** | validate, build, merge pending assets, commit, push | reminds you to `git pull` + manual deploy |

**Important:** adios updates **GitHub**, not your hard drive. Always run `git pull` locally after adios.

## Install in a new project

From this website repo, copy rules into another project:

```bash
# Bash / macOS / Linux
./scripts/install-cursor-session-rules.sh /path/to/other-project

# Windows CMD
scripts\install-cursor-session-rules.bat C:\path\to\other-project
```

Or manually:

```bash
mkdir -p /path/to/other-project/.cursor/rules
cp .cursor/rules/hola-adios-global.mdc /path/to/other-project/.cursor/rules/
# Optional: copy project overlay if same website, or create your own hola-adios-project.mdc
cp .cursor/rules/hola-adios-project.mdc /path/to/other-project/.cursor/rules/
```

Commit the rules in each repo:

```bash
cd /path/to/other-project
git add .cursor/rules/
git commit -m "Add hola/adios Cursor session workflow rules"
```

## Files

| File | Scope |
|------|--------|
| `.cursor/rules/hola-adios-global.mdc` | **All projects** — generic hola/adios |
| `.cursor/rules/hola-adios-project.mdc` | **This website only** — validation, dist_web, Instagram |

For the desktop app or other stacks, keep `hola-adios-global.mdc` and write a new
`hola-adios-project.mdc` with that project's test/build/deploy commands.

## First adios in a new project

Creates (if missing):

- `PROJECT_STATUS.md` — rolling session log
- `TODO.md` — open tasks

## Check Your Backup projects

| Project | Install global rule | Custom project rule |
|---------|--------------------|---------------------|
| checkyourbackup-website (this repo) | yes | `hola-adios-project.mdc` included |
| Desktop app (Python) | copy global | create new project rule with pytest/build |
| downloads repo | copy global | minimal or release-focused rule |

## Trigger words

- `hola` — start session
- `adios` — end session (no confirmation; auto commit/push)

Case-insensitive. Must be the main intent of the message, not casual chat.
