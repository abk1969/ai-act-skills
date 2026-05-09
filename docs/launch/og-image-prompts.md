# OG image — text-to-image prompts

If you don't want to use the SVG mockup at [`assets/og-card.svg`](../../assets/og-card.svg), here are alternative generators.

## Target dimensions

**1280 × 640 pixels**, PNG, < 1MB. GitHub social-preview spec.

## Midjourney prompt (v6+)

```
A clean, minimalist tech-banner illustration optimized for GitHub social
preview, 1280x640 aspect ratio. Dark navy background (#0a1929) with
subtle electric blue and amber accent gradients. Top-left: bold white
monospace text "ai-act-skills". Tagline below: "EU AI Act compliance —
runs anywhere agents run". Top-right corner: 12 small gold stars
arranged in the European Union flag ring pattern, muted opacity 60%.
Center: three rounded pill-shaped badges side by side, each labeled
"Claude Code" (purple gradient #7c3aed to #a78bfa), "Gemini CLI"
(google-blue gradient #1a73e8 to #60a5fa), "OpenAI Codex" (teal
gradient #10a37f to #34d399). Below the pills: a subtle dashed line
connecting them suggesting multi-platform. Bottom-left: a code snippet
in a dark card showing "art. 9(2)(a) → ISO/IEC 42001 cl. 6.1.4 +
A.5.4" with green/purple/amber syntax highlighting. Bottom-right:
install command "$ npx skills add abk1969/ai-act-skills" in white
monospace. Style: Stripe / Linear / Vercel aesthetic, vector-clean,
high contrast, no people, no faces, no other logos beyond the EU
stars. Aspect ratio 2:1, exactly 1280x640 pixels. No watermarks.
--ar 2:1 --v 6
```

## DALL·E 3 prompt

```
Create a 1280x640 GitHub social preview banner for an open-source
agent skill called "ai-act-skills". Dark navy gradient background.
Bold white monospace title "ai-act-skills" top-left. Three pill badges
center-aligned: purple "Claude Code", blue "Gemini CLI", green "OpenAI
Codex". 12 gold EU stars top-right corner. Bottom-left dark card
showing code snippet "art. 9(2)(a) → cl. 6.1.4 + A.5.4". Bottom-right
shows install command. Stripe/Linear aesthetic, minimalist, no people,
no logos beyond EU stars.
```

## v0.dev prompt (Vercel)

```
Build a 1280x640 OpenGraph banner image for a GitHub repository.
Theme: dark navy with electric blue and amber accents. Title:
"ai-act-skills". Subtitle: "EU AI Act compliance — runs anywhere
agents run". Three platform pills: Claude Code (purple), Gemini CLI
(blue), OpenAI Codex (green). EU star ring (12 stars) in the
top-right. Code snippet "art. 9(2)(a) → ISO/IEC 42001 cl. 6.1.4 +
A.5.4" in a card at bottom-left. Install command "npx skills add
abk1969/ai-act-skills" at bottom-right. Output should match Stripe /
Linear / Vercel aesthetic. Render to PNG at exactly 1280x640.
```

## Recraft.ai prompt

```
Tech illustration banner, 1280x640, dark navy gradient background,
minimalist Stripe/Linear aesthetic. Centerpiece: three rounded badges
in purple/blue/green for "Claude Code", "Gemini CLI", "OpenAI Codex".
EU flag star ring top-right (12 gold stars). Title "ai-act-skills" in
white monospace top-left. Subtle code snippet bottom-left. Install
command bottom-right. No people, no faces, no logos beyond stars.
```

## Canva (manual)

1. Open https://canva.com/templates/?query=GitHub+Repository+Social+Card
2. Pick a 1280×640 template
3. Use these brand colors:
   - Background: `#0a1929` (deep navy)
   - Accent 1 — Claude Code: `#7c3aed` (purple)
   - Accent 2 — Gemini CLI: `#1a73e8` (google-blue)
   - Accent 3 — OpenAI Codex: `#10a37f` (openai-teal)
   - Highlight: `#fbbf24` (amber for EU stars + citation snippet)
   - Text: `#ffffff` + `#94a3b8` (slate)
4. Replicate the structure from the SVG: title top-left, EU stars top-right, 3 platform pills center, code snippet + install command bottom row

## Or just use the SVG directly

The repository ships with [`assets/og-card.svg`](../../assets/og-card.svg) — a hand-crafted 1280×640 SVG that matches the brand. To rasterize:

```bash
# Best quality (Linux/macOS)
rsvg-convert -w 1280 -h 640 -f png -o og-card.png assets/og-card.svg
```

```bash
# Cross-platform via ImageMagick
magick -density 300 assets/og-card.svg -resize 1280x640 og-card.png
```

Or open the SVG in a browser (Chrome/Firefox), set the viewport to
1280×640 via DevTools, and "Capture full size screenshot".

## Upload steps

1. Save the rendered PNG as `og-card.png` (or any name; size < 1MB)
2. Go to https://github.com/abk1969/ai-act-skills/settings
3. Scroll to "Social preview"
4. Click "Edit" → "Upload an image"
5. Select your PNG → Save
6. Verify by sharing the repo URL in a Slack channel or LinkedIn draft — the card should update within 5-10 minutes

## Validation

Test the card in real previews:

- LinkedIn Post Inspector: https://www.linkedin.com/post-inspector/
- Twitter Card Validator: https://cards-dev.twitter.com/validator
- Discord: paste the repo URL in any channel — the embed should show your card
- Slack: same — paste the URL and check the unfurl

If the card looks wrong, GitHub may be cached for ~24h. Try `?v=2` query parameter on the repo URL to force a refresh.
