# Hyprway

`theme/hyprway.json` is the only hand-edited color source. It contains
the palette colors and their semantic UI roles.

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
The exception is `mint_tint`: despite the missing suffix it is a pale
light-mode diff background, not a foreground or semantic success green.

Dark and light terminal green and cyan slots intentionally share their
mode's single mint color. Yazi inherits those terminal colors through its
matching dark or light flavor.

## Generated files

Generated files live beside the application config that consumes them; they
are outputs, not copies that get moved after the build.

- `waybar/theme.css`: imported by `waybar/style.css`
- `wofi/style.css`: the entire wofi stylesheet is generated
- `hypr/theme.lua` and `nvim/lua/config/palette.lua`
- `kitty/dark-theme.auto.conf`, `kitty/light-theme.auto.conf`, and
  `kitty/no-preference-theme.auto.conf`: Kitty follows the OS color scheme
- `mako/theme.conf`
- `zsh/theme.zsh`: variables used by the prompt in `zsh/.zshrc`
- `lazygit/theme.yml`
- `btop/themes/minimal.theme`
- `yazi/theme.toml` and `yazi/flavors/hyprway-{dark,light}.yazi/`: Yazi
  follows the terminal color scheme
- `opencode/themes/hyprway.json`
- `claude/themes/hyprway.json`
- `gtk-3.0/gtk.css` and `gtk-4.0/gtk.css`

Do not edit generated files directly.

## Scope

Only colors are shared. Font sizes, spacing, radii, opacity, shadows, and
motion remain local to each application because their units and behavior are
not equivalent.

## Platform-local files

This repo targets Linux. Some live config directories on other platforms
(macOS) intentionally hold copies instead of symlinks to this repo, because
OS differences make the content diverge — for example keybinds (`super+*`
instead of `ctrl+*`). As of writing: `~/.config/opencode/` symlinks most
items (themes, agents, skills, SYSTEM.md) but keeps `cli.json` and `tui.json`
as platform-local copies. When renaming a theme or any shared identifier,
update the platform-local copies too — a stale reference there silently falls
back to default behavior.

The token-color sections of `VSCodium/User/settings.json` are synced by hand
from the palette in `theme/hyprway.json`; VSCodium has no mechanism to load
themes from a local directory, so the inline overrides ride on the built-in
`Visual Studio Dark` and `Quiet Light` carrier themes. The two agent badge
colors in `opencode/opencode.json` also remain local because that config has
no include mechanism.
