# Launch kit

Ready-to-use launch artifacts for the v1.2.x release campaign.

| File | Purpose | Recommended publish date |
|---|---|---|
| [`devto-article.md`](./devto-article.md) | Long-form article (~2000 words) optimized for SEO queries on "ISO 27001 vs ISO 42001 AI Act" and "EU AI Act compliance skill". Cross-postable to Dev.to, Hashnode, Medium. | 2026-05-12 (Tuesday, 8-10am Paris) |
| [`linkedin-fr.md`](./linkedin-fr.md) | LinkedIn post — French version (1740 chars, hook "Stop putting your AI on ISO 27001") | 2026-05-12 (Tuesday, 8h30 Paris) |
| [`linkedin-en.md`](./linkedin-en.md) | LinkedIn post — English version (1720 chars) | 2026-05-12 (Tuesday, 14h00 Paris = 8am NY) |
| [`show-hn.md`](./show-hn.md) | Show HN draft for Hacker News | 2026-05-12 (Tuesday, 14h Paris = 8am ET) |
| [`awesome-list-entries.md`](./awesome-list-entries.md) | Pre-written entries for awesome-* lists. PR #1 already opened for `GenAI-Gurus/awesome-eu-ai-act` (PR #14). |  |
| [`og-image-prompts.md`](./og-image-prompts.md) | Midjourney / DALL·E / v0 prompts for the social preview card (alternative to the SVG in `assets/og-card.svg`) |  |

## Recommended sequence

### Pre-launch (now)

1. ✅ Repository hardening (CONTRIBUTING, ROADMAP, SECURITY, NOTICE, issue templates) — done in v1.2.1
2. ✅ AEO foundation (llms.txt, FAQ in README, OG card SVG) — done in v1.2.2
3. ✅ Discussions seeded — done
4. ⏳ User UI: pin Discussion #2, upload `og-card.png` to repo Settings → Social preview
5. ⏳ User UI: rasterize `assets/og-card.svg` → `assets/og-card.png` (instructions in [`assets/README.md`](../../assets/README.md))

### Launch day — Tuesday 2026-05-12

| Time (Paris) | Action |
|---|---|
| 8h30 | Publish LinkedIn FR ([`linkedin-fr.md`](./linkedin-fr.md)) |
| 8h35 | First comment on the post with link to `references/05-crosswalk-aiact-iso.md` |
| 9h00 | Publish Dev.to / Hashnode / Medium article ([`devto-article.md`](./devto-article.md)) |
| 14h00 | Publish LinkedIn EN ([`linkedin-en.md`](./linkedin-en.md)) — coincides with NY morning |
| 14h05 | Submit Show HN ([`show-hn.md`](./show-hn.md)) — best HN window: 8-9am ET Tue/Wed |
| 14h10 | Cross-post the LinkedIn EN to Twitter/X with the same hook |
| 17h00 | Reply to all comments / questions; if Show HN is on the front page, prepare for traffic spike |

### Post-launch (Wednesday-Friday)

- Track skills.sh leaderboard rank
- Track GitHub stars + forks (target: 50+ stars in first 7 days)
- Submit to additional awesome-* lists if traction is good (VoltAgent gates on community usage — re-submit at >10 stars)
- Reply to all comments / Discussions
- Plan v1.3.0 roadmap update based on community feedback

### Post-launch (J+7, Tuesday 2026-05-19)

- Repost on LinkedIn with a stat update ("X stars in 7 days, here's what we learned")
- Open GitHub Discussion summarizing the launch — pin if needed
- If a serious adopter emerges, ask for permission to reference them in `Acknowledgements`

## Anti-patterns to avoid

- ❌ Don't submit to VoltAgent/awesome-agent-skills before reaching 10+ stars (their CONTRIBUTING explicitly excludes brand-new skills)
- ❌ Don't claim "first AI Act compliance tool" — it's "first multi-platform agent skill", which is verifiable
- ❌ Don't downplay the legal disclaimer — credibility is built on epistemic honesty
- ❌ Don't tag random Anthropic/Google/OpenAI engineers without context (low signal-to-noise hurts the post)
- ❌ Don't cross-post the same text on every platform — adapt the tone (LinkedIn = professional, HN = technical, Dev.to = builder, Twitter = punchy)
- ❌ Don't engage with bad-faith critiques on HN — let community defend; respond only to substantive technical questions

## Metrics to track

| Metric | Day 1 target | Day 7 target | Day 30 target |
|---|---|---|---|
| GitHub stars | 10+ | 50+ | 200+ |
| skills.sh installs | 20+ | 100+ | 500+ |
| LinkedIn impressions FR | 5k | 15k | — |
| LinkedIn impressions EN | 8k | 25k | — |
| HN comments | n/a | 30+ if front page | — |
| Dev.to reactions | 25+ | 100+ | — |
| GitHub Discussions activity | 1+ external comment | 5+ | 15+ |
| Awesome-* PRs accepted | 1 | 3 | 5 |

If Day 7 targets are missed by >50%, run a retrospective Discussion: which channel underperformed, what content angle didn't resonate, what was the LinkedIn FR vs EN delta.

## Legal notice

These launch artifacts contain marketing copy alongside compliance facts. The compliance facts (article numbers, ISO clauses, sanction figures, effective dates) are accurate as of the article's publication date. The marketing copy is the author's opinion. Always cross-check against authoritative sources (EUR-Lex, ISO catalogue, OJEU citations) before making compliance decisions.
