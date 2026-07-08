# Design Archetype: Terminal Native

## Atmosphere & Mood

The design language of the command line brought to the browser. This is not a dark theme with some monospace text — it is a terminal emulator reimagined as a product interface. Every element feels like it belongs in a shell: block-based layouts, monospace dominance, minimal decoration, and a focus on information density.

The aesthetic is utilitarian but not ugly. It is precise, structured, and deeply familiar to developers. The interface should feel like it could be rendered in a TTY.

**Key Characteristics:**
- Monospace typeface for almost everything, including headings
- Block-based UI: rectangular panels, sharp corners, grid-aligned elements
- Dark background (near-black or deep gray) with bright, high-contrast text
- Color-coded output: syntax highlighting colors extended to UI elements
- Minimal use of images; ASCII art or simple icons preferred
- Status bars, prompt lines, and command palettes as navigation patterns
- Scrollback/feed aesthetic for content lists

## Color Philosophy

### Primary Roles
- **Background**: Deep black or very dark gray. The terminal canvas.
- **Foreground / primary text**: Bright white or very light gray.
- **Secondary text**: Muted gray.
- **Accent**: A single terminal-green, amber, or cyan. Used for prompts, active states, and primary CTAs.
- **Semantic colors**: Green (success), yellow (warning), red (error), blue (info) — matching terminal ANSI colors.
- **Borders**: Very dark gray or subtle semi-transparent lines.

### ANSI Color Palette
- Map UI semantic states to traditional terminal colors:
  - Prompt: accent color (green/amber/cyan)
  - Success: bright green
  - Warning: yellow/amber
  - Error: bright red
  - Info: bright blue
  - Muted: gray

## Typography Direction

### Genre
- **Primary**: Monospace for everything — headings, body, labels, buttons.
- **Code / output**: Same monospace, naturally.

### Principles
- Strict grid alignment. Elements snap to character widths.
- Headlines in monospace bold or bright color.
- Line-height can be tight (1.2–1.4) to mimic terminal output.
- Use "box drawing" characters or block elements for decoration.

## Component Patterns

### Blocks / Panels
- Sharp corners (0–2px radius maximum).
- Thin border or no border.
- Background: slightly lighter than the canvas for elevation.

### Buttons
- Text-only or block-style with border.
- Monospace uppercase labels.
- Hover: background color inversion or brightness shift.

### Input / Prompt
- Leading `>` or `$` in accent color.
- Cursor: blinking block or underscore.
- Background matches canvas.

### Navigation
- Command palette (`Cmd+K`) as primary navigation.
- Top bar: minimal — title, status indicators, window controls.
- Sidebar: file-tree or directory listing aesthetic.

### Code / Output
- Syntax highlighting using the ANSI palette.
- Line numbers optional.
- Copy button as a small `[copy]` text link.

## Layout & Spacing

- Grid-based on character widths.
- Dense packing. Minimal padding (8–16px).
- Full-width blocks stacked vertically.
- No max-width constraints for text — terminal lines are long.

## Depth & Elevation

- No drop shadows. Depth through background lightness only.
- Inset shadows for recessed panels (optional).

## Do's and Don'ts

### Do
- Use monospace for everything.
- Use ANSI-inspired semantic colors.
- Embrace density.
- Use block-based layouts.
- Use command palette navigation.

### Don't
- Don't use rounded corners on main containers.
- Don't use serif or humanist sans fonts.
- Don't use heavy drop shadows or gradients.
- Don't use large photography.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create a terminal-native dashboard with a near-black background, monospace text, and a green prompt-line header. Use block panels for stats."
- "Design a CLI-style documentation page with a command palette search, monospace headings, and syntax-highlighted code blocks."
- "Build a settings panel as a terminal configuration file UI: key-value pairs in monospace, comments in muted gray, boolean toggles as `[x]` / `[ ]`."
