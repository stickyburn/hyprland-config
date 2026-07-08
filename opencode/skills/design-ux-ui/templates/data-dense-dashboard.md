# Design Archetype: Data-Dense Dashboard

## Atmosphere & Mood

An interface designed for absorbing, analyzing, and acting on large amounts of information. The user is an operator: they need to scan quickly, understand status at a glance, and drill down without friction. This archetype is used by observability platforms, analytics suites, security tools, trading dashboards, and infrastructure monitors.

The design prioritizes information hierarchy, status communication, and density. Every pixel carries signal. White space is expensive and used sparingly. Color is functional: it indicates state, severity, and category.

**Key Characteristics:**
- Dark-mode-first for reduced eye strain during long sessions
- Dense information layout with tight spacing
- Grid-based or table-based data presentation
- Status colors (green, yellow, red, blue) used rigorously for state indication
- Monospace for numerical data and logs
- Small, compact UI elements: badges, mini charts, sparklines
- Persistent filters, search, and time-range selectors
- Sidebars for navigation and context panels

## Color Philosophy

### Primary Roles
- **Background**: Near-black or very dark charcoal. The canvas.
- **Panel background**: Slightly lighter dark surface for cards, sidebars, and modals.
- **Primary text**: Near-white or very light gray.
- **Secondary text**: Muted gray for labels, units, timestamps.
- **Borders**: Very dark gray or semi-transparent white, ultra-thin.

### Status Colors
- **Success / Healthy**: Bright green.
- **Warning / Degraded**: Amber or yellow.
- **Critical / Error**: Bright red or coral.
- **Info / Neutral**: Blue or cyan.
- **Inactive / Disabled**: Dark gray.
- These colors are sacred: they must map directly to semantic states and never be used decoratively.

### Data Visualization Colors
- A distinct, accessible palette for charts and graphs.
- Must be distinguishable for colorblind users.
- Avoid gradients in charts unless they represent continuous data.

## Typography Direction

### Genre
- **Primary**: Clean, highly legible sans-serif at small sizes.
- **Data / Mono**: Monospace for all numbers, timestamps, logs, and tabular data.
- **Labels**: Small, uppercase, wide letter-spacing for section headers and column titles.

### Principles
- Small sizes are common (12–14px for labels, 13px for data).
- Tight line-height for lists and tables.
- Monospaced numbers align perfectly in tables.
- Avoid decorative typography entirely.

## Component Patterns

### Tables
- Full-width, row-based.
- Row hover: subtle background highlight.
- Sorted column: accent indicator.
- Expandable rows for details.
- Sticky headers.

### Charts
- Sparklines inline with table rows.
- Full charts in dedicated panels.
- Tooltips on hover.
- Minimal axes and gridlines.

### Status Badges
- Small pills with status color backgrounds.
- Text in white or dark depending on background brightness.
- Optional icon (dot or icon glyph).

### Filters & Search
- Compact input fields, often inline.
- Dropdown filters with multi-select.
- Time-range picker (absolute and relative).
- Saved views and bookmarked filters.

### Sidebars
- Collapsible, narrow.
- Navigation tree or list.
- Context panel for selected item details.

### Alerts / Toasts
- Status-colored left border or background tint.
- Compact, dismissible.
- Stacked in a corner.

## Layout & Spacing

### Spacing
- Base unit: 4px or 8px.
- Tight padding (8–12px) in table cells.
- Minimal gaps between panels (1–2px borders or none).

### Grid
- Full viewport width and height.
- Resizable panels.
- Tabbed panels for switching views.
- Modal overlays for detail drill-down.

## Depth & Elevation

- Flat for data surfaces.
- Subtle border or 1px shadow for elevated panels.
- No heavy drop shadows — they waste visual space.

## Do's and Don'ts

### Do
- Optimize for scannability.
- Use color strictly for status.
- Use monospace for data.
- Provide search and filtering.
- Support dark mode as primary.

### Don't
- Don't use decorative gradients or images.
- Don't waste space on large headlines.
- Don't use color decoratively.
- Don't use serif fonts.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create a dark-mode observability dashboard with a sidebar, top filter bar, and a main table showing alerts. Use status-colored badges and monospace for timestamps."
- "Design an analytics panel with a line chart, sparkline table, and compact metric cards. Dark background, tight spacing."
- "Build a security events feed: dark theme, status-colored left borders, monospace logs, expandable rows."
