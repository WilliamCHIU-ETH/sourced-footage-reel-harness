#!/usr/bin/env bash
# 建立 HyperFrames 專案骨架並把素材與品牌資產放進去。
# 純機械步驟：不寫 index.html（那是 SKILL.md 步驟 6 的判斷工作）。
set -euo pipefail

# 釘定版本。ASSUMPTIONS.md 記的 HyperFrames 必踩規則是在這一版實測的；
# 換版必須重跑一次 VERIFY.md 全部項目，不可直接假設行為相同。
HF_VERSION="${HF_VERSION:-0.8.3}"
RUN_DIR=""; PROJECT_ID=""; LOGO=""; FONT_BOLD=""; FONT_REGULAR=""

usage() {
  cat <<'EOF'
用法：
  init-project.sh --run-dir <run_dir> --project-id <id> \
                  --logo <logo.png> --font-bold <bold.ttf> [--font-regular <regular.ttf>]
                  [--hf-version 0.8.3]

產出：<run_dir>/project/{package.json,assets/}
      assets/ 內含 logo.png 與字型；素材由 prep-footage.sh 另外寫入同一個 assets/
下一步：SKILL.md 步驟 6（以模板寫出 index.html）
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-dir) RUN_DIR="$2"; shift 2 ;;
    --project-id) PROJECT_ID="$2"; shift 2 ;;
    --logo) LOGO="$2"; shift 2 ;;
    --font-bold) FONT_BOLD="$2"; shift 2 ;;
    --font-regular) FONT_REGULAR="$2"; shift 2 ;;
    --hf-version) HF_VERSION="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "未知參數：$1" >&2; usage; exit 2 ;;
  esac
done

[[ -z "$RUN_DIR" ]]    && { echo "缺 --run-dir" >&2; exit 2; }
[[ -z "$PROJECT_ID" ]] && { echo "缺 --project-id" >&2; exit 2; }
[[ -z "$LOGO" ]]       && { echo "缺 --logo" >&2; exit 2; }
[[ -z "$FONT_BOLD" ]]  && { echo "缺 --font-bold" >&2; exit 2; }
for f in "$LOGO" "$FONT_BOLD" ${FONT_REGULAR:+"$FONT_REGULAR"}; do
  [[ -s "$f" ]] || { echo "找不到資產：$f" >&2; exit 1; }
done

PROJ="$RUN_DIR/project"
mkdir -p "$PROJ/assets"

# package.json 釘版，讓這支影片日後能以同一版重現
cat > "$PROJ/package.json" <<JSON
{
  "name": "$PROJECT_ID",
  "private": true,
  "scripts": {
    "lint": "hyperframes lint",
    "check": "hyperframes check",
    "render": "hyperframes render"
  },
  "devDependencies": {
    "hyperframes": "$HF_VERSION"
  }
}
JSON

cat > "$PROJ/meta.json" <<JSON
{ "id": "$PROJECT_ID", "name": "$PROJECT_ID" }
JSON

cp "$LOGO" "$PROJ/assets/logo.png"
cp "$FONT_BOLD" "$PROJ/assets/$(basename "$FONT_BOLD")"
[[ -n "$FONT_REGULAR" ]] && cp "$FONT_REGULAR" "$PROJ/assets/$(basename "$FONT_REGULAR")"

echo "── 專案骨架 ──"
echo "$PROJ"
echo "釘定 hyperframes@$HF_VERSION（所有 npx 呼叫都要帶這個版本）"
echo
echo "assets/："
ls -1 "$PROJ/assets"
echo
echo "模板要填的字型檔名："
echo "  FONT_BOLD_FILE=$(basename "$FONT_BOLD")"
[[ -n "$FONT_REGULAR" ]] && echo "  FONT_REGULAR_FILE=$(basename "$FONT_REGULAR")"
