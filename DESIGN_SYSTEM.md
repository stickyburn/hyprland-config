# Design System

The signal-noir palette: 13 colors, 4 tiers, defined in 4 source-of-truth
files. Editing one does NOT propagate - you must edit all that apply.

## Allowed colors

Only the 13 palette colors below are allowed in this config. No new hex values
may be introduced. If a new theme color is needed, reuse an existing token.

The commented reference list in `kitty/kitty.conf` (lines 5-18) is the master
color list - it is the only place these values are documented for human
reference. **Never delete or modify those commented lines.** They are not
dead comments; they are the palette source.

## Tokens

| Hex | Name | Tier | Purpose |
|---|---|---|---|
| `#0e0f10` | canvas | bg-0 | Darkest base. Main bg, terminal "black". |
| `#0f0f1a` | panel | bg-1 | Surface one step up. Bars, panels, line highlight. |
| `#121124` | raised | bg-2 | Modal/popup float bg. |
| `#221727` | deep | bg-3 | Mid-dark accent (light-side primary). |
| `#201a2f` | surface | bg-4 | Dark selection / sub-surface. |
| `#2a1d31` | edge | border | Border, divider, "bright black" terminal slot. |
| `#eee9ff` | text | fg-0 | Primary foreground / lightest tone. |
| `#ffeef2` | soft | fg-1 | Off-white secondary text, light surfaces. |
| `#dffff8` | cool | accent | Cool accent: functions, types, selection highlight. |
| `#ff91c3` | pink | accent | Warm accent: keywords, hover, cursor trail. |
| `#ff338f` | signal | accent | Brightest accent: errors, alerts, active marker. |
| `#c79eff` | violet | accent | Primary brand accent: borders, links, active state. |
| `#98e4a7` | mint | accent | Success accent: strings, diff-add, network ok. |

Tiers: **bg-0..bg-4** are 5 darkness levels (canvas is base, each step lighter).
**fg-0..fg-1** are 2 foreground tones. **accent** covers 4 semantic roles
(violet=brand, pink=warm, signal=alert, cool=cool, mint=success).

## Source-of-Truth Map

**4 files define tokens** (edit these for propagation within their app):

| File | Scope | Format |
|---|---|---|
| `nvim/lua/config/palette.lua` | nvim runtime | `return { canvas = "#0e0f10", ... }` |
| `opencode/themes/signal-noir.json` | opencode TUI | `defs` block (references by name in `theme`) |
| `waybar/style.css` | waybar | `@define-color canvas #0e0f10;` (10 of 13 colors) |
| `wofi/style.css` | wofi | `@define-color canvas #0e0f10;` (9 of 13 colors) |

**Everything else hardcodes hex inline.** To change a color, edit the 4 source
files above, then grep for the old hex to find inline uses:

```bash
rg -i '#0e0f10' -g '*.{lua,conf,css,json,toml,yml,sh,md}' -g '!**/plugins/**' -g '!**/skills/**'
```

Hardcoded files: `kitty/kitty.conf`, `hypr/hyprland.lua`, `mako/config`,
`btop/themes/minimal.theme`, `lazygit/config.yml`, `VSCodium/User/settings.json`
(has dark + light profiles), `yazi/theme.toml`, `zsh/.zshrc`,
`opencode/opencode.json`, `opencode/agents/work.md`, `nvim/lua/plugins/smear-cursor.lua`.

`hyprland.lua` uses two formats: `rgb(HEX)` for borders, `0x99RRGGBB` (ARGB)
for shadow - keep the `99` alpha prefix, only swap the last 6 hex.

## Naming traps

Token names differ across apps for the same hex. Always match by **hex**, not name.

| Hex | palette.lua / opencode | waybar | wofi |
|---|---|---|---|
| `#0f0f1a` | panel | rail | panel |
| `#121124` | raised | raised | **input** |
| `#201a2f` | surface | (absent) | **raised** |
| `#2a1d31` | edge | edge | **selected** |
| `#dffff8` | cool | (absent) | (absent) |
| `#98e4a7` | mint | mint | (absent) |

Note: wofi `raised` = `#201a2f` (waybar `surface`), NOT waybar `raised` = `#121124`.

## Dual-mode

- **nvim**: dark-only.
- **opencode**: `signal-noir.json` has `dark`/`light` slots per role (e.g. `primary: dark=violet, light=deep`). Light swaps bg/fg pairs.
- **VS Code**: `[Visual Studio Dark]` and `[Quiet Light]` blocks - light inverts tokens (canvas becomes fg, text becomes bg).
- **everything else**: dark-only.

## Terminal ANSI slots

Consistent across kitty, vscode terminal, nvim terminal:
```
black=canvas  red=signal  green=mint  yellow=pink
blue=violet   magenta=pink  cyan=cool  white=text
brightBlack=edge  brightYellow=soft  brightWhite=soft
```