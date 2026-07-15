# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is an [AGS (Aylur's GTK Shell)](https://github.com/Aylur/ags) v2 configuration for a Hyprland bar. It uses TypeScript with JSX (React-like syntax) targeting GTK4. The runtime is GJS (GNOME JavaScript), not Node — `gi://` imports are GObject introspection bindings.

## Running

```bash
# Run/reload AGS (from this directory)
ags run .

# Check TypeScript types without running
ags ts .
```

There are no test commands — this project has no test suite.

## Architecture

### Entry point
`app.ts` starts the AGS application, loads SCSS styles, and spawns a `Bar` instance per monitor.

### Bar layout
`Bar.tsx` creates a GTK layer-shell window per monitor anchored to the top edge. It uses a `centerbox` to split into three panels:
- **LeftPanel** — MenuButton, OutdatedPackages, Workspaces, Window title
- **CenterPanel** — SubMap (Hyprland keybind submap indicator), Media
- **RightPanel** — currently empty placeholder

### Reactivity model
AGS v2 uses signals/bindings rather than React state. Key primitives from `"ags"`:
- `createBinding(obj, "prop")` — reactive binding to a GObject property
- `createState(initial)` — returns `[accessor, setter]`; the accessor is both a value getter and a signal transformer (`accessor(val => derived)`)

Global reactive state lives in `variables.ts` and is imported by components that need it (e.g. `focusedWorkspace`, `workspaces`, `fullscreenClient`, `emptyWorkspace`, `globalMargin`).

### Settings system
`Settings` interface (`interfaces/settings.interface.ts`) describes all configurable values as `AGSSetting` objects with `{name, value, type, min, max}`. Default values are in `constants/settings.constants.ts`. At startup, `utils/settings.ts` reads `~/.config/ags/cache/settings/settings.json`, deep-merges it with defaults (preserving user values), and calls `setGlobalSettings`. Settings are persisted back to that JSON file on every change via `setGlobalSetting()` in `variables.ts`.

### Styling
SCSS lives in `scss/`. `style.scss` is the root; it imports constants, colors, animations, the lib helpers, and per-widget stylesheets under `scss/bar/`. The compiled CSS is passed directly to AGS at startup.

### GObject / GI imports
System libraries are imported via `gi://LibraryName?version=X.Y`. Type stubs are in `@girs/`. Do not install these — they're vendored for IDE type-checking only.

## Conventions

- JSX targets `ags/gtk4` — `jsxImportSource` is `"ags/gtk4"` (see `tsconfig.json`). GTK widget props map directly to JSX attributes.
- Prettier config: no semicolons, 2-space indent.
- New bar components go in `widgets/components/`, panel-level layout files go in their own `widgets/<panelName>/` directory.
- `$type="start"|"center"|"end"` on a panel component sets its `centerbox` slot.
