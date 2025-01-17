#!/bin/bash

# Exit on error
set -e

echo "🔍 Running all checks..."

echo "\n📦 Getting dependencies..."
dart pub get

echo "\n✨ Checking formatting..."
dart format --output=none --set-exit-if-changed .

echo "\n🔎 Running static analysis..."
dart analyze

echo "\n🧪 Running tests..."
dart test

echo "\n✅ All checks passed!" 