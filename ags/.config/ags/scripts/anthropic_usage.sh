#!/usr/bin/env bash
# Fetch Anthropic API rate-limit utilization.
# Reads ANTHROPIC_API_KEY from env, or from ~/.config/ags/cache/anthropic_key.
# Outputs a single line of JSON consumed by the AnthropicUsage bar component.

API_KEY="${ANTHROPIC_API_KEY:-$(cat "$HOME/.config/ags/cache/anthropic_key" 2>/dev/null | tr -d '[:space:]')}"

if [ -z "$API_KEY" ]; then
  printf '{"error":"no_api_key","tl":0,"tr":0,"rl":0,"rr":0,"reset":""}\n'
  exit 0
fi

HEADERS=$(curl -s -D - -o /dev/null \
  --max-time 10 \
  -H "x-api-key: $API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  "https://api.anthropic.com/v1/models" 2>/dev/null)

if [ -z "$HEADERS" ]; then
  printf '{"error":"network","tl":0,"tr":0,"rl":0,"rr":0,"reset":""}\n'
  exit 0
fi

get_num() {
  printf "%s" "$HEADERS" | grep -i "${1}:" | grep -oP '\d+' | head -1
}

TL=$(get_num "anthropic-ratelimit-tokens-limit")
TR=$(get_num "anthropic-ratelimit-tokens-remaining")
RL=$(get_num "anthropic-ratelimit-requests-limit")
RR=$(get_num "anthropic-ratelimit-requests-remaining")
RS=$(printf "%s" "$HEADERS" | grep -i "anthropic-ratelimit-tokens-reset:" | awk '{print $2}' | tr -d $'\r\n')

printf '{"error":null,"tl":%s,"tr":%s,"rl":%s,"rr":%s,"reset":"%s"}\n' \
  "${TL:-0}" "${TR:-0}" "${RL:-0}" "${RR:-0}" "${RS}"
