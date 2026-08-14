import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const themeDir = dirname(fileURLToPath(import.meta.url));
const configDir = dirname(themeDir);
const source = JSON.parse(readFileSync(join(themeDir, "neonway.json"), "utf8"));
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

const color = (name) => colors[name];
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

function renderCss() {
  const roleLines = Object.entries(roles).map(([name, token]) => `@define-color ${name} ${color(token)};`);
  return ["/* Generated from theme/neonway.json. */", ...roleLines].join("\n");
}

function renderLua() {
  const primitiveLines = Object.entries(colors).map(([name, value]) => `  ${name} = \"${value}\",`);
  const roleLines = Object.entries(roles).map(([name, token]) => `    ${name} = color.${token},`);
  const lightRoleLines = Object.entries(lightRoles).map(([name, token]) => `    ${name} = color.${token},`);
  return [
    "-- Generated from theme/neonway.json.",
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
  return `-- Generated from theme/neonway.json.
return {
  borders = {
    active_border = { colors = { "${rgb(role("focus"))}", "${rgb(role("accent"))}" }, angle = 35 },
    inactive_border = "${rgb(role("border"))}",
  },
  shadow = 0x99${role("background").slice(1)},
}`;
}

function renderKittyLight() {
  return `# Generated from theme/neonway.json.
background ${lightRole("background")}
foreground ${lightRole("foreground")}
cursor ${lightRole("danger")}
macos_titlebar_color background

color0 ${color("canvas")}
color1 ${color("signal_light_mode")}
color2 ${color("mint_light_mode")}
color3 ${color("pink_light_mode")}
color4 ${color("violet_light_mode")}
color5 ${color("pink_light_mode")}
color6 ${color("cool_light_mode")}
color7 ${color("edge")}
color8 ${color("edge")}
color9 ${color("signal_light_mode")}
color10 ${color("mint_light_mode")}
color11 ${color("pink_light_mode")}
color12 ${color("violet_light_mode")}
color13 ${color("pink_light_mode")}
color14 ${color("cool_light_mode")}
color15 ${color("canvas")}

active_tab_foreground ${lightRole("on_accent")}
active_tab_background ${lightRole("focus")}
inactive_tab_foreground ${lightRole("foreground")}
inactive_tab_background ${lightRole("background")}`;
}

function renderKittyDark() {
  return `# Generated from theme/neonway.json.
background ${role("background")}
foreground ${role("foreground")}
cursor ${role("foreground")}
macos_titlebar_color background

color0 ${color("canvas")}
color1 ${color("signal")}
color2 ${color("mint")}
color3 ${color("pink")}
color4 ${color("violet")}
color5 ${color("pink")}
color6 ${color("cool")}
color7 ${color("text")}
color8 ${color("edge")}
color9 ${color("signal")}
color10 ${color("mint")}
color11 ${color("soft")}
color12 ${color("violet")}
color13 ${color("pink")}
color14 ${color("cool")}
color15 ${color("soft")}

active_tab_foreground ${role("on_accent")}
active_tab_background ${role("focus")}
inactive_tab_foreground ${role("foreground")}
inactive_tab_background ${role("background")}`;
}

function renderMako() {
  return `# Generated from theme/neonway.json.
background-color=${role("panel_bg")}
text-color=${role("foreground")}
border-color=${role("focus")}
progress-color=${role("accent")}

[urgency=low]
border-color=${role("border")}

[urgency=high]
border-color=${role("danger")}`;
}

function renderZsh() {
  return `# Generated from theme/neonway.json.
typeset -g NEONWAY_BORDER='${role("border")}'
typeset -g NEONWAY_ACCENT='${role("accent")}'
typeset -g NEONWAY_FOCUS='${role("focus")}'`;
}

function renderLazygit() {
  return `# Generated from theme/neonway.json.
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
    main_bg: "panel",
    main_fg: "text",
    title: "violet",
    hi_fg: "violet",
    selected_bg: "violet",
    selected_fg: "deep",
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
    free_mid: "cool",
    free_end: "mint",
    cached_start: "mint",
    cached_mid: "cool",
    cached_end: "mint",
    available_start: "mint",
    available_mid: "cool",
    available_end: "mint",
    used_start: "violet",
    used_mid: "pink",
    used_end: "signal",
    download_start: "mint",
    download_mid: "cool",
    download_end: "mint",
    upload_start: "violet",
    upload_mid: "pink",
    upload_end: "signal",
  };

  return [
    "# Generated from theme/neonway.json.",
    ...Object.entries(values).map(([name, token]) => `theme[${name}]=\"${color(token)}\"`),
  ].join("\n");
}

function renderYazi() {
  return `# Generated from theme/neonway.json.
[indicator]
preview = {}
current = { fg = "${role("background")}", bg = "${role("foreground")}" }
parent = { fg = "${role("background")}", bg = "${role("foreground")}" }

[mgr]
cwd = { fg = "${role("background")}", bg = "${role("background")}" }

[pick]
border = { fg = "${role("focus")}" }

[pick.active]
fg = "${role("foreground")}"
bg = "${role("background")}"

[pick.inactive]
fg = "${role("foreground")}"

[input]
border = { fg = "${role("focus")}" }
title = { fg = "${role("foreground")}" }
value = { fg = "${role("foreground")}" }
selected = { reversed = true }

[confirm]
border = { fg = "${role("focus")}" }
title = { fg = "${role("foreground")}" }
body = { fg = "${role("foreground")}" }
list = { fg = "${role("foreground")}" }
btn_yes = { reversed = true }
btn_no = { fg = "${role("foreground")}" }`;
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
      accent: rolePair("danger"),
      error: rolePair("danger"),
      warning: rolePair("accent"),
      success: rolePair("success"),
      info: rolePair("info"),
      text: rolePair("foreground"),
      textMuted: rolePair("foreground_muted"),
      background: rolePair("background"),
      backgroundPanel: rolePair("panel_bg"),
      backgroundElement: rolePair("elevated_bg"),
      border: rolePair("border"),
      borderActive: rolePair("focus"),
      borderSubtle: pair(roles.selection_bg, lightRoles.selection_bg),
      diffAdded: pair("mint", "mint_light_mode"),
      diffRemoved: pair("signal", "signal_light_mode"),
      diffContext: pair("pink", "pink_light_mode"),
      diffHunkHeader: pair("violet", "violet_light_mode"),
      diffHighlightAdded: pair("mint", "mint_light_mode"),
      diffHighlightRemoved: pair("signal", "signal_light_mode"),
      diffAddedBg: pair("surface", "cool"),
      diffRemovedBg: pair("deep", "soft"),
      diffContextBg: pair("panel", "text"),
      diffLineNumber: pair("pink", "pink_light_mode"),
      diffAddedLineNumberBg: pair("surface", "cool"),
      diffRemovedLineNumberBg: pair("deep", "soft"),
      markdownText: pair("text", "canvas"),
      markdownHeading: pair("pink", "pink_light_mode"),
      markdownLink: pair("cool", "cool_light_mode"),
      markdownLinkText: pair("violet", "violet_light_mode"),
      markdownCode: pair("mint", "mint_light_mode"),
      markdownBlockQuote: pair("pink", "pink_light_mode"),
      markdownEmph: pair("pink", "pink_light_mode"),
      markdownStrong: pair("soft", "deep"),
      markdownHorizontalRule: pair("edge", "violet_light_mode"),
      markdownListItem: pair("signal", "signal_light_mode"),
      markdownListEnumeration: pair("violet", "violet_light_mode"),
      markdownImage: pair("cool", "cool_light_mode"),
      markdownImageText: pair("violet", "violet_light_mode"),
      markdownCodeBlock: pair("soft", "canvas"),
      syntaxComment: pair("violet", "violet_light_mode"),
      syntaxKeyword: pair("pink", "pink_light_mode"),
      syntaxFunction: pair("cool", "cool_light_mode"),
      syntaxVariable: pair("text", "canvas"),
      syntaxString: pair("mint", "mint_light_mode"),
      syntaxNumber: pair("signal", "signal_light_mode"),
      syntaxType: pair("cool", "cool_light_mode"),
      syntaxOperator: pair("violet", "violet_light_mode"),
      syntaxPunctuation: pair("soft", "canvas"),
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
    theme_selected_bg_color: role("selection_bg"),
    theme_selected_fg_color: role("foreground"),
    insensitive_bg_color: role("elevated_bg"),
    insensitive_fg_color: role("foreground_muted"),
    borders: role("border"),
    accent_bg_color: role("focus"),
    accent_fg_color: role("on_accent"),
    accent_color: role("focus"),
    window_bg_color: role("background"),
    window_fg_color: role("foreground"),
    view_bg_color: role("panel_bg"),
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
    "/* Generated from theme/neonway.json. */",
    ...Object.entries(definitions).map(([name, value]) => `@define-color ${name} ${value};`),
  ].join("\n");
}

function renderClaude() {
  const token = {
    claude: "violet", claudeShimmer: "mint",
    claudeBlue_FOR_SYSTEM_SPINNER: "violet", claudeBlueShimmer_FOR_SYSTEM_SPINNER: "mint",
    text: "text", inverseText: "canvas", inactive: "pink", inactiveShimmer: "soft",
    subtle: "violet", suggestion: "mint", permission: "violet", permissionShimmer: "mint",
    remember: "mint", background: roles.background, success: "mint", error: "signal",
    warning: "pink", warningShimmer: "soft", merged: "mint", promptBorder: "violet",
    promptBorderShimmer: "mint", planMode: "cool", autoAccept: "mint", bashBorder: "pink",
    ide: "cool", fastMode: "pink", fastModeShimmer: "soft", diffAdded: "surface",
    diffRemoved: "deep", diffAddedDimmed: "raised", diffRemovedDimmed: "panel",
    diffAddedWord: "mint", diffRemovedWord: "signal", userMessageBackground: "raised",
    userMessageBackgroundHover: "surface", messageActionsBackground: "surface",
    bashMessageBackgroundColor: "deep", memoryBackgroundColor: "raised",
    selectionBg: roles.selection_bg, rate_limit_fill: "violet", rate_limit_empty: "edge",
    briefLabelYou: "pink", briefLabelClaude: "violet", professionalBlue: "violet",
    chromeYellow: "pink", clawd_body: "violet", clawd_background: "canvas",
    rainbow_red: "signal", rainbow_orange: "pink", rainbow_yellow: "soft",
    rainbow_green: "mint", rainbow_blue: "cool", rainbow_indigo: "violet",
    rainbow_violet: "violet", rainbow_red_shimmer: "pink", rainbow_orange_shimmer: "soft",
    rainbow_yellow_shimmer: "soft", rainbow_green_shimmer: "mint",
    rainbow_blue_shimmer: "cool", rainbow_indigo_shimmer: "violet",
    rainbow_violet_shimmer: "violet", red_FOR_SUBAGENTS_ONLY: "signal",
    blue_FOR_SUBAGENTS_ONLY: "cool", green_FOR_SUBAGENTS_ONLY: "mint",
    yellow_FOR_SUBAGENTS_ONLY: "soft", purple_FOR_SUBAGENTS_ONLY: "violet",
    orange_FOR_SUBAGENTS_ONLY: "pink", pink_FOR_SUBAGENTS_ONLY: "pink",
    cyan_FOR_SUBAGENTS_ONLY: "cool",
  };
  return JSON.stringify({
    name: "Neonway",
    base: "dark",
    overrides: Object.fromEntries(Object.entries(token).map(([name, nameToken]) => [name, color(nameToken)])),
  }, null, 2);
}

write("waybar/theme.css", renderCss());
write("wofi/theme.css", renderCss());
write("hypr/theme.lua", renderHypr());
write("nvim/lua/config/palette.lua", renderLua());
write("kitty/dark-theme.auto.conf", renderKittyDark());
write("kitty/light-theme.auto.conf", renderKittyLight());
write("kitty/no-preference-theme.auto.conf", renderKittyLight());
write("mako/theme.conf", renderMako());
write("zsh/theme.zsh", renderZsh());
write("lazygit/theme.yml", renderLazygit());
write("btop/themes/minimal.theme", renderBtop());
write("yazi/theme.toml", renderYazi());
write("opencode/themes/neonway.json", renderOpenCode());
write("claude/themes/neonway.json", renderClaude());
write("gtk-3.0/gtk.css", renderGtk());
write("gtk-4.0/gtk.css", renderGtk());

if (checkOnly && stale) process.exitCode = 1;
