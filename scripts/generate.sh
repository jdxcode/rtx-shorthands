#!/usr/bin/env bash
set -euo pipefail

rm -rf asdf-plugins
git clone --depth 1 https://github.com/asdf-vm/asdf-plugins
rm -f shorthands.toml

cat > shorthands.toml <<EOF
# This file is generated by scripts/generate.sh
# DO NOT EDIT
EOF
for file in asdf-plugins/plugins/*; do
    plugin=$(basename "$file")
    repository=$(cat "$file")
    repository="${repository/#repository = }"
    echo "$plugin = \"$repository\"" >> shorthands.toml
done
rm -rf asdf-plugins
