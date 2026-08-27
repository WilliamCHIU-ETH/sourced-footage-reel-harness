#!/usr/bin/env bash
# 取得素材、把音軌正規化到目標響度、產生選鏡用的 contact sheet。
# 純機械步驟：不做任何判斷，選鏡與剪點由 SKILL.md 的文字步驟決定。
set -euo pipefail

FFMPEG="${FFMPEG:-ffmpeg}"
FFPROBE="${FFPROBE:-ffprobe}"
YTDLP="${YTDLP:-yt-dlp}"
LUFS="-16"
TP="-1.5"
SHEET_COLS=6
SHEET_ROWS=7
URL=""; LOCAL=""; REFERER=""; OUT=""; SHEET=""

usage() {
  cat <<'EOF'
用法：
  prep-footage.sh --out <assets 目錄> --sheet <shots 目錄> [--url <URL>|--local <檔案>]
                  [--referer <來源網站>] [--lufs -16]

Brightcove 等企業影片平台，--url 給標準播放器網址：
  https://players.brightcove.net/<account>/<player>_default/index.html?videoId=<video>

產出：<out>/footage.mp4、<out>/audio-normalized.m4a、<sheet>/contact-sheet.jpg
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --url) URL="$2"; shift 2 ;;
    --local) LOCAL="$2"; shift 2 ;;
    --referer) REFERER="$2"; shift 2 ;;
    --out) OUT="$2"; shift 2 ;;
    --sheet) SHEET="$2"; shift 2 ;;
    --lufs) LUFS="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "未知參數：$1" >&2; usage; exit 2 ;;
  esac
done

[[ -z "$OUT" || -z "$SHEET" ]] && { echo "缺 --out 或 --sheet" >&2; exit 2; }
[[ -z "$URL" && -z "$LOCAL" ]] && { echo "要給 --url 或 --local" >&2; exit 2; }

mkdir -p "$OUT" "$SHEET"
VIDEO="$OUT/footage.mp4"

# ── 1. 取得素材 ──────────────────────────────────────────────
if [[ -n "$LOCAL" ]]; then
  cp "$LOCAL" "$VIDEO"
else
  ARGS=(--socket-timeout 30 -f "bv*[height<=1080]+ba/b" -o "$VIDEO")
  [[ -n "$REFERER" ]] && ARGS+=(--referer "$REFERER")
  # 有些廠商官網的直鏈檔走 Cloudflare anti-bot，第一次會 403（ASSUMPTIONS 環境限制 9）。
  # 失敗就帶 generic:impersonate 重試一次——不需要憑證，也不是繞過存取控制。
  if ! "$YTDLP" "${ARGS[@]}" "$URL"; then
    echo "!! yt-dlp 失敗，帶 --extractor-args generic:impersonate 重試一次（見 ASSUMPTIONS 環境限制 9）" >&2
    rm -f "$VIDEO"
    "$YTDLP" "${ARGS[@]}" --extractor-args "generic:impersonate" "$URL"
  fi
fi
[[ -s "$VIDEO" ]] || { echo "素材下載失敗：$VIDEO 不存在或為空" >&2; exit 1; }

echo "── 素材規格 ──"
"$FFPROBE" -v error -show_entries format=duration,size,bit_rate \
  -show_entries stream=codec_type,codec_name,width,height,r_frame_rate \
  -of default=noprint_wrappers=1 "$VIDEO"

HAS_AUDIO=$("$FFPROBE" -v error -select_streams a -show_entries stream=codec_name -of csv=p=0 "$VIDEO" | head -1)
if [[ -z "$HAS_AUDIO" ]]; then
  echo "!! 素材沒有音軌，跳過正規化。成片會是靜音，SKILL.md 步驟 6 要據此調整。" >&2
else
  # ── 2. 音軌正規化（二階段）─────────────────────────────────
  # 素材響度通常遠低於發布標準而峰值已接近 0，直接加增益會削波，必須讓 loudnorm 的限幅器處理。
  echo "── loudnorm 第一階段（分析）──"
  MEASURED=$("$FFMPEG" -hide_banner -i "$VIDEO" \
    -af "loudnorm=I=${LUFS}:TP=${TP}:LRA=11:print_format=summary" -f null /dev/null 2>&1 || true)
  echo "$MEASURED" | grep -E "Input (Integrated|True Peak|LRA|Threshold)" || true

  M_I=$(echo "$MEASURED"      | awk '/Input Integrated/  {print $3}')
  M_TP=$(echo "$MEASURED"     | awk '/Input True Peak/   {print $4}')
  M_LRA=$(echo "$MEASURED"    | awk '/Input LRA/         {print $3}')
  M_THRESH=$(echo "$MEASURED" | awk '/Input Threshold/   {print $3}')
  [[ -z "$M_I" ]] && { echo "loudnorm 分析未取得 measured 值" >&2; exit 1; }

  echo "── loudnorm 第二階段（套用）──"
  "$FFMPEG" -hide_banner -y -i "$VIDEO" -vn \
    -af "loudnorm=I=${LUFS}:TP=${TP}:LRA=11:measured_I=${M_I}:measured_TP=${M_TP}:measured_LRA=${M_LRA}:measured_thresh=${M_THRESH}:linear=true:print_format=summary" \
    -c:a aac -b:a 192k "$OUT/audio-normalized.m4a" 2>&1 \
    | grep -E "Output (Integrated|True Peak)|Normalization Type" || true

  echo "── 正規化後實測 ──"
  "$FFMPEG" -hide_banner -i "$OUT/audio-normalized.m4a" -af volumedetect -f null /dev/null 2>&1 \
    | grep -E "mean_volume|max_volume"
fi

# ── 3. contact sheet（選鏡用）────────────────────────────────
DUR=$("$FFPROBE" -v error -show_entries format=duration -of csv=p=0 "$VIDEO")
CELLS=$((SHEET_COLS * SHEET_ROWS))
STEP=$(awk -v d="$DUR" -v c="$CELLS" 'BEGIN{s=d/c; if(s<1)s=1; printf "%.3f", s}')
"$FFMPEG" -v error -y -i "$VIDEO" \
  -vf "fps=1/${STEP},scale=300:-1,tile=${SHEET_COLS}x${SHEET_ROWS}" \
  -frames:v 1 "$SHEET/contact-sheet.jpg"

echo "── contact sheet ──"
echo "$SHEET/contact-sheet.jpg（每格間隔 ${STEP}s，共 ${CELLS} 格，素材長 ${DUR}s）"
echo "格號 n 對應素材時間 = (n-1) × ${STEP} 秒"
