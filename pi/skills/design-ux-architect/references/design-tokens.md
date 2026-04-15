# Design Tokens & Tailwind Configuration

## CSS Custom Properties (design-tokens.css)

```css
:root {
  /* ─── Color: The Subarctic Palette ─── */

  /* Core Neutral — 90% of your interface lives here */
  --nav-snow:       #F5F0EB;    /* Warm white — primary background */
  --nav-carbon:     #1A1A1A;    /* Near-black — primary text, inverted states */
  --nav-granite:    #4A4A4A;    /* Mid-gray — secondary text, borders */
  --nav-slate:      #7A7A7A;    /* Light gray — muted text, disabled states */
  --nav-ash:        #B0B0B0;    /* Pale gray — placeholders, dividers */

  /* Accent — Scalpel, not paint roller */
  --nav-fjord:      #2B4B5B;    /* Deep teal — links, interactive */
  --nav-aurora:     #5B8A72;    /* Muted green — success, secondary accent */
  --nav-rust:       #8B4A3A;    /* Oxidized red — errors, CTAs, emphasis */
  --nav-ember:      #B8864A;    /* Warm amber — warnings, highlights */

  /* Surfaces — For layered compositions, never for shadows */
  --nav-frost:      #E8E3DD;    /* Elevated surface (light mode) */
  --nav-ice:        #DDD8D2;    /* Deep elevated surface (light mode) */
  --nav-basalt:     #2A2A2A;    /* Elevated surface (dark mode) */
  --nav-obsidian:   #0D0D0D;    /* Deep background (dark mode) */

  /* Functional */
  --nav-surface:    var(--nav-snow);
  --nav-on-surface: var(--nav-carbon);
  --nav-border:     var(--nav-granite);
  --nav-muted:      var(--nav-slate);

  /* ─── Typography ─── */

  --font-display:   "Instrument Serif", "Playfair Display", Georgia, serif;
  --font-sans:      "Inter", "Instrument Sans", system-ui, sans-serif;
  --font-mono:      "JetBrains Mono", "Fira Code", monospace;

  /* ─── Spacing: 8px Grid ─── */

  --space-1:  4px;    /* Micro-alignment */
  --space-2:  8px;    /* Tightest internal */
  --space-3:  16px;   /* Component internal */
  --space-4:  24px;   /* Between related */
  --space-5:  48px;   /* Between unrelated */
  --space-6:  72px;   /* Between major sections */
  --space-7:  96px;   /* Hero section padding */

  /* ─── Easings ─── */

  --ease-premium:    cubic-bezier(0.22, 1, 0.36, 1);
  --ease-aggressive: cubic-bezier(0.76, 0, 0.24, 1);
  --ease-dramatic:   cubic-bezier(0.87, 0, 0.13, 1);
  --ease-gentle:     cubic-bezier(0.25, 0.1, 0.25, 1);

  /* ─── Durations ─── */

  --duration-fast:   150ms;     /* Micro-interactions */
  --duration-normal: 300ms;     /* Standard transitions */
  --duration-slow:   500ms;     /* Emphasized transitions */
  --duration-dramatic: 800ms;  /* Hero reveals */
}

/* Dark mode overrides */
@media (prefers-color-scheme: dark) {
  :root {
    --nav-surface:    var(--nav-obsidian);
    --nav-on-surface: var(--nav-snow);
    --nav-border:     var(--nav-slate);
    --nav-muted:      var(--nav-ash);
  }
}
```

---

## Tailwind Config Extension (tailwind.config.ts)

```typescript
import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./app/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
  ],
  theme: {
    extend: {
      /* ─── Colors ─── */
      colors: {
        nav: {
          snow:      "var(--nav-snow)",
          carbon:    "var(--nav-carbon)",
          granite:   "var(--nav-granite)",
          slate:     "var(--nav-slate)",
          ash:       "var(--nav-ash)",
          fjord:     "var(--nav-fjord)",
          aurora:    "var(--nav-aurora)",
          rust:      "var(--nav-rust)",
          ember:     "var(--nav-ember)",
          frost:     "var(--nav-frost)",
          ice:       "var(--nav-ice)",
          basalt:    "var(--nav-basalt)",
          obsidian:  "var(--nav-obsidian)",
          surface:   "var(--nav-surface)",
          "on-surface": "var(--nav-on-surface)",
        },
      },

      /* ─── Font Families ─── */
      fontFamily: {
        display: ['"Instrument Serif"', '"Playfair Display"', "Georgia", "serif"],
        sans: ['"Inter"', '"Instrument Sans"', "system-ui", "sans-serif"],
        mono: ['"JetBrains Mono"', '"Fira Code"', "monospace"],
      },

      /* ─── Spacing (8px grid) ─── */
      spacing: {
        "nav-1": "4px",
        "nav-2": "8px",
        "nav-3": "16px",
        "nav-4": "24px",
        "nav-5": "48px",
        "nav-6": "72px",
        "nav-7": "96px",
      },

      /* ─── Font Sizes (Display Scale) ─── */
      fontSize: {
        "display-xl": ["120px", { lineHeight: "1.0", letterSpacing: "-0.02em" }],
        "display-lg": ["96px",  { lineHeight: "1.0", letterSpacing: "-0.02em" }],
        "display-md": ["72px",  { lineHeight: "1.05", letterSpacing: "-0.02em" }],
        "display-sm": ["48px",  { lineHeight: "1.1", letterSpacing: "-0.01em" }],
      },

      /* ─── Letter Spacing ─── */
      letterSpacing: {
        "nav-tight":  "-0.02em",
        "nav-snug":   "-0.01em",
        "nav-normal": "0em",
        "nav-wide":   "0.05em",
        "nav-wider":  "0.1em",
        "nav-widest": "0.2em",
      },

      /* ─── Border Radius ─── */
      borderRadius: {
        "nav-none": "0px",
        "nav-sm":   "2px",
      },

      /* ─── Transition Timing ─── */
      transitionTimingFunction: {
        "nav-premium":    "cubic-bezier(0.22, 1, 0.36, 1)",
        "nav-aggressive": "cubic-bezier(0.76, 0, 0.24, 1)",
        "nav-dramatic":   "cubic-bezier(0.87, 0, 0.13, 1)",
        "nav-gentle":     "cubic-bezier(0.25, 0.1, 0.25, 1)",
      },

      /* ─── Transition Duration ─── */
      transitionDuration: {
        "150": "150ms",
        "300": "300ms",
        "500": "500ms",
        "800": "800ms",
      },

      /* ─── Keyframes ─── */
      keyframes: {
        marquee: {
          "0%":   { transform: "translateX(0%)" },
          "100%": { transform: "translateX(-50%)" },
        },
        "blur-in": {
          "0%":   { filter: "blur(12px)", opacity: "0" },
          "100%": { filter: "blur(0px)", opacity: "1" },
        },
        "wipe-down": {
          "0%":   { clipPath: "inset(0 0 100% 0)" },
          "100%": { clipPath: "inset(0 0 0% 0)" },
        },
      },

      animation: {
        marquee:    "marquee 30s linear infinite",
        "blur-in":  "blur-in 800ms cubic-bezier(0.22,1,0.36,1) forwards",
        "wipe-down":"wipe-down 600ms cubic-bezier(0.22,1,0.36,1) forwards",
      },
    },
  },
  plugins: [],
};

export default config;
```

---

## Font Installation

### Next.js / React Project

```bash
# Using next/font (recommended for Next.js)
# No installation needed — next/font loads from Google CDN automatically

# For non-Next.js projects:
npm install @fontsource-variable/instrument-serif @fontsource/inter @fontsource/jetbrains-mono
```

### Next.js Font Configuration (layout.tsx)

```tsx
import { Inter, JetBrains_Mono } from "next/font/google";
import { Instrument_Serif } from "next/font/google";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-sans",
  display: "swap",
});

const instrumentSerif = Instrument_Serif({
  subsets: ["latin"],
  variable: "--font-display",
  display: "swap",
});

const jetbrainsMono = JetBrains_Mono({
  subsets: ["latin"],
  variable: "--font-mono",
  display: "swap",
});

export default function RootLayout({ children }) {
  return (
    <html className={`${inter.variable} ${instrumentSerif.variable} ${jetbrainsMono.variable}`}>
      <body className="font-sans bg-nav-snow text-nav-carbon antialiased">
        {children}
      </body>
    </html>
  );
}
```

---

## Required Dependencies

```json
{
  "dependencies": {
    "framer-motion": "^11.0.0",
    "next": "^14.0.0",
    "react": "^18.0.0",
    "tailwindcss": "^3.4.0"
  }
}
```

---

## The Base Layout Component

```tsx
// components/NordicLayout.tsx
// Wraps every page with the design system's DNA

export default function NordicLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen bg-nav-snow text-nav-carbon
      selection:bg-nav-carbon selection:text-nav-snow">
      {/* Skip to content — accessibility first */}
      <a href="#main" className="sr-only focus:not-sr-only focus:absolute
        focus:p-4 focus:bg-nav-carbon focus:text-nav-snow focus:z-50">
        Skip to content
      </a>

      <main id="main" className="mx-auto max-w-[1200px] px-nav-3 md:px-nav-5">
        {children}
      </main>
    </div>
  );
}
```