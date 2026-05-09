# Assets

Static assets used by the repository.

## `og-card.svg`

Social preview card (1280×640, optimised for OpenGraph / LinkedIn /
Twitter / Discord / Slack unfurls).

### Rendering to PNG

GitHub's social preview accepts PNG/JPG (max 1MB). To rasterize the
SVG:

**Option 1 — `rsvg-convert` (best quality, CLI):**

```bash
rsvg-convert -w 1280 -h 640 -f png -o og-card.png og-card.svg
# macOS: brew install librsvg
# Ubuntu: apt-get install librsvg2-bin
```

**Option 2 — Inkscape:**

```bash
inkscape og-card.svg --export-type=png --export-filename=og-card.png \
  --export-width=1280 --export-height=640
```

**Option 3 — Browser screenshot (Chrome / Firefox):**

1. Open `og-card.svg` in the browser
2. F12 → device toolbar → set viewport to 1280×640
3. Right-click → "Capture full size screenshot"

**Option 4 — ImageMagick:**

```bash
magick -density 150 og-card.svg -resize 1280x640 og-card.png
```

### Uploading to GitHub

1. Render `og-card.svg` to `og-card.png` using one of the methods above
2. Go to repository **Settings** → **General** → scroll to **"Social preview"**
3. Click **"Edit"** → **"Upload an image"**
4. Select `og-card.png`
5. Save

Verify the result by sharing the repo URL on LinkedIn / Twitter / a
test Slack channel — the card should show "ai-act-skills" with the
three platform pills (Claude Code / Gemini CLI / OpenAI Codex).

## License

These assets are MIT-licensed alongside the rest of the repository
(see [`LICENSE`](../LICENSE)).
