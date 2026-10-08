# Untitled UI — Getting started (condensed)

## Welcome to Untitled UI (`2195:443662`)
- Untitled UI Figma: launched 2021, 380,000+ designers, 2,200+ 5-star reviews, free updates for life.
- Untitled UI React: open-source React components on Tailwind CSS + React Aria, kept in sync with the Figma kit.
- Built as an "ultimate starter" for freelance projects and design systems — neutral, flexible, scalable, usable in unlimited projects.
- Supports Figma features from Framework 2024, Config 2024 and Config 2025: color variables (dark mode), spacing/radius/typography/effects variables, Auto Layout 5.0, min/max widths, Auto Layout wrapping.
- 1,200+ example pages/layouts. Updates on Dribbble (jordanhughes), X (jordanphughes), Figma Community (@designer).
- Help: https://www.untitledui.com/faqs and Figma Help Center guides on variables, components, variants, Auto Layout.

## Getting up and running (`2198:441725`)
- Kit relies on components, Auto Layout, interactive components, variants. New to Figma: "Figma for beginners" YouTube playlist, Figma Best Practice Guides.
- Move example pages to a separate file (~40% of size); delete dark-mode example pages; delete components you won't need.
- Install Inter (rsms.me/inter or Google Fonts).
- Use as a library: publish → enable in other files → accept updates. First publish ~30–40 min; retry if it fails. Libraries modal is also reachable from Assets panel → library icon.
- Further: "Figma tutorial: Create a shareable team library", "Guide to libraries in Figma".

## Split up the file into multiple libraries (`2818:377803`)
- Two approaches: duplicate + prune per project, or keep the full library and grow it.
- Splitting benefits: smaller libraries, less memory, independent publishing, faster loads/publishes.
- Not required — authors prefer one library and pruning.
- Mechanism: Figma "move published components" (keeps instance links).
- Suggested split: Main (styles, foundations, base components) / Marketing components / Application components / Page examples.
- Not pre-split because multi-file import breaks instance links.
- Ghost layers: run Quick actions → "Compute publish statuses of soft deleted components"; check via View → Manage memory; close/reopen; repeat every few pages.

## How to master variants (`2195:459314`)
- Variants group variations of one component into a single component set → fewer components, single source of truth, easier maintenance, quick swapping of components or whole sections for prototyping.
- Resources: "Create and use variants", "Figma Tutorial: Components – The Basics", "Guide to Components in Figma".

## How to master Auto Layout (`2199:441273`)
- Containers grow/shrink to fit content (or vice-versa); behaves like CSS flexbox, bridging design and dev.
- Kit uses 100% Auto Layout wherever practical.
- Demo: "Update payment method" modal — duplicate/delete children and the modal resizes itself.
- Resources: "Figma tutorial: Auto Layout button", "Explore Auto Layout properties", Figma Auto Layout playground community file.
