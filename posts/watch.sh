#!/usr/bin/env sh

while true; do
  ./gen.ml
  echo
  inotifywait -e modify -r md
done
