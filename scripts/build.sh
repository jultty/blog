#!/usr/bin/env sh

set -eu

git_root=$(git rev-parse --show-toplevel)

zola check --skip-external-links
zola --root "$git_root" build
"$git_root"/scripts/octothorpe-index.sh
