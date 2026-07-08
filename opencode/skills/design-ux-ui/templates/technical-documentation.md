# Design Archetype: Technical Documentation

## Atmosphere & Mood

A clean, reading-optimized environment designed for long-form technical content. The priority is clarity, scannability, and information density without clutter. This is the visual language of developer documentation, API references, and technical blogs.

The design should feel like a well-engineered book that happens to be a website. Code is first-class content, not an afterthought. Navigation is persistent and logical. Search is prominent.

**Key Characteristics:**
- Light, clean background optimized for extended reading
- Prominent monospace for inline and block code
- Structured hierarchy with clear H1–H4 distinction
- Sidebar or table-of-contents navigation
- Syntax-highlighted code blocks
- Callout/admonition blocks (info, warning, tip) with left-border accenting
- Search input always accessible

## Color Philosophy

### Primary Roles
- **Primary surface**: Clean white or very light gray. Optimized for reading contrast.
- **Elevated surface**: Slightly off-white or very light tint for code blocks and callouts.
- **Primary text**: Near-black or very dark gray.
- **Secondary text**: Medium gray for captions, metadata, secondary descriptions.
- **Brand accent**: A single bright color (often blue or green) for links, active nav items, and callout borders.
- **Border**: Light gray, barely visible, for dividing sections and containing code blocks.

### Semantic Accents
- **Info callout**: Light blue-tinted background with blue left border.
- **Warning callout**: Light yellow/amber-tinted background with amber left border.
- **Error/Danger callout**: Light red-tinted background with red left border.
- **Success callout**: Light green-tinted background with green left border.
- **Tip callout**: Light purple or teal-tinted background with matching left border.

### Code & Syntax
- Code block background: very light gray or slightly tinted surface.
- Inline code: subtle background highlight, monospace.
- Syntax highlighting: standard palette (blue for keywords, red for strings, green for comments, etc.).

## Typography Direction

### Genre
- **Headings**: Clean, highly readable sans-serif. Medium to semibold weight.
- **Body**: Same sans-serif as headings, regular weight, optimized for screen reading.
- **Code**: Excellent monospace font with clear distinction between similar characters (0/O, l/I/1).

### Principles
- Generous line-height for body text (1.6–1.8) to aid reading comprehension.
- Tight line-height for headings (1.2–1.4).
- Clear size hierarchy: H1 largest, stepping down distinctly.
- Monospace for all code, inline and block.

## Component Patterns

### Navigation
- **Sidebar**: Persistent left sidebar with collapsible sections. Active page highlighted with accent color or background tint.
- **Top bar**: Clean, minimal. Logo, search bar, version selector, theme toggle.
- **Breadcrumbs**: Small text, subtle, showing path.
- **Table of contents**: Right-side or embedded, linking to H2/H3 headings.

### Code Blocks
- Full-width within content area.
- Header with language label and copy button.
- Syntax highlighting.
- Optional filename/path label above.

### Callouts / Admonitions
- Left border (4px) in semantic color.
- Light tinted background.
- Optional icon at top.
- Title in bold, body in regular text.

### Search
- Prominent search input, often with keyboard shortcut hint (`/` or `Cmd+K`).
- Results overlay with highlighted matches.

### Tables
- Clean, bordered cells.
- Striped rows for readability.
- Monospace for code-related columns.

## Layout & Spacing

### Spacing System
- Base unit: 8px or 4px.
- Generous vertical padding around headings and code blocks.
- Compact line spacing within lists and tables.

### Grid & Container
- Content max-width: 768–860px for optimal reading line length.
- Sidebar: 240–280px fixed.
- Full-width code blocks that break out of the content width constraint.

### Whitespace Philosophy
- **Reading rhythm**: Sections are separated by clear white space. Code blocks act as visual anchors.
- **Density where needed**: Reference tables and API specs can be dense. Guides and tutorials need more breathing room.

## Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | No shadow | Body text, primary surface |
| Contained | Thin light border | Code blocks, callouts |
| Elevated | Subtle shadow | Search dropdown, mobile menu |
| Sticky | Subtle bottom border | Top navigation bar |

## Do's and Don'ts

### Do
- Optimize for reading speed and comprehension.
- Use a max-width constraint for body text (60–75 characters per line).
- Make code highly scannable with syntax highlighting.
- Use callouts to break up dense information.
- Provide persistent navigation.

### Don't
- Don't use decorative animations that distract from reading.
- Don't use low-contrast text.
- Don't make the sidebar disappear on scroll.
- Don't use serif fonts for body text in technical docs.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create a documentation page with a left sidebar navigation, clean white background, and a max-width content area. Use a readable sans-serif for body text and a crisp monospace for code. Add syntax highlighting and a search bar in the top nav."
- "Design an API reference page with H1 title, H2 endpoints, and code blocks for requests/responses. Use callout blocks for authentication notes and warnings."
- "Build a tutorial page with step-by-step headings, inline code snippets, and a table of contents sidebar."

### Iteration Guide
1. Start with the navigation structure.
2. Ensure the reading line length is optimal.
3. Add code blocks with proper syntax highlighting.
4. Use callouts for important notes.
