#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MACSE_JAR="$ROOT_DIR/tools/src/macse/macse_v2.07.jar"
DATA_DIR="$ROOT_DIR/pr1/data_practical_session_1"
OUT_DIR="$ROOT_DIR/pr1/output/01_individualgenealignments"
JOBS="${1:-$(nproc 2>/dev/null || getconf _NPROCESSORS_ONLN 2>/dev/null || echo 2)}"

if [[ ! -f "$MACSE_JAR" ]]; then
  echo "ERROR: MACSE jar not found at $MACSE_JAR" >&2
  exit 1
fi

if [[ ! "$JOBS" =~ ^[1-9][0-9]*$ ]]; then
  echo "ERROR: jobs must be a positive integer (got: $JOBS)" >&2
  exit 1
fi

cd "$DATA_DIR"
mkdir -p "$OUT_DIR"
shopt -s nullglob
fasta_files=( *.fasta )

if (( ${#fasta_files[@]} == 0 )); then
  echo "No .fasta files found in $DATA_DIR"
  exit 0
fi

echo "Running ${#fasta_files[@]} file(s) with $JOBS parallel job(s)"

printf '%s\0' "${fasta_files[@]}" | xargs -0 -n1 -P "$JOBS" bash -c '
macse_jar="$1"
out_dir="$2"
file="$3"
base="${file%.fasta}"
nt_out="$out_dir/${base}_NT.fasta"
aa_out="$out_dir/${base}_AA.fasta"
echo "Running MACSE for: $file"
java -jar "$macse_jar" \
  -prog alignSequences \
  -gc_def 11 \
  -seq "$file" \
  -out_NT "$nt_out" \
  -out_AA "$aa_out"
' _ "$MACSE_JAR" "$OUT_DIR"

nt_count=$(ls -1 "$OUT_DIR"/*_NT.fasta 2>/dev/null | wc -l || true)
echo "Done. Generated $nt_count file(s) matching *_NT.fasta in $OUT_DIR"
