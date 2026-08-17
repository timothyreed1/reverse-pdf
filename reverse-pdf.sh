#!/usr/bin/env bash
#
# reverse-pdf.sh — reverse a PDF's page order
#
# Usage: reverse-pdf.sh <input.pdf> [output.pdf]
#
# If no output path is given, writes "<input>-reversed.pdf" next to the input.
# Requires pdftk (brew install pdftk-java).

set -euo pipefail

usage() {
  echo "Usage: $(basename "$0") <input.pdf> [output.pdf]" >&2
  exit 1
}

[ "$#" -ge 1 ] && [ "$#" -le 2 ] || usage

input="$1"

[ -f "$input" ] || { echo "Error: input file not found: $input" >&2; exit 1; }

case "$input" in
  *.pdf|*.PDF) ;;
  *) echo "Warning: input file doesn't end in .pdf, continuing anyway" >&2 ;;
esac

if [ "$#" -eq 2 ]; then
  output="$2"
else
  dir=$(dirname "$input")
  base=$(basename "$input")
  name="${base%.*}"
  output="${dir}/${name}-reversed.pdf"
fi

if [ -e "$output" ]; then
  echo "Error: output file already exists: $output" >&2
  echo "Delete it or specify a different file." >&2
  exit 1
fi

command -v pdftk >/dev/null 2>&1 || {
  echo "Error: pdftk not found. Install it with brew install pdftk-java" >&2
  exit 1
}

# "end-1" = reorder from last page to first.
pdftk "$input" cat end-1 output "$output"

echo "Wrote: $output" >&2
