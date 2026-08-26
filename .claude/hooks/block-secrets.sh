#!/usr/bin/env bash
# PreToolUse hook (matcher: Edit|Write)
# 秘匿情報パターンを含む書き込みを exit 2 でブロックする。
# 公開できない固有パターン（社名等）は同ディレクトリの secrets-patterns.local（gitignore 済み）に1行1正規表現で置く。

set -u

input=$(cat)

if command -v jq >/dev/null 2>&1; then
  content=$(printf '%s' "$input" | jq -r '
    [(.tool_input.content // ""),
     (.tool_input.new_string // ""),
     (.tool_input.file_path // "")] | join("\n")')
else
  content=$input
fi

patterns=(
  '\b[0-9]{12}\b'                 # AWS アカウント ID（12桁の数字列）
  'arn:aws[a-z-]*:[^:]*:[^:]*:[0-9]{6,}'  # アカウント ID 入りの ARN
  'AKIA[0-9A-Z]{16}'              # AWS アクセスキー ID
  '株式会社|合同会社|（株）|\(株\)'
)

local_file="$(dirname "$0")/secrets-patterns.local"
if [ -f "$local_file" ]; then
  while IFS= read -r p; do
    [ -n "$p" ] && patterns+=("$p")
  done < "$local_file"
fi

for p in "${patterns[@]}"; do
  if printf '%s' "$content" | grep -qE "$p"; then
    echo "block-secrets: 秘匿情報パターン（$p）に一致する内容の書き込みをブロックしました。実値・実名は書かず参照にしてください（canon.md / ROADMAP §7）。" >&2
    exit 2
  fi
done

exit 0
