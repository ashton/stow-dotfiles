# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a [Doom Emacs](https://github.com/doomemacs/doomemacs) configuration (`$DOOMDIR`). The three files here are the entirety of the user config layer on top of Doom's module system.

## Common Commands

After any change to `init.el` or `packages.el`, run:
```sh
doom sync
```

After adding a new package that requires a tree-sitter grammar, run inside Emacs:
```
M-x treesit-install-language-grammar
```

To reload config without restarting Emacs:
```
M-x doom/reload
```

## File Roles

- **`init.el`** — Declares which Doom modules are active. Changing this requires `doom sync` + Emacs restart.
- **`packages.el`** — Adds or pins extra packages not covered by Doom modules. Also requires `doom sync`.
- **`config.el`** — All runtime configuration. Changes here take effect after `M-x doom/reload` (no `doom sync` needed).

## Key Patterns in config.el

- Wrap package config in `(after! PACKAGE ...)` so Doom defaults don't override it.
- Exceptions: `doom-*` variables, `org-directory`, and variables documented to be set before load can be set at top level.
- Use `map!` (not `define-key` or `evil-define-key`) for keybindings.
- Use `use-package!` (not bare `use-package`) for package setup.

## Active Non-default Packages

- `gleam-ts-mode` — Gleam language support via tree-sitter (from `gleam-lang/gleam-mode` main branch)
- `evil-ts-obj` — Evil text objects powered by tree-sitter, hooked into `gleam-ts-mode`

## Current Config Highlights

- Theme: `doom-ayu-mirage`
- Font: JetBrainsMono NF, size 14
- Completion: `vertico` (not ivy/helm)
- LSP enabled globally; `format +onsave` active
- Projectile searches `~/dev` for projects
- Custom keybinding: `SPC w O` / `C-]` → go to next window and enlarge it
