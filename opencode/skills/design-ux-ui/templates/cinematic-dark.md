# Design Archetype: Cinematic Dark

## Atmosphere & Mood

A deep void-black canvas where content emerges with theatrical precision. This is not merely a dark theme; it is an immersive cinematic environment. The design treats the screen as a theater — the background is the darkness before the curtain rises, and the content is the performance.

Neon or jewel-toned accents slice through the darkness with high contrast. Media elements — video, audio waveforms, generative imagery — are not placed on the design; they ARE the design. Typography is minimal, technical, and often compressed, allowing the media to dominate.

**Key Characteristics:**
- Deepest possible black or near-black canvas, often with subtle undertones (cool blue-black or warm charcoal)
- Single high-saturation accent: emerald, neon green, electric violet, or cyan
- Media-rich layout: video backgrounds, waveform visualizations, generative art
- Monospace or highly geometric sans-serif for UI text
- Block-based or grid-based layouts reminiscent of film strips or editing timelines
- Glowing borders or subtle inner glows around media containers
- Minimal text, maximal visual impact

## Color Philosophy

### Primary Roles
- **Deepest background**: Near-black with a subtle undertone. The void.
- **Panel background**: Slightly elevated dark surface for controls and navigation.
- **Primary text**: Bright white or very light gray — high contrast is essential in darkness.
- **Brand accent**: A single neon or jewel tone — electric green, vivid violet, hot pink, or cyan. Used for CTAs, active states, and waveform/border glows.
- **Secondary text**: Muted gray, slightly desaturated.
- **Tertiary text**: Very dim gray for timestamps, metadata, file names.

### Surface & Border Logic
- Borders should glow softly rather than divide harshly. Use thin semi-transparent borders with slight tint toward the accent color.
- Media containers can have subtle inner shadows or glows to create depth.
- Dark surfaces should be translucent overlays rather than solid colors when layered over media.

### Gradient Strategy
- Avoid large gradient backgrounds. Use the accent color as a subtle radial glow behind hero media, or as a gradient within waveform/bars.

## Typography Direction

### Genre
- **Headlines**: Geometric sans or monospace. Extremely tight tracking at large sizes. Minimal, almost clinical.
- **Body / UI**: Clean geometric sans or monospace. Regular to medium weight.
- **Technical labels**: Monospace uppercase for timestamps, file metadata, settings.

### Principles
- Let the media speak. Typography should be quiet and precise.
- Aggressive size contrast: very large hero text or very small UI labels, with little in between.
- Tight line-heights for headlines; slightly relaxed for tiny labels.

## Component Patterns

### Buttons
- **Ghost on dark**: Transparent with glowing accent border and accent text. Hover brightens the glow.
- **Filled accent**: Accent color background with near-black text. Only for primary CTAs.
- **Icon-only**: Circular or square, minimal border, icon in white or accent.
- **Playback controls**: Minimal icon buttons, no visible background, hover reveals subtle highlight.

### Cards & Media Containers
- Background: transparent or very dark translucent.
- Border: thin, glowing accent-tinted border, or no border.
- Radius: standard to comfortable. Media containers may be sharp-cornered for a technical feel.
- Shadow: subtle colored glow behind the container rather than drop shadow.

### Inputs & Sliders
- Minimal, dark. Track in gray, fill in accent. Thumb in white or accent.
- Focus: accent glow.

### Navigation
- Minimal top bar or hidden until interaction.
- Small monospace or geometric sans links in muted gray.
- Active: accent color or bright white.

### Image & Media Treatment
- Full-bleed video or generative imagery is the default.
- Thumbnail grids with minimal gaps.
- Waveform visualizations in accent color.
- Dark UI screenshots with glowing borders.

## Layout & Spacing

### Spacing System
- Base unit: 8px or 4px.
- Very tight padding inside media containers (4–8px).
- Large, dramatic gaps between major sections.

### Grid & Container
- Full-width media, edge-to-edge.
- Control panels: narrow sidebars or bottom bars.
- Content max-width only for text-heavy sections.

### Whitespace Philosophy
- **Darkness is infinite**: Use the void to isolate media elements.
- **Asymmetric tension**: Place small UI text against vast black space to create cinematic tension.

## Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | Deepest black | Canvas |
| Panel | Slightly lighter dark | Sidebars, controls |
| Media container | Subtle border glow | Video, image containers |
| Elevated | Accent glow behind element | Featured media, active cards |
| Overlay | Translucent dark + blur | Modals, settings panels |

## Do's and Don'ts

### Do
- Use the deepest possible black.
- Use ONE high-saturation accent sparingly.
- Let media dominate the composition.
- Use glowing borders for interactive elements.
- Keep typography minimal and precise.

### Don't
- Don't use multiple bright colors — one accent only.
- Don't use traditional drop shadows on dark.
- Don't crowd the canvas with UI chrome.
- Don't use serif fonts unless the brand specifically demands it.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create a hero section with full-bleed video background and a deep black overlay. Minimal geometric sans headline in bright white. Single emerald CTA with glowing border."
- "Design a media grid with thumbnail cards on near-black background. Thin emerald border on hover. Monospace metadata labels."
- "Build an audio player interface: waveform in neon green, minimal controls, dark translucent panel."
- "Create a settings modal: translucent dark overlay, monospace labels, accent-colored toggles."
