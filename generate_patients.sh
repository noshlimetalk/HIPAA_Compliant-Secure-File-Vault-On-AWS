#!/bin/bash


OUTPUT="$HOME/patient-vault/raw_records"
mkdir -p "$OUTPUT"
NAMES=("James Thompson" "Maria Nyguen" "David Okafor")
CONDITIONS=("Hypertension" "Diabetes" "Asthma"
for i in $ (seq 1 10); do
  ID="PHI-$(printf '%04d' $i)"
  Name="${NAMES[$((RANDOM % 3))]}"
  COND="${CONDITIONS[$((RANDOM % 3))]}"
  printf "ID: %s\nName: %s\nDiagnosis: %\n--\n" "$SID" "$NAME" "$COND" > "$OUTPUT/$ID.txt"
  echo "[+] Created $ID.txt"
done
echo "[+] done."
