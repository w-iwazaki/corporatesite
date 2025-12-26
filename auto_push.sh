#!/bin/bash

# corpsite フォルダのパス（絶対パス）
TARGET_DIR="/Users/vegekul-800/Desktop/corpsite"

cd "$TARGET_DIR" || exit

echo ""
echo "================================================"
echo "  Auto-push script started!"
echo "  Target: $TARGET_DIR"
echo "  Monitoring changes every 30 seconds..."
echo "  (Press Ctrl+C to stop)"
echo "================================================"
echo ""

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
