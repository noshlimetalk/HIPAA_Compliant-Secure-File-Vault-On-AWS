#!/bin/bash

for f in ~/patient-vault/raw_records/*.txt; do
    name=$(basename "$f" .txt)
    openssl enc -aes-256-cbc -pbkdf2 -iter 100000 \
    -in "$f" \
    -out ~/patient-vault/encrypted_records/"$name" .enc \
    -pass pass:"vault123"


    echo "[+] Encrypted $name.enc"
done
echo "[+] done."
    
