# Jay Looney's Resume

This repo contains my resume, authored in [Typst](https://typst.app/) and shipped via CI/CD.

## Quick Start

```bash
# Enter the dev environment (provides typst, tinymist LSP, git, gh)
devenv shell

# Build the datestamped PDF
just build
# -> out/JayLooneyResume_2026-7-16.pdf
# -> out/JayLooneyResume_latest.pdf (symlink to the latest)

# Watch for changes and auto-rebuild
just watch
```

## Filename Convention

Built PDFs are datestamped: `JayLooneyResume_YYYY-M-D.pdf`

- **Who:** `JayLooneyResume` — clear identity
- **What:** It's a resume
- **When:** Date of last build (`YYYY-M-D` format, filesystem-safe across OSes)
- A `JayLooneyResume_latest.pdf` copy is always kept for convenience

## Making Changes

1. Edit `resume.typ`
2. Run `just build`
3. Review the PDF
4. Commit and push — CI builds automatically

## Releasing

Tag with CalVer to trigger a GitHub Release with the datestamped PDF attached:

```bash
just release
```

This creates a `vYYYY.M.D` tag (e.g. `v2026.7.16`), builds the PDF, commits, tags, and pushes. CI then creates a GitHub Release with the datestamped PDF.

### CalVer Convention

`v<YYYY>.<M>.<D>` or `v<YYYY>.<M>.<D>.<REV>` if multiple releases fall on the same day.

## Font

Uses [Atkinson Hyperlegible](https://www.brailleinstitute.org/freefont/) — a typeface designed for greater legibility and readability for low-vision readers. Installed automatically via the devenv environment (`languages.typst.fontPaths`).

## Pipeline

| Step | What |
|------|------|
| `resume.typ` | Source of truth — Typst markup |
| `just build` | Compiles to `out/JayLooneyResume_YYYY-M-D.pdf` |
| GitHub Actions (build) | Compiles on every push to master / PR |
| GitHub Actions (release) | On `v2*` tag, creates GitHub Release + uploads datestamped PDF |
