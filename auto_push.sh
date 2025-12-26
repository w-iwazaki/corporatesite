#!/bin/bash

# corpsite フォルダのパス（絶対パス）
TARGET_DIR="/Users/vegekul-800/Desktop/corpsite"

cd "$TARGET_DIR" || exit

echo "Auto-push script started for $TARGET_DIR"
echo "Monitoring changes... (Press Ctrl+C to stop)"

while true; do
    if [[ -n $(git status -s) ]]; then
        echo "Changes detected at $(date)"
        git add .
        git commit -m "Auto-commit: $(date)"
        git push origin main
        echo "Pushed to GitHub."
    fi
    sleep 30
done
