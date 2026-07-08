---
name: design-ux-ui
description: >
  Anytime the user asks for a revamp, ui design, ux changes, interactions, creating components, etc.
  Anything to do with design, ui, ux, and visual changes.
  This skill provides semantic design archetypes that the agent uses as structural and atmospheric
  references. All visual tokens (colors, fonts, spacing, shadows) are chosen dynamically based on
  the user's prompt, project context, and content.
---

# Design Archetypes

A curated set of real-world design archetypes for generating HTML/CSS. Each archetype captures a
complete visual *philosophy*: atmosphere, color logic, typography direction, component patterns,
spacing rhythm, and responsive behavior. **No hardcoded hex codes, font names, or exact pixel values
are included.** The agent derives all tokens from the user's specific project, prompt, and content.

## Philosophy

- **Context over prescription.** Colors, fonts, and exact values are never copied from a template.
  They are invented or selected to fit the user's project, brand, and mood.
- **Archetypes are mood boards with structure.** Use them to understand *what kind* of design
  language fits the content, then build a custom token set.
- **Semantic tokens first.** Define roles (brand accent, primary surface, muted text, border subtle)
  and assign values that make sense for the specific context.
- **Verify visually.** Use `write_file` for HTML creation and `browser_vision` for verification.

## How to Use

1. **Read the user's prompt** and identify the content type, tone, and audience.
2. **Match to an archetype** from the catalog below (or blend 2–3).
3. **Load the archetype:** `skill_view(name="design-ux-ui", file_path="templates/<archetype>.md")`
4. **Generate a custom design system** for this project:
   - Choose a font stack appropriate to the tone (serif for editorial, geometric sans for tech,
     monospace for developer tools, etc.). Use Google Fonts or system fonts; never assume a
     proprietary font is available.
   - Build a color palette with semantic roles. Derive hex/rgba values from the mood described
     (warm parchment for literary, near-black for cinematic, pure white for gallery minimal, etc.).
   - Establish a spacing scale (e.g., 4px or 8px base unit) suited to the density of the content.
   - Define border-radius logic (sharp for technical, soft for friendly, pill for badges).
5. **Generate HTML/CSS** using the custom tokens.
6. **Serve via `generative-widgets`** (cloudflared tunnel) and verify with `browser_vision`.

## Archetype Catalog

### AI & Machine Learning
| Archetype | Vibe | Best For |
|---|---|---|
| `warm-editorial` | Warm neutrals, serif authority, literary pacing | Thoughtful AI companions, research tools, writing assistants |
| `cinematic-dark` | Deep void, luminous accents, media-rich | Generative media, audio/video AI, creative tools |
| `terminal-native` | Monospace dominance, block UI, command-line aesthetic | Local LLMs, dev tools, CLI-first products |
| `minimal-monochrome` | Stark contrast, engineered precision, gallery whitespace | Frontier labs, research, stark product pages |

### Developer Tools & Platforms
| Archetype | Vibe | Best For |
|---|---|---|
| `dark-precision` | Dark-mode-native, subtle luminance, technical type | Issue trackers, IDEs, infrastructure dashboards |
| `minimal-monochrome` | Near-white canvas, compressed type, shadow-as-border | Deployment platforms, developer infrastructure |
| `vibrant-playful` | Bright accents, friendly gradients, bouncy UI | No-code tools, onboarding-heavy products, community |
| `terminal-native` | Full monospace, block layouts, shell aesthetics | Terminal emulators, CLI tools, code editors |

### Infrastructure & Cloud
| Archetype | Vibe | Best For |
|---|---|---|
| `technical-documentation` | Clean reading, code-forward, structured hierarchy | Docs sites, API references, technical blogs |
| `enterprise-clean` | Structured grids, formal hierarchy, blue trust | Enterprise SaaS, compliance, data platforms |
| `data-dense-dashboard` | Dark canvas, status colors, dense information | Observability, analytics, security dashboards |

### Design & Productivity
| Archetype | Vibe | Best For |
|---|---|---|
| `warm-editorial` | Soft surfaces, warm neutrals, serif headings | Note-taking, knowledge bases, long-form content |
| `friendly-illustrated` | Colorful but soft, illustration-driven, approachable | Collaborative whiteboards, creative suites, education |
| `playful-gradient` | Bold gradients, motion-first, design-forward | Design tools, prototyping apps, creative portfolios |
| `premium-luxury` | Vast whitespace, precise typography, restrained accent | High-end productivity, premium SaaS, exclusive tools |

### Fintech & Crypto
| Archetype | Vibe | Best For |
|---|---|---|
| `data-dense-dashboard` | Dark UI, data viz, high-contrast status | Trading, portfolio analytics, on-chain dashboards |
| `premium-luxury` | Dark premium surfaces, engineering precision | Wealth management, institutional fintech |
| `enterprise-clean` | Trust-forward, structured, blue-green stability | Banking, payments, compliance platforms |

### Enterprise & Consumer
| Archetype | Vibe | Best For |
|---|---|---|
| `premium-luxury` | Cinematic imagery, machined type, gallery space | Consumer electronics, automotive, luxury brands |
| `friendly-illustrated` | Warm coral accents, photography-driven, rounded | Travel, hospitality, community marketplaces |
| `vibrant-playful` | Bold type, album-art-driven, energetic | Streaming, social, entertainment |
| `warm-editorial` | Serif headings, soft surfaces, magazine pacing | Publishing, newsletters, content platforms |

## Token Derivation Guidelines

### Color
- Start with **atmosphere**, not a hex picker. Is the mood warm, cool, neutral, dark, or vivid?
- Define a **primary surface** (page background), **elevated surface** (cards), and **primary text**.
- Choose **one brand accent** for CTAs and focus. Add 1–2 semantic accents (success, warning) only if needed.
- Keep neutrals in the same temperature family. Warm grays for warm themes; cool grays for cool themes.
- Dark themes: use near-black with subtle undertone, not pure `#000000`. Light themes: use off-white
  or tinted white to avoid sterility.

### Typography
- Match type genre to content:
  - **Geometric sans** → tech, infrastructure, modern products
  - **Humanist sans** → friendly, consumer, approachable
  - **Serif** → editorial, literary, premium, trustworthy
  - **Monospace** → developer tools, terminals, technical labels
- Use 3–4 weights maximum. Derive hierarchy from size and weight, not decoration.
- Tight line-height (1.0–1.2) for headlines; relaxed (1.5–1.7) for body.
- Negative letter-spacing for large display type is appropriate for tech/minimal brands;
  avoid it for friendly/editorial brands.

### Spacing & Layout
- Choose a base unit (4px, 8px, or 0.25rem) and scale by doubling or adding rhythmically.
- Dense dashboards need tighter spacing; marketing pages need generous whitespace.
- Max content width should suit the content (narrow for reading, wide for dashboards).

### Depth & Elevation
- Prefer **borders** or **ring shadows** over heavy drop shadows for subtle elevation.
- Use multi-layer shadow stacks only when the design language demands floating cards.
- On dark surfaces, communicate elevation through background luminance steps, not drop shadows.

### Border Radius
- Sharp (0–2px) for technical/developer tools
- Soft (6–12px) for friendly consumer products
- Generous (16–32px) for playful or premium marketing
- Pill (9999px) exclusively for badges, tags, and status indicators

## Generic Agent Prompt Template

Use this structure when generating a design system for any project:

```
Design a [archetype] UI for a [project type] targeting [audience].

Atmosphere: [describe mood in 2–3 sentences]

Color logic:
- Primary surface: [description, e.g., warm parchment]
- Elevated surface: [description, e.g., slightly lighter warm cream]
- Primary text: [description, e.g., warm near-black]
- Secondary text: [description, e.g., warm medium gray]
- Brand accent: [description, e.g., burnt terracotta]
- Border subtle: [description, e.g., warm cream barely visible]

Typography:
- Headings: [genre + weight logic, e.g., warm serif at medium weight for authority]
- Body: [genre + weight logic, e.g., clean sans at regular weight for readability]
- Mono: [genre + usage, e.g., monospace for code and technical labels]

Spacing:
- Base unit: [e.g., 8px]
- Section rhythm: [e.g., generous 80–120px for editorial pacing]
- Content max-width: [e.g., 1200px centered]

Components:
- Buttons: [shape, depth, border strategy]
- Cards: [elevation, radius, border treatment]
- Inputs: [radius, focus strategy]
- Navigation: [behavior, mobile collapse]

Responsive:
- Mobile: [stacked, compact]
- Tablet: [2-column grids]
- Desktop: [full layout]
```

## Verification Checklist

After generating HTML, verify:
- [ ] No hardcoded proprietary fonts (e.g., no SF Pro, no Anthropic Serif unless the project is literally Apple/Anthropic)
- [ ] Colors feel unified and match the described mood
- [ ] Type hierarchy is clear without too many sizes
- [ ] Touch targets are adequate (min 44×44px on mobile)
- [ ] Border radius logic is consistent across components
- [ ] Dark/light sections have sufficient contrast
