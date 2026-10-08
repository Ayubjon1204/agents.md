---
name: untitled-ui-figma
description: Work with the Untitled UI Figma kit (V8) — set it up as a team library, keep large files fast (split libraries, remove "ghost layers"), use its Auto Layout / variants conventions, and turn its designs into code with the kit's design tokens (Inter, spacing, radius, colors, shadows). Use when the user mentions Untitled UI, shares a link to an Untitled UI Figma file, asks how to publish/split/optimize the kit, or wants UI built "in Untitled UI style". Triggers (uz): "Untitled UI", "figma kutubxona", "figma fayl sekin", "ghost layers", "dizayn tizimi".
---

# Untitled UI Figma kit

Source: the `❖ Getting started` page of the Untitled UI Figma V8 file
(`fileKey 4J3csjCllGVDKXqHFLV6QE`, page `1480:0`). It has five doc frames:

| Frame | Node | Covers |
|---|---|---|
| Welcome to Untitled UI | `2195:443662` | What the kit is, 10x workflow, support, license |
| Getting up and running | `2198:441725` | Move example pages out, install Inter, publish as library |
| Split up the file into multiple libraries | `2818:377803` | When/how to split, ghost-layer cleanup |
| How to master variants | `2195:459314` | Variants philosophy |
| How to master Auto Layout | `2199:441273` | Auto Layout = CSS flexbox, modal example |

Full condensed notes: `references/getting-started.md`. Tokens: `references/design-tokens.md`.

## Pick the job

1. **Start a project with the kit** → follow "10x workflow" below.
2. **File is slow / memory alerts** → "Keep the file light" below.
3. **Share the kit across files/teams** → "Publish as a library" below.
4. **Implement an Untitled UI design in code** → "Design → code" below.
5. **License question** → "License" below. Never advise reselling or redistributing.

## 10x workflow (new project)

1. Duplicate your copy of Untitled UI.
2. Swap branding: logo, color variables, typeface.
3. Design with the pre-built sections and page examples.
4. Delete the parts/components you don't need.

Two strategies — let the user choose, there is no wrong answer:
- **Duplicate per project + delete** what you won't need (authors' preference: one library, prune as you go).
- **Keep the whole library** and grow it → consider splitting into libraries.

## Keep the file light

Figma tabs are capped at ~2 GB memory (desktop app too). The kit has 10,000+ components/variants. In order:

1. **Move example pages to a separate file** (~40% of file size). `⌘T` new file → cut/paste pages from `❖ Marketing website examples` and `❖ Application examples`. They hold no master components, so plain cut/paste is safe — no "move published components" needed.
2. **Delete the dark-mode example pages** — they are duplicates of the light ones with the variable mode switched.
3. **Delete components you know you won't need** (e.g. keep 1 footer, not 20). Speeds up publishing too.
4. **Optionally split into libraries** (see below).
5. **Clear ghost layers** periodically (see below).

### Splitting into libraries

Use Figma's *move published components*: publish the original → cut components → paste into the new file → publish an update. Instance links stay intact. Suggested split:

- **Main library** — styles, foundations, base components/assets
- **Marketing components**
- **Application components**
- **Page examples** (optional, can just be a separate file)

The kit ships as one file because Figma can't import several files at once without breaking instance links.

### Ghost layers cleanup

Moved/deleted components can linger and bloat the file.

1. `View → Manage memory` — note layer count / memory (rough numbers).
2. Quick actions (`⌘/`) → run **"Compute publish statuses of soft deleted components"**. It looks like nothing happens; it runs in the background (visible in dev console).
3. Wait ~1 min, close and reopen the file — layer count should drop.
4. Repeat every few pages while splitting (batch moves, no need after each one).

## Publish as a library

1. Open **Libraries** modal (or Assets panel → library icon) → **Publish**. First publish of a large library can take ~30–40 min; keep working in the browser meanwhile. If it fails, close the modal and retry — later publishes only push changes.
2. In other files: Libraries → **Add to file**.
3. Assets appear in the Assets panel; accept update prompts to stay in sync. The library is the single source of truth.

## Fonts

Default typeface is **Inter** (free, open-source, by Rasmus Andersson; 9 weights + italics + variable). Get it from https://rsms.me/inter/ or Google Fonts. Figma web can use Google Fonts without installing; local fonts need Figma's font installer.

## Design → code

1. Load the Figma `figma-design-to-code` skill (or MCP resource `skill://figma/figma-design-to-code/SKILL.md`) before `get_design_context`.
2. Parse URL: `figma.com/design/<fileKey>/...?node-id=1-2` → nodeId `1:2`.
3. Pages are huge; call `get_metadata` first, then `get_design_context` on the smallest relevant frame (e.g. a `Rich text` or component node), not the page.
4. Map Figma variables to project tokens using `references/design-tokens.md` — never hardcode hex/px when a token exists.
5. Auto Layout maps to flexbox: direction → `flex-direction`, gap → `gap`, padding → `padding`, hug → `fit-content`, fill → `flex: 1`/`width: 100%`, min/max widths → `min-width`/`max-width`, wrap → `flex-wrap`.
6. Variants map to component props (e.g. `size`, `type`, `state`, `breakpoint`) — one component, many props, not many components.
7. Untitled UI React (https://www.untitledui.com/react — Tailwind CSS + React Aria) is the matching open-source code library; prefer it if the project already uses it.

### Kit conventions to respect

- 100% Auto Layout wherever practical; containers resize to content. Don't introduce absolute positioning unless the design truly overlaps.
- Color, spacing, radius, typography and effect **variables** (light/dark modes). Dark mode = switch variable mode, not separate styles.
- Text color tiers: primary 900 → secondary 700 → tertiary 600 → quaternary 400.

## License

Allowed: unlimited personal and commercial projects, including client work.
Not allowed: reselling the files, using any part in another UI kit/library/template, publishing online, or redistributing.
Full text: https://www.untitledui.com/license · FAQ: https://www.untitledui.com/faqs
