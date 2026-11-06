#!/usr/bin/env bash
# Local smoke check: parses every GDScript under src/ (same as CI validate job).
# Requires Godot 3.x matching the project (see .github/workflows/export.yml).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_DIR="${ROOT}/src"

if [[ -z "${GODOT_BIN:-}" ]]; then
	echo "Set GODOT_BIN to your Godot 3.x executable, e.g.:" >&2
	echo '  export GODOT_BIN="$HOME/Apps/Godot_v3.5.2-stable_linux_headless.64"' >&2
	exit 1
fi

exec "$GODOT_BIN" --path "$PROJECT_DIR" -q -s res://tools/ci_validate_scripts.gd "$@"
