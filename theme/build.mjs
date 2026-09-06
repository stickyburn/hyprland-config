import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const themeDir = dirname(fileURLToPath(import.meta.url));
const configDir = dirname(themeDir);
const source = JSON.parse(readFileSync(join(themeDir, "hyprway.json"), "utf8"));
const { colors, roles, light_roles: lightRoles } = source;
const checkOnly = process.argv.includes("--check");
let stale = false;

for (const [name, value] of Object.entries(colors)) {
  if (!/^#[0-9a-f]{6}$/i.test(value)) {
    throw new Error(`Invalid color ${name}: ${value}`);
  }
}

const roleNames = Object.keys(roles).sort();
for (const [scheme, schemeRoles] of Object.entries({ dark: roles, light: lightRoles })) {
  if (!schemeRoles || Object.keys(schemeRoles).sort().join() !== roleNames.join()) {
    throw new Error(`${scheme} roles must match the canonical role set`);
  }
  for (const [role, token] of Object.entries(schemeRoles)) {
    if (!colors[token]) {
      throw new Error(`Unknown ${scheme} token ${token} for role ${role}`);
    }
  }
}

function color(name) {
  if (!colors[name]) throw new Error(`Unknown token ${name}`);
  return colors[name];
}
const role = (name) => color(roles[name]);
const lightRole = (name) => color(lightRoles[name]);

function write(relativePath, content) {
  const path = join(configDir, relativePath);
  const next = `${content.trim()}\n`;
  let current = "";

  try {
    current = readFileSync(path, "utf8");
  } catch {}

  if (current !== next) {
    if (checkOnly) {
      stale = true;
      console.error(`stale ${relativePath}`);
      return;
    }
    mkdirSync(dirname(path), { recursive: true });
    writeFileSync(path, next);
    console.log(`updated ${relativePath}`);
  }
}

function renderCss(schemeRoles) {
  const roleLines = Object.entries(schemeRoles).map(([name, token]) => `@define-color ${name} ${color(token)};`);
  return ["/* Generated from hyprway. */", ...roleLines].join("\n");
}

function renderWofi(schemeRoles) {
  const roleLines = Object.entries(schemeRoles).map(([name, token]) => `@define-color ${name} ${color(token)};`);
  return `/* Generated from hyprway. */
${roleLines.join("\n")}

* {
    font-family: "Switzer";
    font-size: 13px;
}

window {
    background: @background;
    border: 1px solid @focus;
    border-radius: 10px;
}

#outer-box {
    background: @panel_bg;
    border-radius: 9px;
    padding: 10px;
}

#input {
    background: @elevated_bg;
    color: @foreground;
    border: 1px solid @border;
    border-radius: 7px;
    margin: 2px 2px 10px;
    padding: 11px 14px;
    font-family: "Switzer";
    font-size: 15px;
    font-weight: 500;
    transition-property: border-color, background-color;
    transition-duration: 160ms;
    transition-timing-function: cubic-bezier(0.16, 1, 0.3, 1);
}

#input:focus {
    border-color: @focus;
    background: @elevated_bg;
}

#inner-box,
#scroll {
    background: transparent;
}

#entry {
    background: transparent;
    border-left: 3px solid @panel_bg;
    border-radius: 5px;
    margin: 2px;
    padding: 8px 10px;
    transition-property: background-color, border-left-color, border-left-width, padding-left;
    transition-duration: 95ms;
    transition-timing-function: cubic-bezier(0.34, 1.4, 0.64, 1);
}

#entry:hover {
    background: @selection_bg;
    border-left-color: @accent;
}

#entry:selected {
    background: @focus;
    border-left: 5px solid @focus;
    padding-left: 8px;
}

#img {
    margin-right: 11px;
}

#text {
    color: @foreground_muted;
    font-weight: 400;
}

#text:selected {
    color: @on_accent;
    font-weight: 600;
}

#expander-box {
    background: @selection_bg;
    color: @focus;
    border-radius: 5px;
}`;
}

function renderLua() {
  const primitiveLines = Object.entries(colors).map(([name, value]) => `  ${name} = \"${value}\",`);
  const roleLines = Object.entries(roles).map(([name, token]) => `    ${name} = color.${token},`);
  const lightRoleLines = Object.entries(lightRoles).map(([name, token]) => `    ${name} = color.${token},`);
  return [
    "-- Generated from hyprway.",
    "local color = {",
    ...primitiveLines,
    "}",
    "",
    "local theme = {",
    "  color = color,",
    "  role = {",
    ...roleLines,
    "  },",
    "  light_role = {",
    ...lightRoleLines,
    "  },",
    "}",
    "",
    "for name, value in pairs(color) do",
    "  theme[name] = value",
    "end",
    "",
    "return theme",
  ].join("\n");
}

function renderHypr() {
  const rgb = (value) => `rgb(${value.slice(1)})`;
  return `-- Generated from hyprway.
return {
  borders = {
    active_border = { colors = { "${rgb(role("focus"))}", "${rgb(role("accent"))}" }, angle = 35 },
    inactive_border = "${rgb(role("border"))}",
  },
  shadow = 0x99${role("background").slice(1)},
}`;
}

function renderKittyLight() {
  return `# Generated from hyprway.
background ${lightRole("background")}
foreground ${lightRole("foreground")}
cursor ${lightRole("danger")}
macos_titlebar_color background

color0 ${color("background")}
color1 ${color("signal_light")}
color2 ${color("mint_light")}
color3 ${lightRole("accent")}
color4 ${color("violet_light")}
color5 ${lightRole("accent")}
color6 ${color("mint_light")}
color7 ${color("edge")}
color8 ${color("edge")}
color9 ${color("signal_light")}
color10 ${color("mint_light")}
color11 ${lightRole("accent")}
color12 ${color("violet_light")}
color13 ${lightRole("accent")}
color14 ${color("mint_light")}
color15 ${color("background")}

active_tab_foreground ${lightRole("on_accent")}
active_tab_background ${lightRole("focus")}
inactive_tab_foreground ${lightRole("foreground")}
inactive_tab_background ${lightRole("background")}`;
}

function renderKittyDark() {
  return `# Generated from hyprway.
background ${role("background")}
foreground ${role("foreground")}
cursor ${role("foreground")}
macos_titlebar_color background

color0 ${color("background")}
color1 ${color("signal")}
color2 ${color("mint")}
color3 ${color("pink")}
color4 ${color("violet")}
color5 ${color("pink")}
color6 ${color("mint")}
color7 ${color("text")}
color8 ${color("soft")}
color9 ${color("signal")}
color10 ${color("mint")}
color11 ${color("soft")}
color12 ${color("violet")}
color13 ${color("pink")}
color14 ${color("mint")}
color15 ${color("soft")}

active_tab_foreground ${role("on_accent")}
active_tab_background ${role("focus")}
inactive_tab_foreground ${role("foreground")}
inactive_tab_background ${role("background")}`;
}

function renderMako() {
  return `# Generated from hyprway.
background-color=${role("panel_bg")}
text-color=${role("foreground")}
border-color=${role("accent")}
progress-color=${role("focus")}

[urgency=low]
border-color=${role("border")}

[urgency=high]
border-color=${role("danger")}`;
}

function renderZsh() {
  return `# Generated from hyprway.
typeset -g HYPRWAY_BORDER='${role("border")}'
typeset -g HYPRWAY_ACCENT='${role("accent")}'
typeset -g HYPRWAY_FOCUS='${role("focus")}'`;
}

function renderLazygit() {
  return `# Generated from hyprway.
gui:
  theme:
    activeBorderColor: ["${role("focus")}", bold]
    inactiveBorderColor: ["${role("foreground")}"]
    searchingActiveBorderColor: ["${role("accent")}", bold]
    optionsTextColor: ["${role("focus")}"]
    selectedLineBgColor: ["${role("selection_bg")}"]
    selectedRangeBgColor: ["${role("border")}"]
    cherryPickedCommitFgColor: ["${role("background")}"]
    cherryPickedCommitBgColor: ["${role("accent")}"]
    markedBaseCommitFgColor: ["${role("background")}"]
    markedBaseCommitBgColor: ["${role("success")}"]
    unstagedChangesColor: ["${role("danger")}"]
    defaultFgColor: ["${role("foreground")}"]`;
}

function renderBtop() {
  const values = {
    main_bg: "background",
    main_fg: "text",
    title: "violet",
    hi_fg: "violet",
    selected_bg: "violet",
    selected_fg: "edge",
    inactive_fg: "edge",
    proc_misc: "mint",
    cpu_box: "violet",
    mem_box: "violet",
    net_box: "violet",
    proc_box: "violet",
    div_line: "edge",
    temp_start: "violet",
    temp_mid: "pink",
    temp_end: "mint",
    cpu_start: "violet",
    cpu_mid: "pink",
    cpu_end: "mint",
    free_start: "mint",
    free_mid: "mint",
    free_end: "mint",
    cached_start: "mint",
    cached_mid: "mint",
    cached_end: "mint",
    available_start: "mint",
    available_mid: "mint",
    available_end: "mint",
    used_start: "violet",
    used_mid: "pink",
    used_end: "signal",
    download_start: "mint",
    download_mid: "mint",
    download_end: "mint",
    upload_start: "violet",
    upload_mid: "pink",
    upload_end: "signal",
  };

  return [
    "# Generated from hyprway.",
    ...Object.entries(values).map(([name, token]) => `theme[${name}]=\"${color(token)}\"`),
  ].join("\n");
}

function renderYazi() {
  return `# Generated from hyprway.
[flavor]
dark = "hyprway-dark"
light = "hyprway-light"`;
}

function renderYaziFlavor(schemeRoles) {
  const schemeRole = (name) => color(schemeRoles[name]);
  return `# Generated from hyprway.
[indicator]
preview = {}
current = { fg = "${schemeRole("on_accent")}", bg = "${schemeRole("focus")}" }
parent = { fg = "${schemeRole("on_accent")}", bg = "${schemeRole("focus")}" }

[mgr]
cwd = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }

[mode]
normal_main = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
normal_alt = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
select_main = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
select_alt = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
unset_main = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
unset_alt = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }

[status]
overall = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
perm_type = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
perm_read = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
perm_write = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
perm_exec = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
perm_sep = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
progress_label = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
progress_normal = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }
progress_error = { fg = "${schemeRole("background")}", bg = "${schemeRole("background")}" }

[pick]
border = { fg = "${schemeRole("focus")}" }

[pick.active]
fg = "${schemeRole("on_accent")}"
bg = "${schemeRole("focus")}"

[pick.inactive]
fg = "${schemeRole("foreground")}"

[input]
border = { fg = "${schemeRole("focus")}" }
title = { fg = "${schemeRole("foreground")}" }
value = { fg = "${schemeRole("foreground")}" }
selected = { reversed = true }

[confirm]
border = { fg = "${schemeRole("focus")}" }
title = { fg = "${schemeRole("foreground")}" }
body = { fg = "${schemeRole("foreground")}" }
list = { fg = "${schemeRole("foreground")}" }
btn_yes = { reversed = true }
btn_no = { fg = "${schemeRole("foreground")}" }`;
}

function renderYaziTmTheme(schemeRoles, name) {
  const schemeRole = (roleName) => color(schemeRoles[roleName]);
  return `<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>name</key>
  <string>${name}</string>
  <key>settings</key>
  <array>
    <dict>
      <key>settings</key>
      <dict>
        <key>background</key>
        <string>${schemeRole("background")}</string>
        <key>foreground</key>
        <string>${schemeRole("foreground")}</string>
      </dict>
    </dict>
  </array>
</dict>
</plist>`;
}

function renderOpenCode() {
  const pair = (dark, light) => ({ dark, light });
  const rolePair = (name) => pair(roles[name], lightRoles[name]);
  const output = {
    $schema: "https://opencode.ai/theme.json",
    defs: colors,
    theme: {
      primary: rolePair("focus"),
      secondary: rolePair("accent"),
      accent: rolePair("accent"),
      error: rolePair("danger"),
      warning: rolePair("accent"),
      success: rolePair("success"),
      info: rolePair("success"),
      text: rolePair("foreground"),
      textMuted: rolePair("foreground_muted"),
      background: rolePair("background"),
      backgroundPanel: rolePair("panel_bg"),
      backgroundElement: rolePair("elevated_bg"),
      border: rolePair("border"),
      borderActive: rolePair("focus"),
      borderSubtle: rolePair("border"),
      diffAdded: pair("mint", "mint_light"),
      diffRemoved: pair("signal", "signal_light"),
      diffContext: rolePair("accent"),
      diffHunkHeader: pair("violet", "violet_light"),
      diffHighlightAdded: pair("mint", "mint_light"),
      diffHighlightRemoved: pair("signal", "signal_light"),
      diffAddedBg: pair("surface", "mint_tint"),
      diffRemovedBg: pair("edge", "soft"),
      diffContextBg: rolePair("background"),
      diffLineNumber: rolePair("accent"),
      diffAddedLineNumberBg: pair("surface", "mint_tint"),
      diffRemovedLineNumberBg: pair("edge", "soft"),
      markdownText: pair("text", "background_light"),
      markdownHeading: rolePair("accent"),
      markdownLink: pair("mint", "mint_light"),
      markdownLinkText: pair("violet", "violet_light"),
      markdownCode: pair("mint", "mint_light"),
      markdownBlockQuote: rolePair("accent"),
      markdownEmph: rolePair("accent"),
      markdownStrong: pair("soft", "edge"),
      markdownHorizontalRule: pair("edge", "violet_light"),
      markdownListItem: pair("signal", "signal_light"),
      markdownListEnumeration: pair("violet", "violet_light"),
      markdownImage: pair("mint", "mint_light"),
      markdownImageText: pair("violet", "violet_light"),
      markdownCodeBlock: pair("soft", "background_light"),
      syntaxComment: pair("violet", "violet_light"),
      syntaxKeyword: rolePair("accent"),
      syntaxFunction: pair("mint", "mint_light"),
      syntaxVariable: pair("text", "background_light"),
      syntaxString: pair("mint", "mint_light"),
      syntaxNumber: pair("signal", "signal_light"),
      syntaxType: pair("mint", "mint_light"),
      syntaxOperator: pair("violet", "violet_light"),
      syntaxPunctuation: pair("soft", "background_light"),
    },
  };

  return JSON.stringify(output, null, 2);
}

function renderGtk() {
  const definitions = {
    theme_bg_color: role("background"),
    theme_fg_color: role("foreground"),
    theme_base_color: role("panel_bg"),
    theme_text_color: role("foreground"),
    theme_selected_bg_color: role("focus"),
    theme_selected_fg_color: role("on_accent"),
    insensitive_bg_color: role("elevated_bg"),
    insensitive_fg_color: role("foreground_muted"),
    borders: role("border"),
    accent_bg_color: role("focus"),
    accent_fg_color: role("on_accent"),
    accent_color: role("focus"),
    window_bg_color: role("background"),
    window_fg_color: role("foreground"),
    view_bg_color: role("background"),
    view_fg_color: role("foreground"),
    headerbar_bg_color: role("elevated_bg"),
    headerbar_fg_color: role("foreground"),
    popover_bg_color: role("elevated_bg"),
    popover_fg_color: role("foreground"),
    card_bg_color: role("elevated_bg"),
    card_fg_color: role("foreground"),
    dialog_bg_color: role("panel_bg"),
    dialog_fg_color: role("foreground"),
    success_color: role("success"),
    warning_color: role("accent"),
    error_color: role("danger"),
  };
  return [
    "/* Generated from hyprway. */",
    ...Object.entries(definitions).map(([name, value]) => `@define-color ${name} ${value};`),
  ].join("\n");
}

function renderClaude() {
  const token = {
    claude: "violet", claudeShimmer: "mint",
    claudeBlue_FOR_SYSTEM_SPINNER: "violet", claudeBlueShimmer_FOR_SYSTEM_SPINNER: "mint",
    text: "text", inverseText: "background", inactive: "pink", inactiveShimmer: "soft",
    subtle: "violet", suggestion: "mint", permission: "violet", permissionShimmer: "mint",
    remember: "mint", background: roles.background, success: "mint", error: "signal",
    warning: "signal", warningShimmer: "soft", merged: "mint", promptBorder: "violet",
    promptBorderShimmer: "mint", planMode: "mint", autoAccept: "mint", bashBorder: "pink",
    ide: "mint", fastMode: "pink", fastModeShimmer: "soft", diffAdded: "surface",
    diffRemoved: "edge", diffAddedDimmed: roles.elevated_bg, diffRemovedDimmed: roles.panel_bg,
    diffAddedWord: "mint", diffRemovedWord: "signal", userMessageBackground: roles.elevated_bg,
    userMessageBackgroundHover: "surface", messageActionsBackground: "surface",
    bashMessageBackgroundColor: roles.panel_bg, memoryBackgroundColor: roles.elevated_bg,
    selectionBg: roles.selection_bg, rate_limit_fill: "violet", rate_limit_empty: "edge",
    briefLabelYou: "pink", briefLabelClaude: "violet", professionalBlue: "violet",
    chromeYellow: "pink", clawd_body: "violet", clawd_background: "background",
    rainbow_red: "signal", rainbow_orange: "pink", rainbow_yellow: "soft",
    rainbow_green: "mint", rainbow_blue: "mint", rainbow_indigo: "violet",
    rainbow_violet: "violet", rainbow_red_shimmer: "pink", rainbow_orange_shimmer: "soft",
    rainbow_yellow_shimmer: "soft", rainbow_green_shimmer: "mint",
    rainbow_blue_shimmer: "mint", rainbow_indigo_shimmer: "violet",
    rainbow_violet_shimmer: "violet", red_FOR_SUBAGENTS_ONLY: "signal",
    blue_FOR_SUBAGENTS_ONLY: "mint", green_FOR_SUBAGENTS_ONLY: "mint",
    yellow_FOR_SUBAGENTS_ONLY: "soft", purple_FOR_SUBAGENTS_ONLY: "violet",
    orange_FOR_SUBAGENTS_ONLY: "pink", pink_FOR_SUBAGENTS_ONLY: "pink",
    cyan_FOR_SUBAGENTS_ONLY: "mint",
  };
  return JSON.stringify({
    name: "Hyprway",
    base: "dark",
    overrides: Object.fromEntries(Object.entries(token).map(([name, nameToken]) => [name, color(nameToken)])),
  }, null, 2);
}

write("waybar/theme.css", renderCss(roles));
write("wofi/style.css", renderWofi(roles));
write("hypr/theme.lua", renderHypr());
write("nvim/lua/config/palette.lua", renderLua());
write("kitty/dark-theme.auto.conf", renderKittyDark());
write("kitty/light-theme.auto.conf", renderKittyLight());
write("kitty/no-preference-theme.auto.conf", renderKittyDark());
write("mako/theme.conf", renderMako());
write("zsh/theme.zsh", renderZsh());
write("lazygit/theme.yml", renderLazygit());
write("btop/themes/minimal.theme", renderBtop());
write("yazi/theme.toml", renderYazi());
write("yazi/flavors/hyprway-dark.yazi/flavor.toml", renderYaziFlavor(roles));
write("yazi/flavors/hyprway-dark.yazi/tmtheme.xml", renderYaziTmTheme(roles, "Hyprway Dark"));
write("yazi/flavors/hyprway-light.yazi/flavor.toml", renderYaziFlavor(lightRoles));
write("yazi/flavors/hyprway-light.yazi/tmtheme.xml", renderYaziTmTheme(lightRoles, "Hyprway Light"));
write("opencode/themes/hyprway.json", renderOpenCode());
write("claude/themes/hyprway.json", renderClaude());
write("gtk-3.0/gtk.css", renderGtk());
write("gtk-4.0/gtk.css", renderGtk());

if (checkOnly && stale) process.exitCode = 1;
