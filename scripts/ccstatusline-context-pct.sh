#!/bin/zsh
# ccstatusline custom-command widget: context-window % with threshold coloring.
# Reads the Claude Code statusline JSON from stdin, prints a colored "Ctx NN%".
# Quiet (dim) until 60%, yellow 60-74%, red >=75% so a full context is unmissable.
# Requires preserveColors:true on the widget so the ANSI below survives.

pct=$(python3 -c '
import sys, json
try:
    d = json.load(sys.stdin)
    p = d.get("context_window", {}).get("used_percentage")
    print(int(round(p)) if p is not None else -1)
except Exception:
    print(-1)
')

# No data yet (e.g. brand-new session) -> render nothing.
if [ "$pct" -lt 0 ]; then
  printf ""
  exit 0
fi

if [ "$pct" -ge 75 ]; then
  color=$'\033[1;91m'   # bold bright red
  icon="🔴 "
elif [ "$pct" -ge 60 ]; then
  color=$'\033[93m'     # bright yellow
  icon="🟡 "
else
  color=$'\033[90m'     # dim / bright black
  icon=""
fi
# Reset FOREGROUND + bold only (\033[22;39m). Never emit a full reset (\033[0m):
# with preserveColors, ccstatusline paints the powerline background for this
# block, and a full reset would clear it, leaving a gap in the bar.
reset=$'\033[22;39m'

printf "%s%sCtx %d%%%s" "$color" "$icon" "$pct" "$reset"
