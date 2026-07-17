import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const themeDir = dirname(fileURLToPath(import.meta.url));
const configDir = dirname(themeDir);
const source = JSON.parse(readFileSync(join(themeDir, "signal-noir.json"), "utf8"));
const colors = source.colors;
const roles = source.roles;

for (const [name, value] of Object.entries(colors)) {
  if (!/^#[0-9a-f]{6}$/i.test(value)) {
    throw new Error(`Invalid color ${name}: ${value}`);
  }
}

for (const [role, token] of Object.entries(roles)) {
  if (!colors[token]) {
    throw new Error(`Unknown token ${token} for role ${role}`);
  }
}

const color = (name) => colors[name];
const role = (name) => color(roles[name]);

function write(relativePath, content) {
  const path = join(configDir, relativePath);
  const next = `${content.trim()}\n`;
  let current = "";

  try {
    current = readFileSync(path, "utf8");
  } catch {}

  if (current !== next) {
    writeFileSync(path, next);
    console.log(`updated ${relativePath}`);
  }
}

function renderCss() {
  const primitiveLines = Object.entries(colors).map(([name, value]) => `@define-color ${name} ${value};`);
  const roleLines = Object.entries(roles).map(([name, token]) => `@define-color ${name} ${color(token)};`);
  return ["/* Generated from theme/signal-noir.json. */", ...primitiveLines, "", ...roleLines].join("\n");
}

function renderLua() {
  const primitiveLines = Object.entries(colors).map(([name, value]) => `  ${name} = \"${value}\",`);
  const roleLines = Object.entries(roles).map(([name, token]) => `    ${name} = color.${token},`);
  return [
    "-- Generated from theme/signal-noir.json.",
    "local color = {",
    ...primitiveLines,
    "}",
    "",
    "local theme = {",
    "  color = color,",
    "  role = {",
    ...roleLines,
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
  return `-- Generated from theme/signal-noir.json.
return {
  borders = {
    active_border = { colors = { "${rgb(role("focus"))}", "${rgb(role("danger"))}" }, angle = 35 },
    inactive_border = "${rgb(role("border"))}",
  },
  shadow = 0x99${role("background").slice(1)},
}`;
}

function renderKitty() {
  return `# Generated from theme/signal-noir.json.
background ${role("background")}
foreground ${role("foreground")}
cursor ${role("foreground")}

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
  return `# Generated from theme/signal-noir.json.
background-color=${role("panel_bg")}
text-color=${role("foreground")}
border-color=${role("focus")}
progress-color=${role("danger")}

[urgency=low]
border-color=${role("border")}

[urgency=high]
border-color=${role("danger")}`;
}

function renderZsh() {
  return `# Generated from theme/signal-noir.json.
typeset -g SIGNAL_NOIR_BORDER='${role("border")}'
typeset -g SIGNAL_NOIR_ACCENT='${role("accent")}'
typeset -g SIGNAL_NOIR_DANGER='${role("danger")}'
typeset -g SIGNAL_NOIR_FOCUS='${role("focus")}'`;
}

function renderLazygit() {
  return `# Generated from theme/signal-noir.json.
gui:
  theme:
    activeBorderColor: ["${role("focus")}", bold]
    inactiveBorderColor: ["${role("border")}"]
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
    "# Generated from theme/signal-noir.json.",
    ...Object.entries(values).map(([name, token]) => `theme[${name}]=\"${color(token)}\"`),
  ].join("\n");
}

function renderYazi() {
  return `# Generated from theme/signal-noir.json.
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
  const output = {
    $schema: "https://opencode.ai/theme.json",
    defs: colors,
    theme: {
      primary: pair("violet", "deep"),
      secondary: pair("pink", "surface"),
      accent: pair("signal", "deep"),
      error: pair("signal", "signal"),
      warning: pair("pink", "deep"),
      success: pair("mint", "deep"),
      info: pair("cool", "surface"),
      text: pair("text", "canvas"),
      textMuted: pair("soft", "edge"),
      background: pair("canvas", "text"),
      backgroundPanel: pair("panel", "soft"),
      backgroundElement: pair("raised", "cool"),
      border: pair("edge", "violet"),
      borderActive: pair("violet", "deep"),
      borderSubtle: pair("surface", "pink"),
      diffAdded: pair("mint", "deep"),
      diffRemoved: pair("signal", "signal"),
      diffContext: pair("pink", "edge"),
      diffHunkHeader: pair("violet", "deep"),
      diffHighlightAdded: pair("mint", "deep"),
      diffHighlightRemoved: pair("signal", "signal"),
      diffAddedBg: pair("surface", "cool"),
      diffRemovedBg: pair("deep", "soft"),
      diffContextBg: pair("panel", "text"),
      diffLineNumber: pair("pink", "pink"),
      diffAddedLineNumberBg: pair("surface", "cool"),
      diffRemovedLineNumberBg: pair("deep", "soft"),
      markdownText: pair("text", "canvas"),
      markdownHeading: pair("pink", "deep"),
      markdownLink: pair("cool", "surface"),
      markdownLinkText: pair("violet", "deep"),
      markdownCode: pair("mint", "deep"),
      markdownBlockQuote: pair("pink", "edge"),
      markdownEmph: pair("pink", "surface"),
      markdownStrong: pair("soft", "deep"),
      markdownHorizontalRule: pair("edge", "violet"),
      markdownListItem: pair("signal", "deep"),
      markdownListEnumeration: pair("violet", "surface"),
      markdownImage: pair("cool", "deep"),
      markdownImageText: pair("violet", "surface"),
      markdownCodeBlock: pair("soft", "canvas"),
      syntaxComment: pair("violet", "edge"),
      syntaxKeyword: pair("pink", "deep"),
      syntaxFunction: pair("cool", "surface"),
      syntaxVariable: pair("text", "canvas"),
      syntaxString: pair("mint", "deep"),
      syntaxNumber: pair("signal", "signal"),
      syntaxType: pair("cool", "surface"),
      syntaxOperator: pair("violet", "deep"),
      syntaxPunctuation: pair("soft", "canvas"),
    },
  };

  return JSON.stringify(output, null, 2);
}

write("waybar/theme.css", renderCss());
write("wofi/theme.css", renderCss());
write("hypr/theme.lua", renderHypr());
write("nvim/lua/config/palette.lua", renderLua());
write("kitty/theme.conf", renderKitty());
write("mako/theme.conf", renderMako());
write("zsh/theme.zsh", renderZsh());
write("lazygit/theme.yml", renderLazygit());
write("btop/themes/minimal.theme", renderBtop());
write("yazi/theme.toml", renderYazi());
write("opencode/themes/signal-noir.json", renderOpenCode());
