# Design Archetype: Enterprise Clean

## Atmosphere & Mood

A design language of trust, structure, and professionalism. The interface communicates reliability and competence. It is the visual system of banks, insurance companies, enterprise SaaS, compliance platforms, and B2B marketplaces.

The aesthetic is restrained but not boring. It uses a formal grid, clear hierarchy, and a conservative color palette to create an environment where users feel confident making important decisions. Every element is predictable and consistent.

**Key Characteristics:**
- Light background (white or very light gray)
- Structured, formal grid layout
- Blue or blue-green as the primary trust color
- Clean, humanist sans-serif typography
- Clear data tables and forms
- Step-by-step wizards and progress indicators
- Modest border-radius (4–8px)
- Subtle shadows for cards and modals only

## Color Philosophy

### Primary Roles
- **Primary surface**: Clean white or very light cool gray.
- **Elevated surface**: White for cards, modals, and panels.
- **Primary text**: Near-black or dark blue-gray.
- **Secondary text**: Medium gray.
- **Brand accent**: Trust blue or blue-green. Used for primary buttons, active nav, links, and focus states.
- **Success**: Green.
- **Warning**: Amber.
- **Error**: Red.
- **Borders**: Light gray, thin.

### Trust Colors
- Blue and blue-green evoke stability, security, and professionalism.
- Avoid playful or neon colors.
- Keep saturation moderate.

## Typography Direction

### Genre
- **Headlines**: Clean humanist sans-serif. Medium to semibold.
- **Body**: Same family, regular weight.
- **Data**: Monospace for code or numerical tables.

### Principles
- Clear size hierarchy.
- Generous line-height for body (1.5–1.6).
- Avoid decorative fonts.
- Use uppercase + letter-spacing only for small labels.

## Component Patterns

### Buttons
- **Primary**: Trust blue background with white text. Standard radius.
- **Secondary**: White background with blue border and text.
- **Danger**: Red background for destructive actions.

### Forms
- Clear labels above inputs.
- Error states with red text and border.
- Helper text in gray.
- Progress bars for multi-step flows.

### Tables
- Clean, bordered or borderless.
- Sortable columns.
- Pagination controls.
- Row hover highlight.

### Navigation
- Top bar with logo, main nav links, user dropdown.
- Sidebar for secondary navigation in complex apps.
- Breadcrumbs for deep hierarchies.

### Modals & Wizards
- Centered modal with white background and subtle shadow.
- Step indicators for wizards.
- Clear primary and secondary actions at the bottom.

## Layout & Spacing

### Spacing
- Base unit: 8px.
- Standard padding (16–24px) inside cards.
- Section spacing: moderate (40–80px).

### Grid
- Max content width: 1200–1400px.
- 12-column grid for complex layouts.
- Forms: single column or two-column.

## Depth & Elevation

- Flat for most content.
- Subtle shadow for cards and modals.
- No heavy shadows.

## Do's and Don'ts

### Do
- Use a structured grid.
- Use trust colors (blue, blue-green).
- Provide clear form validation.
- Use familiar, predictable patterns.
- Maintain high contrast for readability.

### Don't
- Don't use playful illustrations or animations.
- Don't use bright neon or gradient colors.
- Don't break the grid.
- Don't use informal language in UI copy.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create an enterprise dashboard with a top navigation, sidebar, and a clean white content area. Use trust blue for primary buttons and active nav."
- "Design a multi-step form wizard with a progress bar, clear labels, and standard input fields."
- "Build a data table with pagination, sortable columns, and status badges in green, amber, and red."
