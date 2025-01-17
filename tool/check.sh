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

echo "\n🧪 Running tests with coverage..."
dart pub global activate coverage
dart test --coverage=coverage
dart pub global run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --report-on=lib

echo "\n✅ All checks passed!" 