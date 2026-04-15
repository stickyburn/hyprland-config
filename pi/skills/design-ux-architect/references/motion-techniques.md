# Motion Techniques Library — Copy-Paste Recipes

All recipes use Framer Motion (React) or CSS where noted.
All easings use custom cubic-bezier curves — never springs, never `ease-in-out`.

---

## 1. Blur-Reveal Heading (Hero Pattern)

The signature entrance. Used by Linear, Vercel, Apple.

```tsx
import { motion } from "framer-motion";

function HeroHeading({ text }: { text: string }) {
  return (
    <motion.h1
      className="text-7xl font-bold tracking-tight"
      initial={{ filter: "blur(12px)", opacity: 0 }}
      animate={{ filter: "blur(0px)", opacity: 1 }}
      transition={{ duration: 0.8, ease: [0.22, 1, 0.36, 1] }}
    >
      {text}
    </motion.h1>
  );
}
```

**Variation — Staggered Word Reveal:**
```tsx
function StaggeredHero({ text }: { text: string }) {
  const words = text.split(" ");
  return (
    <motion.h1 className="text-7xl font-bold tracking-tight flex flex-wrap">
      {words.map((word, i) => (
        <motion.span
          key={i}
          className="mr-[0.3em]"
          initial={{ filter: "blur(10px)", opacity: 0 }}
          animate={{ filter: "blur(0px)", opacity: 1 }}
          transition={{
            duration: 0.6,
            delay: i * 0.08,
            ease: [0.22, 1, 0.36, 1]
          }}
        >
          {word}
        </motion.span>
      ))}
    </motion.h1>
  );
}
```

**Variation — Character-Level Un-Blur (Most Premium):**
```tsx
function CharacterReveal({ text }: { text: string }) {
  const chars = text.split("");
  return (
    <motion.h1 className="text-8xl font-serif tracking-tight inline-flex overflow-hidden">
      {chars.map((char, i) => (
        <motion.span
          key={i}
          className="inline-block"
          initial={{ filter: "blur(8px)", opacity: 0, y: 4 }}
          animate={{ filter: "blur(0px)", opacity: 1, y: 0 }}
          transition={{
            duration: 0.4,
            delay: i * 0.025,
            ease: [0.22, 1, 0.36, 1]
          }}
        >
          {char === " " ? "\u00A0" : char}
        </motion.span>
      ))}
    </motion.h1>
  );
}
```

---

## 2. Clip-Path Directional Reveals

### Top Wipe (Slide down from top)
```tsx
<motion.div
  initial={{ clipPath: "inset(0 0 100% 0)" }}
  animate={{ clipPath: "inset(0 0 0% 0)" }}
  transition={{ duration: 0.6, ease: [0.22, 1, 0.36, 1] }}
>
  Content reveals from top
</motion.div>
```

### Bottom Wipe (Slide up from bottom)
```tsx
<motion.div
  initial={{ clipPath: "inset(100% 0 0 0)" }}
  animate={{ clipPath: "inset(0% 0 0 0)" }}
  transition={{ duration: 0.6, ease: [0.22, 1, 0.36, 1] }}
>
  Content reveals from bottom
</motion.div>
```

### Left Wipe
```tsx
<motion.div
  initial={{ clipPath: "inset(0 100% 0 0)" }}
  animate={{ clipPath: "inset(0 0% 0 0)" }}
  transition={{ duration: 0.6, ease: [0.22, 1, 0.36, 1] }}
>
  Content reveals from left
</motion.div>
```

### Circular Expand (Modal/Overlay Pattern)
```tsx
// Pass click coordinates for origin point
function CircularReveal({ x, y, children }: { x: number; y: number; children: React.ReactNode }) {
  return (
    <motion.div
      initial={{ clipPath: `circle(0% at ${x}px ${y}px)` }}
      animate={{ clipPath: `circle(150% at ${x}px ${y}px)` }}
      transition={{ duration: 0.7, ease: [0.22, 1, 0.36, 1] }}
    >
      {children}
    </motion.div>
  );
}
```

### Diagonal Wipe (Advanced)
```tsx
<motion.div
  initial={{ clipPath: "polygon(0 0, 100% 0, 100% 0, 0 0)" }}
  animate={{ clipPath: "polygon(0 0, 100% 0, 100% 100%, 0 100%)" }}
  transition={{ duration: 0.7, ease: [0.22, 1, 0.36, 1] }}
>
  Diagonal sweep reveal
</motion.div>
```

---

## 3. Scroll-Triggered Animations

### Fade-In on Scroll with Blur
```tsx
"use client";
import { motion, useInView } from "framer-motion";
import { useRef } from "react";

function ScrollReveal({ children, delay = 0 }: { children: React.ReactNode; delay?: number }) {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <motion.div
      ref={ref}
      initial={{ filter: "blur(8px)", opacity: 0, y: 12 }}
      animate={isInView ? { filter: "blur(0px)", opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.6, delay, ease: [0.22, 1, 0.36, 1] }}
    >
      {children}
    </motion.div>
  );
}
```

### Scroll-Driven Parallax (CSS Only)
```css
.parallax-section {
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
```

### Scroll-Driven Horizontal Wipe
```tsx
"use client";
import { motion, useScroll, useTransform } from "framer-motion";
import { useRef } from "react";

function ScrollHorizontalWipe({ children }: { children: React.ReactNode }) {
  const ref = useRef(null);
  const { scrollYProgress } = useScroll({
    target: ref,
    offset: ["start end", "end start"]
  });
  const clipPath = useTransform(
    scrollYProgress,
    [0, 0.3],
    ["inset(0 100% 0 0)", "inset(0 0% 0 0)"]
  );

  return (
    <motion.div ref={ref} style={{ clipPath }}>
      {children}
    </motion.div>
  );
}
```

---

## 4. Hover Interaction Patterns

### The Inversion Button
```tsx
<button className="group relative">
  <div className="bg-[var(--nav-snow)] text-[var(--nav-carbon)]
    border border-[var(--nav-carbon)] px-6 py-3 text-sm uppercase tracking-[0.1em]
    transition-colors duration-200 ease-[cubic-bezier(0.22,1,0.36,1)]
    group-hover:bg-[var(--nav-carbon)] group-hover:text-[var(--nav-snow)]">
    Explore
  </div>
</button>
```

### The Arrow Slide-In CTA
```tsx
<button className="group bg-[var(--nav-carbon)] text-[var(--nav-snow)]
  px-6 py-3 text-sm uppercase tracking-[0.1em] overflow-hidden">
  <span className="inline-flex items-center gap-2">
    <span className="inline-block -translate-x-4 opacity-0
      group-hover:translate-x-0 group-hover:opacity-100
      transition-all duration-300 ease-[cubic-bezier(0.22,1,0.36,1)]">
      →
    </span>
    <span>Continue</span>
  </span>
</button>
```

### The Underline-Draw Link
```tsx
<a className="group relative inline-block">
  <span>Read the essay</span>
  <span className="absolute bottom-0 left-0 w-0 h-[1px] bg-current
    group-hover:w-full transition-all duration-500 ease-[cubic-bezier(0.22,1,0.36,1)]" />
</a>
```

### The Magnetic Element
```tsx
"use client";
import { motion, useMotionValue, useSpring } from "framer-motion";

function Magnetic({ children, strength = 0.15 }) {
  const x = useMotionValue(0);
  const y = useMotionValue(0);
  const springConfig = { stiffness: 150, damping: 15 };
  const springX = useSpring(x, springConfig);
  const springY = useSpring(y, springConfig);

  const handleMouse = (e: React.MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect();
    x.set((e.clientX - rect.left - rect.width / 2) * strength);
    y.set((e.clientY - rect.top - rect.height / 2) * strength);
  };
  const reset = () => { x.set(0); y.set(0); };

  return (
    <motion.div
      onMouseMove={handleMouse}
      onMouseLeave={reset}
      style={{ x: springX, y: springY }}
    >
      {children}
    </motion.div>
  );
}
```

### The Border-Draw Card
```tsx
"use client";
import { useState } from "react";

function BorderDrawCard({ children }: { children: React.ReactNode }) {
  const [hovered, setHovered] = useState(false);

  return (
    <div
      className="relative p-6 cursor-pointer"
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
    >
      <svg className="absolute inset-0 w-full h-full pointer-events-none" preserveAspectRatio="none">
        <rect
          x="0.5" y="0.5"
          width="calc(100% - 1px)"
          height="calc(100% - 1px)"
          fill="none"
          stroke="currentColor"
          strokeWidth="1"
          className="text-[var(--nav-carbon)]"
          strokeDasharray="800"
          strokeDashoffset={hovered ? "0" : "800"}
          style={{ transition: 'stroke-dashoffset 800ms cubic-bezier(0.22,1,0.36,1)' }}
        />
      </svg>
      <div className="relative z-10">{children}</div>
    </div>
  );
}
```

---

## 5. Page Transition Patterns

### Clip-Path Page Transition
```tsx
// In your Next.js layout or page wrapper
import { AnimatePresence, motion } from "framer-motion";

function PageTransition({ children }) {
  return (
    <AnimatePresence mode="wait">
      <motion.div
        key={pathname}
        initial={{ clipPath: "inset(0 0 100% 0)", opacity: 1 }}
        animate={{ clipPath: "inset(0 0 0% 0)", opacity: 1 }}
        exit={{ clipPath: "inset(100% 0 0 0)", opacity: 1 }}
        transition={{ duration: 0.5, ease: [0.22, 1, 0.36, 1] }}
      >
        {children}
      </motion.div>
    </AnimatePresence>
  );
}
```

### Blur Transition Between Routes
```tsx
<motion.div
  key={pathname}
  initial={{ filter: "blur(16px)", opacity: 0 }}
  animate={{ filter: "blur(0px)", opacity: 1 }}
  exit={{ filter: "blur(16px)", opacity: 0 }}
  transition={{ duration: 0.4, ease: [0.22, 1, 0.36, 1] }}
>
  {children}
</motion.div>
```

---

## 6. The Marquee / Ticker

```tsx
// Pure CSS — no Framer Motion needed for infinite loop
function Marquee({ items, speed = 30 }: { items: string[]; speed?: number }) {
  return (
    <div className="overflow-hidden">
      <div
        className="flex whitespace-nowrap"
        style={{ animation: `marquee ${speed}s linear infinite` }}
      >
        {[...items, ...items].map((item, i) => (
          <span key={i} className="mx-8 text-sm uppercase tracking-[0.2em] text-[var(--nav-granite)]">
            {item}
          </span>
        ))}
      </div>
    </div>
  );
}

// Add to tailwind.config.ts:
// keyframes: { marquee: { '0%': { transform: 'translateX(0%)' }, '100%': { transform: 'translateX(-50%)' } } },
// animation: { marquee: 'marquee 30s linear infinite' }
```

**Variation — Reversed Marquee (dual-direction):**
```tsx
function DualMarquee({ items }: { items: string[] }) {
  return (
    <div className="space-y-4">
      <Marquee items={items} speed={30} />
      <Marquee items={[...items].reverse()} speed={35} /> {/* Slower = visual depth */}
    </div>
  );
}
```

---

## 7. The Loading State (Non-Spinner)

Spinners are overused. Instead:

### Blur-Pulse Loading
```tsx
<motion.div
  animate={{ filter: ["blur(4px)", "blur(0px)", "blur(4px)"] }}
  transition={{ duration: 2, repeat: Infinity, ease: [0.22, 1, 0.36, 1] }}
  className="text-[var(--nav-granite)] text-sm uppercase tracking-[0.2em]"
>
  Loading
</motion.div>
```

### Dash-Offset Loading Bar
```tsx
function LoadingBar() {
  return (
    <div className="w-48 h-[1px] bg-[var(--nav-frost)]">
      <motion.div
        className="h-full bg-[var(--nav-carbon)]"
        initial={{ width: "0%" }}
        animate={{ width: ["0%", "70%", "100%"] }}
        transition={{ duration: 1.5, ease: [0.22, 1, 0.36, 1] }}
      />
    </div>
  );
}
```

---

## Easing Reference Card

| Name | Bezier Values | Use For | Feel |
|------|---------------|---------|------|
| Premium | `[0.22, 1, 0.36, 1]` | Default for everything | Slow, authoritative |
| Aggressive | `[0.76, 0, 0.24, 1]` | Destructive actions, dismissals | Snappy, decisive |
| Dramatic | `[0.87, 0, 0.13, 1]` | Hero reveals, page transitions | Pauses, then commits |
| Gentle | `[0.25, 0.1, 0.25, 1]` | Micro-interactions, toggles | Soft, understated |
| Overshoot | `[0.68, -0.55, 0.27, 1.55]` | RARE — playful elements only | Bouncy (controlled!) |

**Rule:** Use Premium as default. Only deviate with explicit justification.