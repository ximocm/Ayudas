#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IN_DIR="$ROOT_DIR/pr1/data_practical_session_1/NT_complete"
OUT_DIR="$ROOT_DIR/pr1/output/02_concatenate_gene_alignments"
OUT_FILE="$OUT_DIR/core.fasta"

mkdir -p "$OUT_DIR"
cd "$IN_DIR"
rm -f "$OUT_FILE"

grep '>' Rv0001_NT_complete.fasta | sed 's/>//g' | while read -r line; do
  echo ">$line" >> "$OUT_FILE"
  sed -n "/$line/,/>/p" *_NT_complete.fasta | grep -v ">" | tr -d '\n' >> "$OUT_FILE"
  printf "\n" >> "$OUT_FILE"
done

echo "Core alignment written to: $OUT_FILE"
