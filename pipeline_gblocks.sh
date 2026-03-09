#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOOLS_ENV="$ROOT_DIR/tools/use_tools.sh"
ALIGN_DIR="$ROOT_DIR/pr1/output/02_concatenate_gene_alignments"
INPUT_FILE="$ALIGN_DIR/core.fasta"
SUFFIX="-trim"
FINAL_FILE="$ALIGN_DIR/core_gblocks.fasta"

if [[ ! -f "$INPUT_FILE" ]]; then
  echo "ERROR: Input file not found: $INPUT_FILE" >&2
  exit 1
fi

if [[ ! -f "$TOOLS_ENV" ]]; then
  echo "ERROR: tools env script not found: $TOOLS_ENV" >&2
  exit 1
fi

# Load PATH with local tools/bin (where Gblocks launcher is installed).
source "$TOOLS_ENV"

echo "Running: Gblocks $INPUT_FILE -t=c -b5=a -e=$SUFFIX"
Gblocks "$INPUT_FILE" -t=c -b5=a -e="$SUFFIX"

generated_fa="${INPUT_FILE}${SUFFIX}.fa"
if [[ ! -f "$generated_fa" ]]; then
  echo "ERROR: Expected Gblocks output not found: $generated_fa" >&2
  exit 1
fi

cp -f "$generated_fa" "$FINAL_FILE"
echo "Done. Trimmed alignment copied to: $FINAL_FILE"
