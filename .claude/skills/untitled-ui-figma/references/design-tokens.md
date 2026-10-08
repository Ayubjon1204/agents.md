# Untitled UI design tokens (light mode)

Pulled with `get_variable_defs` from the Getting started page (node `3956:465352`).
Names are the Figma variable names; use them to name CSS custom properties.

## Typography — font family `Inter` (display + body)

| Style | Size / line height | Weight |
|---|---|---|
| Display sm | 30 / 38 | 600 |
| Display xs | 24 / 32 | 600 |
| Text lg | 18 / 28 | 400, 500 |
| Text md | 16 / 24 | 400, 600 |
| Text sm | 14 / 20 | 400, 500, 600 |

`paragraph-max-width`: 720

## Colors

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

## Spacing (px)

| xxs | xs | sm | md | lg | xl | 2xl | 3xl | 4xl | 6xl | 9xl |
|---|---|---|---|---|---|---|---|---|---|---|
| 2 | 4 | 6 | 8 | 12 | 16 | 20 | 24 | 32 | 48 | 96 |

`container-padding-desktop`: 32

## Radius (px)

`radius-md` 8 · `radius-2xl` 16

## Effects

- **shadow-xs**: `0 1px 2px #0000000d`
- **shadow-xs-skeuomorphic**: shadow-xs + `inset 0 -2px 0 #0000000d` + `inset 0 0 0 1px #0000002e`
- **shadow-xl**: `0 20px 24px -4px #00000014, 0 8px 8px -4px #00000008, 0 3px 3px -1.5px #0000000a`
- **backdrop-blur-md**: background blur 16

## CSS starter

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
