#!/bin/bash
set -ex

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ROOT_DIR"

PROJECTS=("plugin" "app")
SWIFT_DEST_DIRS=("macos/Classes/generated" "macos/Runner/generated")
for i in "${!PROJECTS[@]}"; do
  project="${PROJECTS[$i]}"
  swift_dest_dir="${SWIFT_DEST_DIRS[$i]}"
  pushd "$project"
  dart pub get
  dart run pigeon \
    --input pigeon/pigeon.dart \
    --dart_out lib/generated/pigeon.dart \
    --swift_out "$swift_dest_dir/Pigeon.swift"
  dart analyze
  popd
done
