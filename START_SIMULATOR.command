#!/bin/sh
cd "$(dirname "$0")" || exit 1
(sleep 1; if command -v open >/dev/null 2>&1; then open "http://127.0.0.1:8765/index.html"; elif command -v xdg-open >/dev/null 2>&1; then xdg-open "http://127.0.0.1:8765/index.html"; fi) &
python3 -m http.server 8765 --bind 127.0.0.1
