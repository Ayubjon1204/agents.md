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

Everything is in this one file: workflows below, then **Appendix A — Getting started notes** and **Appendix B — Design tokens**.

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
4. Map Figma variables to project tokens using Appendix B — never hardcode hex/px when a token exists.
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

---

## Appendix A — Getting started notes

### Welcome to Untitled UI (`2195:443662`)
- Untitled UI Figma: launched 2021, 380,000+ designers, 2,200+ 5-star reviews, free updates for life.
- Untitled UI React: open-source React components on Tailwind CSS + React Aria, kept in sync with the Figma kit.
- Built as an "ultimate starter" for freelance projects and design systems — neutral, flexible, scalable, usable in unlimited projects.
- Supports Figma features from Framework 2024, Config 2024 and Config 2025: color variables (dark mode), spacing/radius/typography/effects variables, Auto Layout 5.0, min/max widths, Auto Layout wrapping.
- 1,200+ example pages/layouts. Updates on Dribbble (jordanhughes), X (jordanphughes), Figma Community (@designer).
- Help: https://www.untitledui.com/faqs and Figma Help Center guides on variables, components, variants, Auto Layout.

### Getting up and running (`2198:441725`)
- Kit relies on components, Auto Layout, interactive components, variants. New to Figma: "Figma for beginners" YouTube playlist, Figma Best Practice Guides.
- Move example pages to a separate file (~40% of size); delete dark-mode example pages; delete components you won't need.
- Install Inter (rsms.me/inter or Google Fonts).
- Use as a library: publish → enable in other files → accept updates. First publish ~30–40 min; retry if it fails. Libraries modal is also reachable from Assets panel → library icon.
- Further: "Figma tutorial: Create a shareable team library", "Guide to libraries in Figma".

### Split up the file into multiple libraries (`2818:377803`)
- Two approaches: duplicate + prune per project, or keep the full library and grow it.
- Splitting benefits: smaller libraries, less memory, independent publishing, faster loads/publishes.
- Not required — authors prefer one library and pruning.
- Mechanism: Figma "move published components" (keeps instance links).
- Suggested split: Main (styles, foundations, base components) / Marketing components / Application components / Page examples.
- Not pre-split because multi-file import breaks instance links.
- Ghost layers: run Quick actions → "Compute publish statuses of soft deleted components"; check via View → Manage memory; close/reopen; repeat every few pages.

### How to master variants (`2195:459314`)
- Variants group variations of one component into a single component set → fewer components, single source of truth, easier maintenance, quick swapping of components or whole sections for prototyping.
- Resources: "Create and use variants", "Figma Tutorial: Components – The Basics", "Guide to Components in Figma".

### How to master Auto Layout (`2199:441273`)
- Containers grow/shrink to fit content (or vice-versa); behaves like CSS flexbox, bridging design and dev.
- Kit uses 100% Auto Layout wherever practical.
- Demo: "Update payment method" modal — duplicate/delete children and the modal resizes itself.
- Resources: "Figma tutorial: Auto Layout button", "Explore Auto Layout properties", Figma Auto Layout playground community file.

---

## Appendix B — Design tokens (light mode)

Pulled with `get_variable_defs` from the Getting started page (node `3956:465352`).
Names are the Figma variable names; use them to name CSS custom properties.

### Typography — font family `Inter` (display + body)

| Style | Size / line height | Weight |
|---|---|---|
| Display sm | 30 / 38 | 600 |
| Display xs | 24 / 32 | 600 |
| Text lg | 18 / 28 | 400, 500 |
| Text md | 16 / 24 | 400, 600 |
| Text sm | 14 / 20 | 400, 500, 600 |

`paragraph-max-width`: 720

### Colors

| Variable | Value |
|---|---|
| Text/text-primary (900) | `#171717` |
| Text/text-secondary (700) | `#404040` |
| Text/text-tertiary (600) | `#525252` |
| Foreground/fg-quaternary (400) | `#a3a3a3` |
| Text/text-brand-secondary (700) | `#5530e0` |
| Text/text-white | `#ffffff` |
| Background/bg-primary | `#ffffff` |
| Background/bg-secondary | `#fafafa` |
| Background/bg-tertiary | `#f5f5f5` |
| Background/bg-brand-solid | `#6e46ff` |
| Border/border-primary | `#d4d4d4` |
| Border/border-secondary | `#e5e5e5` |
| Border/border-secondary_alt | `#0000001a` |
| Alpha/alpha-black-10 | `#0000001a` |

### Spacing (px)

| xxs | xs | sm | md | lg | xl | 2xl | 3xl | 4xl | 6xl | 9xl |
|---|---|---|---|---|---|---|---|---|---|---|
| 2 | 4 | 6 | 8 | 12 | 16 | 20 | 24 | 32 | 48 | 96 |

`container-padding-desktop`: 32

### Radius (px)

`radius-md` 8 · `radius-2xl` 16

### Effects

- **shadow-xs**: `0 1px 2px #0000000d`
- **shadow-xs-skeuomorphic**: shadow-xs + `inset 0 -2px 0 #0000000d` + `inset 0 0 0 1px #0000002e`
- **shadow-xl**: `0 20px 24px -4px #00000014, 0 8px 8px -4px #00000008, 0 3px 3px -1.5px #0000000a`
- **backdrop-blur-md**: background blur 16

### CSS starter

```css
:root {
  --font-family-display: "Inter", system-ui, sans-serif;
  --font-family-body: "Inter", system-ui, sans-serif;
  --text-primary: #171717;
  --text-secondary: #404040;
  --text-tertiary: #525252;
  --fg-quaternary: #a3a3a3;
  --text-brand-secondary: #5530e0;
  --bg-primary: #ffffff;
  --bg-secondary: #fafafa;
  --bg-tertiary: #f5f5f5;
  --bg-brand-solid: #6e46ff;
  --border-primary: #d4d4d4;
  --border-secondary: #e5e5e5;
  --spacing-xxs: 2px; --spacing-xs: 4px; --spacing-sm: 6px; --spacing-md: 8px;
  --spacing-lg: 12px; --spacing-xl: 16px; --spacing-2xl: 20px; --spacing-3xl: 24px;
  --spacing-4xl: 32px; --spacing-6xl: 48px; --spacing-9xl: 96px;
  --radius-md: 8px; --radius-2xl: 16px;
  --shadow-xs: 0 1px 2px #0000000d;
  --shadow-xl: 0 20px 24px -4px #00000014, 0 8px 8px -4px #00000008, 0 3px 3px -1.5px #0000000a;
}
```

Example component from the file (Auto Layout modal, "Update payment method"):
modal `max-width 480px`, `radius-2xl`, `shadow-xl`, padding `spacing-3xl`;
inputs `radius-md`, `border-primary`, padding `8px 12px`, `shadow-xs`;
buttons `padding 10px 14px`, `radius-md`, secondary = white + `text-secondary`,
primary = `bg-brand-solid` + white text, both with skeuomorphic inner shadow.
Dark-mode values are not on this page — read them from the kit's variable collections when needed.
