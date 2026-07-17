# Signal Noir

`theme/signal-noir.json` is the only hand-edited color source. It contains
the 13 palette colors and their semantic UI roles.

After changing it, rebuild the native app theme files:

```sh
node ~/.config/theme/build.mjs
```

The build is explicit and offline. There are no templates, watchers, hooks,
or runtime generation. Generated files are committed, and applications keep
working without Node.

## Generated files

Generated files live beside the application config that consumes them; they
are outputs, not copies that get moved after the build.

- `waybar/theme.css` and `wofi/theme.css`
- `hypr/theme.lua` and `nvim/lua/config/palette.lua`
- `kitty/theme.conf`
- `mako/theme.conf`
- `zsh/theme.zsh`: variables used by the prompt in `zsh/.zshrc`
- `lazygit/theme.yml`
- `btop/themes/minimal.theme`
- `yazi/theme.toml`
- `opencode/themes/signal-noir.json`

Do not edit generated files directly.

## Scope

Only colors are shared. Font sizes, spacing, radii, opacity, shadows, and
motion remain local to each application because their units and behavior are
not equivalent.

VSCodium remains a deliberate exception until its embedded customization is
moved into a proper color-theme extension. The two agent badge colors in
`opencode/opencode.json` also remain local because that config has no include
mechanism.
