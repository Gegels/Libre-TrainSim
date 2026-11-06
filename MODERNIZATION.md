# Modernization roadmap

This document tracks **incremental** technical improvements. A full **Godot 4** port is a separate, large effort (API changes, renderer, addons, and scene/script migration); it is not tracked here as a single checkbox.

## Done in this repository (ongoing)

- CI runs **`src/tools/ci_validate_scripts.gd`**: parses every `.gd` file via `GDScript.reload()` so **syntax errors fail the build** without requiring a full asset import or export.
- GitHub Actions use maintained action versions (`v4`) where applicable.
- Obvious script path typo fixed: `translated_rich_text_label.gd` (was `rext`).

## Short-term (Godot 3.x, low risk)

- Introduce **gdformat** and **gdlint** (or [GDTools](https://github.com/Scony/godot-gdscript-toolkit)) in CI with a gradual allowlist so legacy scripts are not blocked overnight.
- Add a minimal **unit/integration test** harness (e.g. [GUT](https://github.com/bitwes/Gut)) for deterministic game logic.
- Document a **contribution architecture** outline (main scenes, autoloads, editor vs runtime) in `README.md` or a dedicated `docs/` tree.

## Medium-term (still Godot 3.x or parallel branch)

- Replace manual `_global_script_classes` maintenance with **`class_name`**-first conventions where practical (prepares for Godot 4 editor defaults).
- Audit **third-party addons** under `src/addons/` for license clarity and upgrade paths.
- Improve **import/cache** story for CI (deterministic imports without flaky cross-OS caches).

## Long-term (Godot 4)

- Follow the official [Upgrading from Godot 3 to 4](https://docs.godotengine.org/en/stable/tutorials/migrating/upgrading_to_godot_4.html) guide.
- Port or replace each addon; many Godot 3 editor plugins require a **maintained fork** or replacement.
- Re-test all export targets (desktop, Android) and input/rendering settings.

Pull requests that move one bullet forward are welcome; prefer **small, reviewable** changes over a monolithic port.
