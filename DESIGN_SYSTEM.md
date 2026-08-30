# Neonway

`theme/neonway.json` is the only hand-edited color source. It contains
the 17 palette colors and their semantic UI roles.

After changing it, rebuild the native app theme files:

```sh
node ~/.config/theme/build.mjs
```

The build is explicit and offline. There are no templates, watchers, hooks,
or runtime generation. Generated files are committed, and applications keep
working without Node.

## Color modes

Unqualified palette names are dark-mode colors. Colors with a
`_light_mode` suffix are contrast-adjusted equivalents for light mode.

- `mint` (`#98e4a7`) is the dark-mode green.
- `mint_light_mode` (`#197344`) is the light-mode green.
- `mint_tint` (`#dffff8`) is a pale light-mode diff background, not a
  foreground or semantic success green.

Dark and light terminal green and cyan slots intentionally share their
mode's single mint color. Yazi inherits those terminal colors through its
matching dark or light flavor.

## Generated files

Generated files live beside the application config that consumes them; they
are outputs, not copies that get moved after the build.

- `waybar/theme.css` and `wofi/theme.css`
- `hypr/theme.lua` and `nvim/lua/config/palette.lua`
- `kitty/dark-theme.auto.conf`, `kitty/light-theme.auto.conf`, and
  `kitty/no-preference-theme.auto.conf`: Kitty follows the OS color scheme
- `mako/theme.conf`
- `zsh/theme.zsh`: variables used by the prompt in `zsh/.zshrc`
- `lazygit/theme.yml`
- `btop/themes/minimal.theme`
- `yazi/theme.toml` and `yazi/flavors/neonway-{dark,light}.yazi/`: Yazi
  follows the terminal color scheme
- `opencode/themes/neonway.json`
- `claude/themes/neonway.json`
- `gtk-3.0/gtk.css` and `gtk-4.0/gtk.css`

Do not edit generated files directly.

## Scope

Only colors are shared. Font sizes, spacing, radii, opacity, shadows, and
motion remain local to each application because their units and behavior are
not equivalent.

The token-color sections of `VSCodium/User/settings.json` are synced by hand
from the palette in `theme/neonway.json`; VSCodium has no mechanism to load
themes from a local directory, so the inline overrides ride on the built-in
`Visual Studio Dark` and `Quiet Light` carrier themes. The two agent badge
colors in `opencode/opencode.json` also remain local because that config has
no include mechanism.
