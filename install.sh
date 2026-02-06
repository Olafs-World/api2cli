#!/bin/bash
set -e

echo "🔧 Installing openapi2cli..."

if command -v uv &>/dev/null; then
  echo "Using uv..."
  uv tool install openapi2cli
elif command -v pipx &>/dev/null; then
  echo "Using pipx..."
  pipx install openapi2cli
elif command -v pip3 &>/dev/null; then
  echo "Using pip3..."
  pip3 install --user openapi2cli
elif command -v pip &>/dev/null; then
  echo "Using pip..."
  pip install --user openapi2cli
else
  echo "❌ No Python package manager found (uv, pipx, or pip)"
  echo "Install uv: curl -LsSf https://astral.sh/uv/install.sh | sh"
  exit 1
fi

echo ""
echo "✅ openapi2cli installed!"
echo ""
echo "Try it:"
echo "  openapi2cli generate https://httpbin.org/spec.json --name httpbin"
