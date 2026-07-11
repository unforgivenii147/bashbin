#!/data/data/com.termux/files/usr/bin/env bash
while IFS= read -r line; do
    # Skip empty lines if needed
    [[ -z "$line" ]] && continue
    srp "$line"
done < "$@"
