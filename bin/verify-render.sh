#!/usr/bin/env bash
# 成片機械驗證：解析度、時長、幀數、音訊存在、整體響度、逐段是否有聲。
# 判斷性的檢查（字幕內容、選鏡品質）不在這裡，見 VERIFY.md。
set -uo pipefail

FFMPEG="${FFMPEG:-ffmpeg}"
FFPROBE="${FFPROBE:-ffprobe}"
FILE=""; W=1080; H=1920; DUR=60; FPS=30; SHOT=6
VOL_MIN=-22; VOL_MAX=-16

usage() {
  cat <<'EOF'
用法：
  verify-render.sh <成片路徑> [--width 1080] [--height 1920]
                   [--duration 60] [--fps 30] [--shot-seconds 6]
EOF
}

[[ $# -lt 1 ]] && { usage; exit 2; }
FILE="$1"; shift
while [[ $# -gt 0 ]]; do
  case "$1" in
    --width) W="$2"; shift 2 ;;
    --height) H="$2"; shift 2 ;;
    --duration) DUR="$2"; shift 2 ;;
    --fps) FPS="$2"; shift 2 ;;
    --shot-seconds) SHOT="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "未知參數：$1" >&2; exit 2 ;;
  esac
done

[[ -s "$FILE" ]] || { echo "FAIL 檔案不存在或為空：$FILE" >&2; exit 1; }
FAILED=0
pass() { printf "PASS %-14s %s\n" "$1" "$2"; }
fail() { printf "FAIL %-14s %s\n" "$1" "$2"; FAILED=1; }

read -r AW AH < <("$FFPROBE" -v error -select_streams v:0 \
  -show_entries stream=width,height -of csv=p=0 "$FILE" | tr ',' ' ')
[[ "$AW" == "$W" && "$AH" == "$H" ]] \
  && pass 解析度 "${AW}x${AH}" || fail 解析度 "得到 ${AW}x${AH}，預期 ${W}x${H}"

AD=$("$FFPROBE" -v error -show_entries format=duration -of csv=p=0 "$FILE")
awk -v a="$AD" -v e="$DUR" 'BEGIN{exit !(a-e<0.1 && e-a<0.1)}' \
  && pass 時長 "${AD}s" || fail 時長 "得到 ${AD}s，預期 ${DUR}s"

AF=$("$FFPROBE" -v error -select_streams v:0 -show_entries stream=nb_frames -of csv=p=0 "$FILE")
EF=$(awk -v d="$DUR" -v f="$FPS" 'BEGIN{printf "%d", d*f}')
[[ "$AF" == "$EF" ]] && pass 幀數 "$AF" || fail 幀數 "得到 $AF，預期 $EF"

AC=$("$FFPROBE" -v error -select_streams a -show_entries stream=codec_name -of csv=p=0 "$FILE" | head -1)
[[ -n "$AC" ]] && pass 音訊串流 "$AC" \
  || fail 音訊串流 "沒有音訊串流。check 不檢查這項，成片會全靜音"

if [[ -n "$AC" ]]; then
  MV=$("$FFMPEG" -hide_banner -i "$FILE" -af volumedetect -f null /dev/null 2>&1 \
    | awk '/mean_volume/ {print $5}')
  awk -v v="$MV" -v lo="$VOL_MIN" -v hi="$VOL_MAX" 'BEGIN{exit !(v>=lo && v<=hi)}' \
    && pass 平均音量 "${MV} dB" \
    || fail 平均音量 "${MV} dB 落在 ${VOL_MIN}～${VOL_MAX} dB 之外"

  SILENT=""
  N=$(awk -v d="$DUR" -v s="$SHOT" 'BEGIN{printf "%d", d/s}')
  for ((i=0; i<N; i++)); do
    T=$(awk -v i="$i" -v s="$SHOT" 'BEGIN{printf "%.1f", i*s+1}')
    SV=$("$FFMPEG" -hide_banner -ss "$T" -t 4 -i "$FILE" -af volumedetect -f null /dev/null 2>&1 \
      | awk '/mean_volume/ {print $5}')
    if [[ -z "$SV" || "$SV" == "-inf" ]]; then SILENT="$SILENT ${T}s"; fi
  done
  [[ -z "$SILENT" ]] && pass 逐段有聲 "${N} 段全部有聲音" \
    || fail 逐段有聲 "以下時間點靜音：$SILENT"
fi

echo
[[ "$FAILED" -eq 0 ]] && echo "全部通過。判斷性檢查見 VERIFY.md，成片仍需使用者驗收（GATE 2）。" \
  || echo "有項目失敗：改 composition 後重 render，不要後製補救。"
exit "$FAILED"
