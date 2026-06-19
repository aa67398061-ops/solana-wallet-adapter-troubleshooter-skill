#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-$HOME/.claude/skills/solana-wallet-adapter-troubleshooter}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$TARGET_DIR"
cp -R "$SCRIPT_DIR/skill/." "$TARGET_DIR/"

echo "Installed solana-wallet-adapter-troubleshooter to $TARGET_DIR"
echo "Restart your agent session or reload skills if needed."
