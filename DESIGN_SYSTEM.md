# Hyprway

## Source and workflow

`theme/hyprway.json` defines the palette and dark/light semantic roles. Keep
the palette small: reuse colors through roles before adding another color.
Edit this source, then run from the repo root:

```sh
node theme/build.mjs
node theme/build.mjs --check
```

`theme/build.mjs` contains the app mappings and output paths. Generated files
live beside their app configs and are committed; do not edit them directly.
Generation is explicit and offline, with no runtime Node dependency.

VSCodium's inline UI, syntax and terminal colors in `VSCodium/User/settings.json`
are maintained by hand against the palette, using `Visual Studio Dark` and
`Quiet Light` as carrier themes. Agent badge colors in `opencode/opencode.json`
are also manual.

## Visual intent

Btop is the dark-mode reference: quiet canvas, violet focus, pink accents,
mint information and off-white text. Light-capable apps follow that hierarchy
with contrast-adjusted foregrounds (`*_light_mode`).

- Canvas for main reading areas; panel for inputs, popovers and current lines.
  Use surface sparingly for interaction tints. Light mode reuses lavender for
  panels and subtle selections.
- Violet-filled focused options need contrasting `on_accent` text. Preserve
  syntax/diff foregrounds with subtle text selections instead. LazyGit inside
  Neovim uses mint tint in light mode to distinguish selection from its float.
- Pink and mint are accents, not generic hover backgrounds. `mint_tint` is a
  light background, not a foreground green. Terminal green/cyan share mint;
  Yazi inherits terminal colors alongside its mode-specific flavor.
- Share colors only. Typography, spacing, radii, opacity and motion stay local
  to each application.

## Live configuration

Link shared configs from their live locations to this repo. On macOS, use
file-level links where a directory also holds platform-specific config or
runtime data. Keep these files native:

- `~/.config/kitty/kitty.conf`: macOS keys, sizing and window behavior.
- `~/.config/opencode/{cli,tui}.json`: macOS keybindings.
- `~/Library/Application Support/VSCodium/User/keybindings.json`: macOS keys;
  `settings.json` is linked to the repo.

Secrets, caches, history and machine-only settings stay local. Linux desktop
configs are used on Linux. When renaming shared themes or identifiers, check
references in the platform-local files too.
