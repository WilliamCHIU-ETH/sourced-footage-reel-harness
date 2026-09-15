# GTA VI canonical fresh-run production plan

- artifact：`gta-production-plan`
- artifact 版本：`v0.5`（F-01～F-08 fixes 保持；canonical interest 更新為 v0.4 PASS）
- review basis：`exploration/2026-08-30-gta-preproduction-review.md v0.1`（另保留早期 `gta-production-plan-review v0.1`）
- editorial refs：`gta-gate-and-story-package v0.5`、`gta-gate-evidence-supplement v0.3`、`gta-editorial-brief v0.4`、`gta-visual-preflight v0.4`、`gta-interest-proxy-v0.4-measurement v0.1`
- 日期：`2026-08-30`
- 適用 Gate：`editorial-gate v0.1`
- execution 狀態：**PLAN_ONLY／NOT_RUN**
- reviewer ready：`true`
- reviewer approval：`PENDING_FOCUSED_RECHECK`
- fresh run authorized：`false`
- 唯一題材：`GTA VI — An Extended Look`
- 既有第一方頁：`https://www.rockstargames.com/VI/an-extended-look`

## 1. Render hard stop 與目前狀態

`exploration/2026-08-30-gta-gate-and-story-package.md` 的可回查結果是：

| Gate 項目 | GTA VI 狀態 |
|---|---|
| `freshness` | `PASS` |
| `why_now` | `PASS` |
| `audience_payoff` | `PASS` |
| `interest_signals` | `PASS` |
| `visual_source_fit` | `PASS` |
| overall | `PASS` |
| `publication_hold` | `true` |
| Story Package | `FORMAL_EDITORIAL_GATE_PASS`；`exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05` |
| `reviewer_ready` | `true` |
| `fresh_run_authorized` | `false` |

F-01～F-08 的 preproduction fixes 與 v0.4 interest evidence 已可供 focused review；五項 Gate 已閉合，但既有 reviewer decision 仍是 `REVIEW_HOLD`。因此本 plan **仍不得執行 init、下載、ffmpeg、snapshot 或 render**；目前唯一 editorial hard stop 是 focused reviewer 尚未明確核准 fresh run，而不是 Gate 或 publication rights。

內部 GATE 2 preview 開始 production 前必須同時滿足：

1. 五項 Gate 全為 `PASS`，且 `overall_status: PASS`；canonical v0.5 已滿足，fresh run 凍結時仍須由 M1 重播。
2. 非空、版本化的正式 Story Package、interest evidence ref 與 visual evidence ref；canonical v0.5 已滿足，run_dir serialization 仍須 hash／identity binding。
3. GATE 1 預授權的 stable footage ID、官方 URL、Story Package、fixed active ranges 與 inputs 完全相符。
4. 權利狀態可維持 `rights_status: UNKNOWN`、`publication_hold: true`；只有直接證據明確禁止本次 internal preview 時才阻擋。
5. focused reviewer 明確寫出 `REVIEW_PASS_FOR_FRESH_RUN`；`reviewer_ready:true` 只表示可送審，不能替代核准。

商用或對外公開權利不屬於五項 Editorial Gate，也不是 internal preview 的隱性第六項；它留在使用者通過 GATE 2 後的獨立 release check。

## 2. Canonical inputs 與 Story Package 必要欄位

### 2.1 Story Package

Focused reviewer 明確核准 fresh run 後，才可把 formal package 序列化到 run_dir 的 `story-package.json`；至少包含 Editorial Gate contract 的欄位與本次 production 延伸欄位：

```yaml
package_id: gta-vi-extended-look-20260830
package_version: v0.5
gate_version: v0.1
selected_at: 2026-08-30T21:24:13.666+08:00
gate_evaluation_ref: exploration/2026-08-30-gta-gate-and-story-package.md v0.5#2-五項-gate-evaluation
story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05
interest_evidence_ref: exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md v0.1
visual_evidence_ref: exploration/2026-08-30-gta-visual-preflight.md v0.4#9-active-selected-set-final-disposition
reviewer_ready: true
reviewer_approval: PENDING_FOCUSED_RECHECK
fresh_run_authorized: false
topic: GTA VI An Extended Look
one_sentence_angle: <已由 claim ledger 支持的角度>
why_now: <本次 state change>
audience_payoff: <一般科技／遊戲觀眾的具體 payoff>
story_type: product_showcase
claim_ledger:
  - claim_id: <stable id>
    original_text: <source text>
    allowed_zh_hant: [<可用中文表述>]
    source_url: <public source URL>
    source_published_at: <timestamp|null>
    status: confirmed|inferred|unknown
    first_party_claim: true|false
    required_attribution: <文字|null>
    prohibited_inferences: []
production_claim_whitelist:
  - claim_id: <只可引用 status 非 unknown 的 claim>
    production_allowed: true
    required_attribution: <文字|null>
    approved_uses:
      - {slot: headline-01|caption-01, text: <完整核准文字>}
footage_candidates:
  - stable_footage_id: RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P
    official_footage_page: https://www.rockstargames.com/VI/an-extended-look
    publisher: Rockstar Games
    acquisition_route: official_direct_url
    executable_url: https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4
    expected_content_length: 1980545083
    expected_source_sha256: null
    duration_seconds: 1608.066667
    width: 1920
    height: 1080
    source_r_frame_rate: 30/1
    source_avg_frame_rate: 30/1
    audio_status: PRESENT
    public_obtainability: CONFIRMED
    visual_mapping:
      ref: exploration/2026-08-30-gta-visual-preflight.md#9-active-selected-set-final-disposition
      status: PASS
      active_ranges: [S1, S2, S3, S4, S5]
    execution_risks: [full_download_hash_pending, non_graphic_content_cautions]
interest_basis: v0.4 candidate comment-count 1061 / comparator median 371 = 2.8598382749326148x; two distinct parent owners in fixed 48h window; convenience-set/post-age/live-entry limitations retained
content_boundaries: []
open_gate_unknowns: []
release_unknowns: [publication_rights]
publication_rights:
  intended_use: INTERNAL_GATE2_PREVIEW
  rights_status: UNKNOWN
  internal_preview_explicitly_prohibited: null
  evidence_refs: []
  scope: null
  approved_at: null
publication_hold: true
post:
  platform: <target platform>
  caption_zh_hant: <貼文正文>
  source_disclosure: <Rockstar attribution + source URL>
  claim_disclosure: <第一方主張邊界>
  hashtags: []
harness_handoff:
  duration_seconds: 60
  shot_seconds: 6
  caption_seconds: 3
  width: 1080
  height: 1920
  fps: 30
  target_lufs: -16
  required_credit_text: 影片來源：Rockstar Games
```

上列 canonical mapping 只把現有證據直接支持的值寫死；角度、payoff 與文案必須逐字取自 formal claim whitelist。進 internal-preview production 前必須維持 `open_gate_unknowns: []`；`release_unknowns` 可保留 `publication_rights`，並維持 `publication_hold: true`。`expected_source_sha256` 尚無可信值，不可捏造；第一次完整取得後把實際 hash 寫入 acquisition evidence／provenance，後續重跑再以它比對。

### 2.2 `inputs.json`

從 `fixtures/inputs.minimal.json` 建立，不從 `fixtures/inputs.example.json` 抄題材。為可重現性，最終 inputs 明填 schema 的所有 production 值：

| inputs 路徑 | GTA VI 的落點 |
|---|---|
| `run_dir` | 本文件第 4 節的 timestamped 絕對路徑 |
| `source_document.path` | `<run_dir>/source.md`；凍結 Gate 通過後可用的來源原文與 claim IDs |
| `source_document.date_label` | `20260827`；只用於命名，不作 freshness 證據 |
| `topic.name` | `gta-vi-extended-look` |
| `topic.tag` | `GTA VI`；畫面右下題材標籤，不是素材發布者 |
| `topic.facts[]` | Story Package `production_claim_whitelist` 中 `production_allowed=true`、status 非 unknown、用語與歸因已核准的事實 |
| `footage` | 只放 GATE 1 預授權 stable ID 對應的 Rockstar 官方 direct URL，見第 3 節；rights UNKNOWN 不改變素材 identity |
| `brand.*` | 既有 logo／Noto Sans TC 絕對路徑與既有配色 |
| `content.headline` | 恰三行固定大標；由 Story Package angle／claim ledger 寫成 |
| `content.captions` | 恰 20 段，每段 1–2 行；只能取自 `topic.facts`／官方畫面可客觀讀取規格 |
| `content.shots` | 固定為第 2.3 節 10 個 `media_start`，每段 6 秒；下載後只重播 QA，不重新選點 |
| `output` | `60 / 6 / 3 / 1080 / 1920 / 30 / -16` 全部明填 |

既有 canonical brand paths：

```text
logo_path=/Users/chiu/Developer/marketing-video/data/assets/台股晨報/cmoney-logo-white.png
font_bold_path=/Users/chiu/Developer/marketing-video/data/assets/fonts/NotoSansTC-Bold.ttf
font_regular_path=/Users/chiu/Developer/marketing-video/data/assets/fonts/NotoSansTC-Regular.ttf
```

### 2.3 Fixed active selected source ranges

Canonical references：

- Gate：`exploration/2026-08-30-gta-gate-and-story-package.md v0.5`（overall PASS；formal ref `#formal-story-package-v05`）
- Interest：`exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md v0.1`
- Editorial copy：`exploration/2026-08-30-gta-editorial-brief.md v0.4`
- Visual evidence：`exploration/2026-08-30-gta-visual-preflight.md v0.4#9-active-selected-set-final-disposition`

| Section | Timeline | Source 12 秒 range | Evidence | Result |
|---|---:|---|---|---|
| `S1` | `0–12` | `00:03:32.500–00:03:44.500` | `primary-b01/S1-strip.jpg` | PASS |
| `S2` | `12–24` | `00:24:15.000–00:24:27.000` | `fallback-b02/S2-R1-strip.jpg` | PASS |
| `S3` | `24–36` | `00:17:22.000–00:17:34.000` | `fallback-b02/S3-R1-strip.jpg` | PASS |
| `S4` | `36–48` | `00:06:24.000–00:06:36.000` | `fallback-b02/S4-R1-strip.jpg` | PASS |
| `S5` | `48–60` | `00:23:14.000–00:23:26.000` | `primary-b01/S5-strip.jpg` | PASS |

每個 range 拆成相鄰兩個 6 秒 shot，`inputs.content.shots[].media_start` 依 timeline order 固定為：

```json
[212.5, 218.5, 1455.0, 1461.0, 1042.0, 1048.0, 384.0, 390.0, 1394.0, 1400.0]
```

不得在 fresh run 重新挑點或改用 primary-b01 的 S2／S3／S4。完整下載後 P3 只重播本地三幀 strip QA；若 frozen asset 與 E11 畫面不一致則停止，不自行換點。

## 3. GTA 官方長影片、字幕、標題與貼文的實際落點

### 3.1 官方長影片

`exploration/2026-08-30-gta-technical-preflight.md` 已以單次 ffprobe 確認 Rockstar 第一方 direct MP4：H.264、1920×1080、`r_frame_rate=30/1`、`avg_frame_rate=30/1`、1608.066667 秒，且有 AAC stereo 48 kHz。canonical selection 固定為：

- stable footage ID：`RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P`
- official URL：`https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4`
- official page：`https://www.rockstargames.com/VI/an-extended-look`
- expected content length（呼叫方 HEAD）：`1,980,545,083 bytes`
- expected SHA-256：`UNKNOWN`，第一次完整取得後才凍結；不得用假值補齊

canonical inputs 不提供 local-path 替代路徑；若要換 local file，必須重新產生 selection artifact 並取得新的 GATE 1 授權。inputs 固定為：

```json
{
  "footage": {
    "url": "https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4",
    "referer": "https://www.rockstargames.com/VI/an-extended-look",
    "publisher": "Rockstar Games",
    "source_page": "https://www.rockstargames.com/VI/an-extended-look",
    "credit_text": "影片來源：Rockstar Games"
  }
}
```

不得改成 YouTube、任意 local file、其他語系／解析度 asset，也不得保留 signed query、cookie、Authorization 或 token。rights UNKNOWN 只控制 publication hold，不改寫已預授權的素材 identity。素材經 `prep-footage.sh` 後固定落在：

- `<run_dir>/project/assets/footage.mp4`
- `<run_dir>/project/assets/audio-normalized.m4a`
- `<run_dir>/shots/contact-sheet.jpg`

### 3.2 字幕與三行大標

- 事實白名單：`claim_ledger[]` 先排除 `status=unknown`，再由 `production_claim_whitelist[]` 核准完整輸出文字與必要歸因，才可進 `source.md`／`inputs.json.topic.facts[]`。
- 三行大標：`production_claim_whitelist.approved_uses` → `inputs.json.content.headline[0..2]` → `project/index.html` 的 `HEADLINE_LINE_1..3`。
- 20 段字幕：同一 whitelist → `inputs.json.content.captions[0..19].lines[]` → `project/index.html` 的 `cap-01..20`。
- `fact-map.json` 必須同時覆蓋 `headline-01..03` 與 `caption-01..20` 共 23 個 slot，逐項記完整文字、claim IDs、歸因與 `fact_review_status=PASS`；不以 agent 完成狀態代替來源證據。
- GTA 畫面若含燒錄英文字幕，必須在 snapshot 判斷是否碰撞；不可預設沿用上一支成片的 300 px scrim，必要變更只能寫在本 run 的 `project/index.html`。

### 3.3 貼文資訊

`inputs.schema.json` 根物件與 `content` 都是 `additionalProperties: false`，沒有社群貼文欄位。因此：

- canonical 貼文資料放 `story-package.json.post`。
- paste-ready 版本輸出 `<run_dir>/POST.md`。
- 不把 `post`、hashtags 或平台描述塞進 `inputs.json`。
- `POST.md` 的 factual claims 必須能回指 `claim_ledger`；公開日期、觀看數與觀眾反應不得在出片前寫成 observed outcome。

## 4. 建議 run_dir 與預期 artifacts

建議 root：

```text
/Users/chiu/Developer/sourced-footage-reel-runs/w14-2026-08-30-gta-vi
```

每次執行使用新的絕對路徑：

```text
/Users/chiu/Developer/sourced-footage-reel-runs/w14-2026-08-30-gta-vi/run-<EXECUTION_START_UTC_YYYYMMDDTHHMMSSZ>
```

開始前把 placeholder 換成一次性的 UTC timestamp 並凍結；不得重用舊 run、不得寫進 harness。若 root 屆時仍不存在也照樣使用 timestamp child。

| 預期 artifact | 產生時點／用途 |
|---|---|
| `gate-evaluation.json` | production 前；五項 PASS 的可重算 Gate artifact |
| `story-package.json` | production 前；版本化角度、claim、footage、interest、rights、post handoff |
| `source.md` | production 前；凍結來源原文、URL、timestamp、claim IDs |
| `candidates.json` | GATE 1 preflight；符合 `$defs.candidate` 的官方素材候選與 probe |
| `selection.json` | GATE 1 預授權 stable ID、official route locator、expected content length/hash，及第 2.3 節 fixed active ranges／visual evidence ref |
| `acquisition-evidence.json` | 首次完整取得後的 actual byte size、SHA-256 與 stable ID；後續取得必須比對 |
| `inputs.json` | canonical harness input；footage URL 必須與 selection／Story Package 相同 |
| `fact-map.json` | 三行 headline＋20 段字幕共 23 個 slot 與 whitelist claim IDs 對應 |
| `POST.md` | 貼文正文、來源揭露、hashtags；不進 inputs |
| `commands.log` | 所有實際 command 原文；含 canonical verifier exact tee pipeline；計畫文字不能冒充執行紀錄 |
| `exit-status.tsv` | 每個實際 step、exit code、摘要；含 verifier 原始 exit／tee exit；失敗不得刪除 |
| `logs/verify-render-canonical.log` | final preview 的 REQUIRED canonical stdout/stderr；一次性、不可覆寫 |
| `execution-audit.md` | deviations、retries、unknowns、停止理由 |
| `project/package.json` | `hyperframes: 0.8.3` pin |
| `project/meta.json` | project ID |
| `project/assets/logo.png`、兩個字型 | `init-project.sh` 複製的 brand assets |
| `project/assets/footage.mp4` | 單一 GTA 官方長影片的 frozen local copy |
| `project/assets/audio-normalized.m4a` | 兩階段 loudnorm 後音軌 |
| `shots/contact-sheet.jpg` | `prep-footage.sh` 產生的選鏡 sheet |
| `shots/window-strips-rNN-b01/`、`b02/` | immutable round，兩批各五張；每張含 fixed 六秒窗口的三個中央裁切取樣幀；不符即停止、不得換點 |
| `project/index.html` | template 填值後的唯一 composition |
| `project/snapshots/caption-rNN-b01/` … `b04/` | 每輪四批各五個 caption midpoint snapshots；新 round 不覆寫舊 round |
| `project/snapshots/transition-rNN-{before,at,after}/` | render 前五 events × 三 phases；三批各五張、immutable |
| `visual-qa.md` | 每張 snapshot evidence＋S1/S2/S4/S5 machine-readable safety fields |
| `transition-qa.md` | render 前／後 T12/T24/T33/T36/T48 visual、audio、listening 與 PASS／FAIL ledger |
| `render-attempts/rNN/preview.mp4` | immutable render attempt；失敗／舊 attempt 不覆寫 |
| `final-preview-selection.tsv` | 唯一 promoted attempt、attempt/final path 與 SHA-256 |
| `preview.mp4` | hard stop 全解後一次性 promotion 的唯一 final internal preview |
| `qa/render-metadata.json` | 成片解析度、時長、幀數、streams |
| `qa/render-volumedetect.log` | 全片 mean volume |
| `qa/segment-audio-b01.tsv`、`b02.tsv` | 兩批各五段音訊驗證 |
| `qa/rendered-midpoints-rNN/` | immutable 成片五張代表幀 |
| `qa/transition-rNN/` | final before/at/after 15 張＋五個 WAV／astats logs／TSV |
| `qa/post-render-qa.md` | 機械／frame QA＋S1/S2/S4/S5 safety fields＋`publication_hold:true` |
| `qa/final-sha256-b01.txt` | 最多五個 canonical artifact 的 hashes |
| `PROVENANCE.md` | 素材、取得方式、實測規格、sha256、source `r_frame_rate`／`avg_frame_rate`、output fps、rights 狀態 |

## 5. GATE 1 預授權後仍必須通過的 machine-verifiable checks

以下都是 blocking checks；預期 exit code 均為 `0`。任一非零都停止，不自行換題、換素材或 render。

### M1. Gate 與 Story Package closure

```bash
OMP_THREAD_LIMIT=1 nice -n 19 jq -e '
  .gate_version == "v0.1" and
  .overall_status == "PASS" and
  ([.criteria.freshness.status,
    .criteria.why_now.status,
    .criteria.audience_payoff.status,
    .criteria.interest_signals.status,
    .criteria.visual_source_fit.status] | all(. == "PASS")) and
  (.story_package_ref | type == "string" and length > 0)
' "$RUN_DIR/gate-evaluation.json"
```

預期：focused reviewer 授權後的新 run 將 canonical v0.5 Gate／formal package 序列化，M1 exit `0`。本輪沒有 run_dir，所以 M1 是 `NOT_RUN`；不得用 Markdown PASS 取代 run-scoped JSON、hash 與 identity binding。

### M2. Internal-preview rights boundary（不是 commercial clearance）

```bash
OMP_THREAD_LIMIT=1 nice -n 19 jq -e '
  .gate_version == "v0.1" and
  (.open_gate_unknowns | length == 0) and
  (.publication_rights.intended_use == "INTERNAL_GATE2_PREVIEW") and
  (.publication_rights.internal_preview_explicitly_prohibited != true) and
  (((.publication_rights.rights_status == "UNKNOWN") and (.publication_hold == true)) or
   ((.publication_rights.rights_status == "CONFIRMED_FOR_INTENDED_USE") and (.publication_hold == false)))
' "$RUN_DIR/story-package.json"
```

預期：exit `0`。`UNKNOWN + publication_hold:true` 合法進 internal preview；只有直接證據明確禁止該內部用途才 exit `1`。商用公開 clearance 不在 M2，移至 GATE 2 後 release check。法律／權利結論必須由直接 policy／license 證據支持，不能由 agent、pane 或下載成功狀態代替。

### M3. 官方素材 technical preflight

```bash
OMP_THREAD_LIMIT=1 nice -n 19 jq -e '
  [.footage_candidates[] |
    select(.stable_footage_id == "RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P") |
    select(.publisher == "Rockstar Games") |
    select(.official_footage_page == "https://www.rockstargames.com/VI/an-extended-look") |
    select(.acquisition_route == "official_direct_url") |
    select(.executable_url == "https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4") |
    select(.expected_content_length == 1980545083) |
    select(.duration_seconds == 1608.066667) |
    select(.width == 1920 and .height == 1080) |
    select(.source_r_frame_rate == "30/1" and .source_avg_frame_rate == "30/1") |
    select(.audio_status == "PRESENT") |
    select(.public_obtainability == "CONFIRMED")
  ] | length == 1
' "$RUN_DIR/story-package.json"
```

預期：exit `0`。stable ID、official URL、content length、metadata、音訊或取得性任一不符即 exit `1`。

### M4a. Init 前 selection／Story Package／inputs identity binding

```bash
OMP_THREAD_LIMIT=1 nice -n 19 python3 - \
  "$RUN_DIR/selection.json" "$RUN_DIR/story-package.json" "$RUN_DIR/inputs.json" "$RUN_DIR" <<'PY'
import json, sys
sel, story, inputs = [json.load(open(p)) for p in sys.argv[1:4]]
run = sys.argv[4]
stable = 'RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P'
url = 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4'
page = 'https://www.rockstargames.com/VI/an-extended-look'
visual_ref = 'exploration/2026-08-30-gta-visual-preflight.md#9-active-selected-set-final-disposition'
fixed = [212.5, 218.5, 1455.0, 1461.0, 1042.0, 1048.0, 384.0, 390.0, 1394.0, 1400.0]
assert sel['gate1_preauthorized'] is True
assert sel['stable_footage_id'] == stable
assert sel['route_type'] == 'official_direct_url' and sel['route_locator'] == url
assert sel['expected_content_length'] == 1980545083
assert sel['visual_evidence_ref'] == visual_ref and sel['active_shot_starts'] == fixed
matches = [f for f in story['footage_candidates'] if f['stable_footage_id'] == stable]
assert len(matches) == 1 and matches[0]['executable_url'] == url
assert matches[0]['visual_mapping']['ref'] == visual_ref and matches[0]['visual_mapping']['status'] == 'PASS'
assert inputs['run_dir'] == run and inputs['source_document']['path'] == run + '/source.md'
assert inputs['topic']['name'] == 'gta-vi-extended-look' and inputs['topic']['tag'] == 'GTA VI'
assert inputs['topic']['facts']
assert inputs['footage']['url'] == url and 'local_path' not in inputs['footage']
assert inputs['footage']['publisher'] == 'Rockstar Games'
assert inputs['footage']['source_page'] == page
assert [s['media_start'] for s in inputs['content']['shots']] == fixed
assert inputs['output'] == {'duration_seconds':60, 'shot_seconds':6, 'caption_seconds':3,
                            'width':1080, 'height':1920, 'fps':30, 'target_lufs':-16}
print('PASS selection/story/inputs stable footage binding')
PY
```

預期：exit `0`。另以 `python3 -m json.tool` 分別驗三個 JSON syntax，預期皆 exit `0`。任何不同 URL／local file／stable ID 都不能通過。

### M4b. 選鏡與文案完成後的 cardinality

```bash
OMP_THREAD_LIMIT=1 nice -n 19 jq -e '
  (.content.headline | length == 3) and
  (.content.captions | length == 20) and
  (all(.content.captions[]; (.lines | length >= 1 and length <= 2))) and
  (.content.shots | length == 10) and
  (all(.content.shots[]; (.media_start | type == "number" and . >= 0)))
' "$RUN_DIR/inputs.json"
```

預期：exit `0`；這項在 P3 選鏡與字幕完成後、P4 composition 前執行，不是 init 前置條件。

### M5. Source／brand files

四個非空檔案：

```bash
for f in \
  "$RUN_DIR/source.md" \
  '/Users/chiu/Developer/marketing-video/data/assets/台股晨報/cmoney-logo-white.png' \
  '/Users/chiu/Developer/marketing-video/data/assets/fonts/NotoSansTC-Bold.ttf' \
  '/Users/chiu/Developer/marketing-video/data/assets/fonts/NotoSansTC-Regular.ttf'; do
  test -s "$f" || exit 1
done
```

預期：exit `0`。canonical selection 禁止未經新 GATE 1 授權的 local route。

### M6. Headline／caption facts、密度與 production claim whitelist

```bash
OMP_THREAD_LIMIT=1 nice -n 19 python3 - "$RUN_DIR/inputs.json" "$RUN_DIR/story-package.json" "$RUN_DIR/fact-map.json" <<'PY'
import json, sys
inputs, story, fmap = [json.load(open(p)) for p in sys.argv[1:]]
head = inputs['content']['headline']; caps = inputs['content']['captions']
assert len(head) == 3 and len(caps) == 20 and len(inputs['content']['shots']) == 10
chars = sum(len(''.join(c['lines']).replace(' ', '')) for c in caps)
cps = chars / inputs['output']['duration_seconds']; assert 4 <= cps <= 5, cps
ledger = {c['claim_id']: c for c in story['claim_ledger']}
white = {c['claim_id']: c for c in story['production_claim_whitelist']}
assert white and all(c['production_allowed'] and ledger[i]['status'] != 'unknown' for i,c in white.items())
rows = fmap['headlines'] + fmap['captions']; assert len(rows) == 23
assert [r['slot'] for r in fmap['headlines']] == [f'headline-{i:02d}' for i in range(1,4)]
assert [r['slot'] for r in fmap['captions']] == [f'caption-{i:02d}' for i in range(1,21)]
actual = {f'headline-{i+1:02d}': head[i] for i in range(3)}
actual.update({f'caption-{i+1:02d}': '\n'.join(caps[i]['lines']) for i in range(20)})
for r in rows:
    assert r['fact_review_status'] == 'PASS' and r['text'] == actual[r['slot']] and r['claim_ids']
    for cid in r['claim_ids']:
        assert cid in white
        assert {'slot': r['slot'], 'text': r['text']} in white[cid]['approved_uses']
        attr = white[cid].get('required_attribution')
        assert not attr or attr in r['text']
print(f'PASS headlines=3 captions=20 shots=10 density={cps:.2f} whitelist-slots=23')
PY
```

預期：exit `0`。`status=unknown`、未列入 `approved_uses`、缺必要歸因或三行 headline 未 mapping 都會失敗；此外仍保留逐項人工事實 review，不以 agent 狀態取代。

## 6. 本機批次與執行規則

1. `<=5` 限定於資源型 media operations：download、遠端 media probe、ffmpeg window、snapshot、render artifact 與 media hash；不以一個 shell loop 掩蓋十個 media items。純文字／JSON schema、cardinality、claim mapping 可一次讀完整 artifact，不計 media-item batch。
2. 所有資源工作使用 `OMP_THREAD_LIMIT=1 nice -n 19`；ffmpeg 額外用 `-threads 1`；HyperFrames render 固定 `--workers 1`。
3. 每個 batch 必須先在可見 pane 宣告 item 數、輸入與輸出；不得背景執行、不得加 `&`、不得藏在不可見 pane。
4. 每個實際 command 原文寫 `commands.log`，step 與 exit code 寫 `exit-status.tsv`；失敗、retry 與舊 snapshots 全保留。
5. 一次只處理一支 Rockstar 官方長影片；不得多素材混剪、不得生成畫面、不得補通用 B-roll。
6. 對唯一 final `preview.mp4` 執行一次 `bin/verify-render.sh` 是 post-render **REQUIRED**，整支成片計為一個 external media operation／一個 media item；script 內對同檔的 sequential subchecks 不另算十項。第 8 節兩批各五個補充音訊 QA 必須保留，但不能取代 canonical verifier。

## 7. Canonical fresh-run 命令（全部 PLAN_ONLY／NOT_RUN）

下列 syntax 依現有 scripts 與既有 canonical run；它們在 GTA run 的執行狀態全部是 `NOT_RUN`，既有其他題材的 exit `0` 不能當 GTA 證據。

### P0. 固定環境

```bash
export HARNESS='/Users/chiu/Developer/sourced-footage-reel-harness'
export RUN_DIR='/Users/chiu/Developer/sourced-footage-reel-runs/w14-2026-08-30-gta-vi/run-<EXECUTION_START_UTC_YYYYMMDDTHHMMSSZ>'
export INPUTS="$RUN_DIR/inputs.json"
export HF_VERSION='0.8.3'
```

計畫狀態：`NOT_RUN`。執行前必須先把 timestamp placeholder 換成實值。

### P1. 建專案骨架

M1、M2、M3、M4a、M5 全部 exit `0` 後才可執行；M4b 與 M6 要等下載後完成選鏡／文案才執行：

```bash
LC_ALL=C OMP_THREAD_LIMIT=1 nice -n 19 "$HARNESS/bin/init-project.sh" \
  --run-dir "$RUN_DIR" \
  --project-id 'gta-vi-extended-look-20260827' \
  --logo '/Users/chiu/Developer/marketing-video/data/assets/台股晨報/cmoney-logo-white.png' \
  --font-bold '/Users/chiu/Developer/marketing-video/data/assets/fonts/NotoSansTC-Bold.ttf' \
  --font-regular '/Users/chiu/Developer/marketing-video/data/assets/fonts/NotoSansTC-Regular.ttf' \
  --hf-version "$HF_VERSION"
```

預期：exit `0`；產生 `project/package.json`、`meta.json` 與最多三個 brand assets。接著：

```bash
OMP_THREAD_LIMIT=1 nice -n 19 jq -e \
  --arg v "$HF_VERSION" '.devDependencies.hyperframes == $v' \
  "$RUN_DIR/project/package.json"
```

預期：exit `0`。

### P2. 取得 GATE 1 綁定的單一官方素材

```bash
set -euo pipefail
STABLE='RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P'
EXPECTED_URL='https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4'
URL="$(jq -r '.footage.url' "$INPUTS")"
REFERER="$(jq -r '.footage.referer // empty' "$INPUTS")"
test "$URL" = "$EXPECTED_URL"
LC_ALL=C OMP_THREAD_LIMIT=1 nice -n 19 "$HARNESS/bin/prep-footage.sh" \
  --url "$URL" --referer "$REFERER" --lufs '-16' \
  --out "$RUN_DIR/project/assets" --sheet "$RUN_DIR/shots"
test -s "$RUN_DIR/project/assets/footage.mp4"
test -s "$RUN_DIR/project/assets/audio-normalized.m4a"
test -s "$RUN_DIR/shots/contact-sheet.jpg"
SIZE="$(stat -f '%z' "$RUN_DIR/project/assets/footage.mp4")"
test "$SIZE" -eq 1980545083
SHA="$(shasum -a 256 "$RUN_DIR/project/assets/footage.mp4" | awk '{print $1}')"
SELECTED_SHA="$(jq -r '.expected_source_sha256 // empty' "$RUN_DIR/selection.json")"
if [ -n "$SELECTED_SHA" ]; then test "$SHA" = "$SELECTED_SHA"; fi
if [ -e "$RUN_DIR/acquisition-evidence.json" ]; then
  jq -e --arg id "$STABLE" --arg url "$URL" --arg sha "$SHA" --argjson size "$SIZE" \
    '.stable_footage_id==$id and .route_locator==$url and
     .actual_content_length==$size and .actual_sha256==$sha' \
    "$RUN_DIR/acquisition-evidence.json"
else
  OMP_THREAD_LIMIT=1 nice -n 19 python3 - "$RUN_DIR/acquisition-evidence.json" "$STABLE" "$URL" "$SIZE" "$SHA" <<'PY'
import json, sys
p, stable, url, size, sha = sys.argv[1:]
json.dump({'stable_footage_id': stable, 'route_locator': url,
           'actual_content_length': int(size), 'actual_sha256': sha},
          open(p, 'x'), ensure_ascii=False, indent=2)
open(p, 'a').write('\n')
PY
fi
```

預期：exit `0`；只取得 selection 綁定 URL，三個輸出均非空、byte size 符合 caller-provided HEAD，並凍結首次完整取得的 SHA-256。若 size 不符或無音軌即 hard fail；後續重跑須與 `acquisition-evidence.json.actual_sha256` 比對，不得換檔。

### P3. 十個六秒窗口的選鏡 QA（兩批各五）

把第 2.3 節固定的十個起點按原順序寫入 `inputs.content.shots` 後，每個六秒窗口輸出一張三幀 strip（約在窗口 0、2.5、5 秒），並套用素材區中央裁切比例；這是 full local asset 的 identity／畫面 replay，不是重新選鏡：

```bash
set -euo pipefail
SHOT_QA_ROUND="${SHOT_QA_ROUND:?set immutable r01, r02, ...}"
printf '%s' "$SHOT_QA_ROUND" | grep -Eq '^r[0-9]{2}$'
D1="$RUN_DIR/shots/window-strips-$SHOT_QA_ROUND-b01"
D2="$RUN_DIR/shots/window-strips-$SHOT_QA_ROUND-b02"
test ! -e "$D1" && test ! -e "$D2"
mkdir -p "$D1" "$D2"
for i in 0 1 2 3 4; do
  START="$(jq -r --argjson i "$i" '.content.shots[$i].media_start' "$INPUTS")"
  N="$(printf '%02d' $((i+1)))"; OUT="$D1/$N.jpg"
  OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -v error -threads 1 -n \
    -ss "$START" -t 6 -i "$RUN_DIR/project/assets/footage.mp4" -frames:v 1 \
    -vf "fps=1/2.5,crop='min(iw,ih*1080/1017)':ih:(iw-ow)/2:0,scale=360:-2,tile=3x1:nb_frames=3" \
    "$OUT" || exit 1
  test -s "$OUT" || exit 1
done
test "$(find "$D1" -maxdepth 1 -name '*.jpg' -type f -size +0 | wc -l | tr -d ' ')" -eq 5

for i in 5 6 7 8 9; do
  START="$(jq -r --argjson i "$i" '.content.shots[$i].media_start' "$INPUTS")"
  N="$(printf '%02d' $((i+1)))"; OUT="$D2/$N.jpg"
  OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -v error -threads 1 -n \
    -ss "$START" -t 6 -i "$RUN_DIR/project/assets/footage.mp4" -frames:v 1 \
    -vf "fps=1/2.5,crop='min(iw,ih*1080/1017)':ih:(iw-ow)/2:0,scale=360:-2,tile=3x1:nb_frames=3" \
    "$OUT" || exit 1
  test -s "$OUT" || exit 1
done
test "$(find "$D2" -maxdepth 1 -name '*.jpg' -type f -size +0 | wc -l | tr -d ' ')" -eq 5

P3_REPLAY_RESULT="${P3_REPLAY_RESULT:?set PASS only after all ten fixed strips match E11}"
if [ "$P3_REPLAY_RESULT" != PASS ]; then
  : "${P3_DEVIATION_SUMMARY:?required when P3 replay is not PASS}"
  printf '\n## P3 fixed-selection deviation — %s\n- evidence: `%s`, `%s`\n- result: FAIL\n- action: current run stopped; starts unchanged\n- detail: %s\n' \
    "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" "$D1" "$D2" "$P3_DEVIATION_SUMMARY" \
    >> "$RUN_DIR/execution-audit.md"
  printf 'P3-fixed-selection-replay\t1\t%s\n' "$P3_DEVIATION_SUMMARY" >> "$RUN_DIR/exit-status.tsv"
  exit 1
fi
```

預期：兩個 batch 各 exit `0`、各五張三幀 strip，且全部與 E11 v0.4 的 fixed identity／crop／claim mapping 相符。**任何** frozen asset、strip、轉場、偏軸、UI、安全或 mapping 不符時，只能保留該 `rNN` evidence、記 deviation、停止 current run、回報 reviewer；不得在 canonical run 換起點或重抽成另一個答案。任何新起點必須另行更新 visual preflight、claim map、selection、inputs binding 與 Gate artifact，再取得 reviewer 明確核准；不足十段則觸發 SKILL 條件式 gate，不得縮短或重複。完成後才執行 M4b 與 M6。

### P4. Composition structure、section dips 與 audio envelope

P3 完成後先執行 M4b 與 M6，兩者 exit `0` 才能以 `fixtures/composition-template.html` 填成 `project/index.html`。所有 motion 併入 template 既有的唯一 `gsap.timeline({ paused: true })`，不建立 clock／timer／第二條競爭 timeline。

#### P4.1 DOM／data timing contract

十個 video 與十個 matching audio 均為 `data-duration="6"`；audio/video 的 `data-start`、`data-media-start` 必須逐列相同：

| Pair | Output start | Source start | Section relation |
|---|---:|---:|---|
| `shot-01`／`snd-01` | `0` | `212.5` | S1-A |
| `shot-02`／`snd-02` | `6` | `218.5` | S1-B；output 6s 不加 transition |
| `shot-03`／`snd-03` | `12` | `1455.0` | S2-A；section boundary |
| `shot-04`／`snd-04` | `18` | `1461.0` | S2-B；output 18s 不加 transition |
| `shot-05`／`snd-05` | `24` | `1042.0` | S3-A；section boundary |
| `shot-06`／`snd-06` | `30` | `1048.0` | S3-B；output 30s 不加 transition |
| `shot-07`／`snd-07` | `36` | `384.0` | S4-A；section boundary |
| `shot-08`／`snd-08` | `42` | `390.0` | S4-B；output 42s 不加 transition |
| `shot-09`／`snd-09` | `48` | `1394.0` | S5-A；section boundary |
| `shot-10`／`snd-10` | `54` | `1400.0` | S5-B；output 54s 不加 transition |

- video：`data-track-index="0" muted playsinline`。
- audio：`data-track-index="10" data-volume="1" data-audio-group="program-audio"`；不得另用 GSAP tween `volume`，避免與 automation double-own。
- pair boundaries `6/18/30/42/54` 是同一 12 秒 source range 的連續 A→B hard splice；不加 visual dip、gain point、silence、freeze 或 hold。
- section boundaries `12/24/36/48` 才允許 authored dip／gain envelope。
- source-authored S3 montage cut 約 output `33.0s`（source 約 `00:17:31`）不加人工 transition，保留原片 cadence並單獨 QA。

在 `#stage` 內、十個 video 之後、`#scrim`／captions 之前加入一個**非 timed clip** overlay：

```html
<div id="section-dip" aria-hidden="true"
     data-section-boundaries="12,24,36,48"
     data-half-duration="0.08"></div>
```

```css
#section-dip {
  position: absolute; inset: 0; z-index: 1; pointer-events: none;
  opacity: 0; background: #0a2446;
}
#scrim { z-index: 2; }
.cap { z-index: 3; }
```

十個 audio 之前加入一個 composition-time bus；JSON attribute 必須用 double quote＋`&quot;`，不得把 lane 複製到各 clip：

```html
<hf-audio-group id="program-audio" data-label="Program audio" data-volume="1"
  data-automation="{&quot;version&quot;:1,&quot;lanes&quot;:[{&quot;target&quot;:&quot;volume&quot;,&quot;points&quot;:[{&quot;t&quot;:0,&quot;v&quot;:1},{&quot;t&quot;:11.9,&quot;v&quot;:1},{&quot;t&quot;:12,&quot;v&quot;:0.08},{&quot;t&quot;:12.1,&quot;v&quot;:1},{&quot;t&quot;:23.9,&quot;v&quot;:1},{&quot;t&quot;:24,&quot;v&quot;:0.08},{&quot;t&quot;:24.1,&quot;v&quot;:1},{&quot;t&quot;:35.9,&quot;v&quot;:1},{&quot;t&quot;:36,&quot;v&quot;:0.08},{&quot;t&quot;:36.1,&quot;v&quot;:1},{&quot;t&quot;:47.9,&quot;v&quot;:1},{&quot;t&quot;:48,&quot;v&quot;:0.08},{&quot;t&quot;:48.1,&quot;v&quot;:1},{&quot;t&quot;:60,&quot;v&quot;:1}]}]}"></hf-audio-group>
```

最低值 `0.08` 只是一個瞬時 valley，不是靜音 hold；每個 section boundary 在 ±100ms 內恢復 `1`。GSAP visual dip 固定為 ±80ms、最高 opacity `0.26`，不可能產生全黑 overlay：

```js
const SECTION_BOUNDARIES = Object.freeze([12, 24, 36, 48]);
const PAIR_BOUNDARIES = Object.freeze([6, 18, 30, 42, 54]);
const DIP_HALF_SECONDS = 0.08;
SECTION_BOUNDARIES.forEach((boundary) => {
  tl.fromTo('#section-dip', { opacity: 0 },
    { opacity: 0.26, duration: DIP_HALF_SECONDS, ease: 'none', immediateRender: false },
    boundary - DIP_HALF_SECONDS);
  tl.to('#section-dip', { opacity: 0, duration: DIP_HALF_SECONDS, ease: 'none' }, boundary);
});
```

這段只以 composition time 建 timeline；禁止 `Date.now()`、`performance.now()`、`Math.random()`、`setTimeout()`、`requestAnimationFrame()`、`play()` 或 event-driven state。

#### P4.2 Structure／timing／automation replay assertion

```bash
cd "$RUN_DIR/project"
V="$(grep -c '<video ' index.html)"
A="$(grep -c '<audio ' index.html)"
C="$(grep -c 'class="cap clip"' index.html)"
G="$(grep -c '<hf-audio-group ' index.html)"
M="$(grep -c 'data-audio-group="program-audio"' index.html)"
D="$(grep -c 'id="section-dip"' index.html)"
R="$(grep -c '{{' index.html || true)"
test "$V" -eq 10 && test "$A" -eq 10 && test "$C" -eq 20
test "$G" -eq 1 && test "$M" -eq 10 && test "$D" -eq 1 && test "$R" -eq 0

OMP_THREAD_LIMIT=1 nice -n 19 python3 - index.html <<'PY'
from html import unescape
from html.parser import HTMLParser
import json, re, sys

class P(HTMLParser):
    def __init__(self):
        super().__init__(); self.tags=[]; self.scripts=[]; self._script=False
    def handle_starttag(self, tag, attrs):
        self.tags.append((tag, dict(attrs)))
        if tag == 'script': self._script=True
    def handle_endtag(self, tag):
        if tag == 'script': self._script=False
    def handle_data(self, data):
        if self._script: self.scripts.append(data)

s=open(sys.argv[1]).read(); p=P(); p.feed(s)
video=[a for t,a in p.tags if t=='video']; audio=[a for t,a in p.tags if t=='audio']
groups=[a for t,a in p.tags if t=='hf-audio-group']; dips=[a for t,a in p.tags if a.get('id')=='section-dip']
starts=[0,6,12,18,24,30,36,42,48,54]
media=[212.5,218.5,1455.0,1461.0,1042.0,1048.0,384.0,390.0,1394.0,1400.0]
assert len(video)==len(audio)==10 and len(groups)==len(dips)==1
for kind, rows, prefix in [('video',video,'shot'),('audio',audio,'snd')]:
    assert [a['id'] for a in rows] == [f'{prefix}-{i:02d}' for i in range(1,11)]
    assert [float(a['data-start']) for a in rows] == starts
    assert [float(a['data-duration']) for a in rows] == [6]*10
    assert [float(a['data-media-start']) for a in rows] == media
assert all('muted' in a and 'playsinline' in a for a in video)
assert all(a.get('data-audio-group')=='program-audio' and a.get('data-volume')=='1' for a in audio)
assert dips[0]['data-section-boundaries']=='12,24,36,48' and dips[0]['data-half-duration']=='0.08'
g=groups[0]; assert g['id']=='program-audio' and 'data-start' not in g
auto=json.loads(unescape(g['data-automation']))
assert auto['version']==1 and len(auto['lanes'])==1 and auto['lanes'][0]['target']=='volume'
pts=auto['lanes'][0]['points']; valley=[p['t'] for p in pts if p['v']==0.08]
assert valley==[12,24,36,48]
assert [(p['t'],p['v']) for p in pts] == [(0,1),(11.9,1),(12,0.08),(12.1,1),(23.9,1),(24,0.08),(24.1,1),(35.9,1),(36,0.08),(36.1,1),(47.9,1),(48,0.08),(48.1,1),(60,1)]
assert all(all(abs(p['t']-b)>0.1 for p in pts) for b in [6,18,30,42,54])
js='\n'.join(p.scripts)
assert 'const SECTION_BOUNDARIES = Object.freeze([12, 24, 36, 48]);' in js
assert 'const PAIR_BOUNDARIES = Object.freeze([6, 18, 30, 42, 54]);' in js
assert js.count('gsap.timeline({ paused: true })')==1
assert not re.search(r'\b(Date\.now|performance\.now|Math\.random|setTimeout|requestAnimationFrame)\s*\(',js)
assert not re.search(r'\bvolume\s*:',js)
assert "tl.fromTo('#section-dip'" in js and "tl.to('#section-dip'" in js
assert 'opacity: 0.26' in js and 'boundary - DIP_HALF_SECONDS' in js
assert 'background: #0a2446' in s and 'opacity: 0' in s
print('PASS 10 AV pairs; visual dips/audio valleys only at 12/24/36/48; pair boundaries untouched')
PY
```

預期全部 exit `0`。任何 DOM count、exact timing、group membership、automation point、single-timeline 或 determinism assertion 失敗都先修 composition、以新 immutable snapshot round 重驗；不得繞過 assertion render。

### P5. HyperFrames lint／check

```bash
cd "$RUN_DIR/project"
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 lint
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 check
```

預期：兩者 exit `0`；lint `0 error`，check runtime/layout/motion `0 error`，contrast 全部 WCAG AA。`check` 不驗聲音，所以 P4 的 audio count 仍是 blocking check。

### P6. 20 個 caption midpoint snapshots（四批各五、round immutable）

每個完整 round 使用新的 `rNN`；下例第一次為 `r01`。任何 batch／視覺失敗都保留整輪，修正後把 `SNAPSHOT_ROUND` 增為 `r02`、`r03` 並重跑四批，絕不重用目錄。

```bash
cd "$RUN_DIR/project"
SNAPSHOT_ROUND="${SNAPSHOT_ROUND:?set r01, r02, ...}"
printf '%s' "$SNAPSHOT_ROUND" | grep -Eq '^r[0-9]{2}$'
for B in 01 02 03 04; do test ! -e "snapshots/caption-$SNAPSHOT_ROUND-b$B" || exit 1; done
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 snapshot --at 1.5,4.5,7.5,10.5,13.5 --no-end --timeout 30000 --describe false --output "snapshots/caption-$SNAPSHOT_ROUND-b01"
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 snapshot --at 16.5,19.5,22.5,25.5,28.5 --no-end --timeout 30000 --describe false --output "snapshots/caption-$SNAPSHOT_ROUND-b02"
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 snapshot --at 31.5,34.5,37.5,40.5,43.5 --no-end --timeout 30000 --describe false --output "snapshots/caption-$SNAPSHOT_ROUND-b03"
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 snapshot --at 46.5,49.5,52.5,55.5,58.5 --no-end --timeout 30000 --describe false --output "snapshots/caption-$SNAPSHOT_ROUND-b04"
```

預期：四個 command 各 exit `0`，每個 output directory 五張 snapshot 與 contact sheet。所有 20 張逐張記入 `<run_dir>/visual-qa.md`；只有全 PASS 的輪次可寫一行 `Active passing round: rNN`。

每筆至少包含 timestamp、snapshot path、三行大標、字幕完整、英文燒錄字碰撞、中央主體、footer 與 result。任一張 FAIL 就修 `project/index.html`、保留舊 round，以新 round 重新 lint/check/snapshot；不得 render。

#### P6.1 `visual-qa.md` content-safety contract

`visual-qa.md` 必須以 final crop＋headline/caption context 重新檢視 relevant sections，不得只引用 preflight token。每個 object 必須都有 `section`、`content_safety`、`checked_at`、`result`、`caution`；缺欄位直接 FAIL。caution 本身不自動 FAIL，但 `result=FAIL` 必須停止。

```json
{
  "content_safety": [
    {"section":"S1","content_safety":"REVIEWED","checked_at":"<ISO-8601>","result":"PASS_WITH_CAUTION","caution":"犯罪／疑似物質處理情境"},
    {"section":"S2","content_safety":"REVIEWED","checked_at":"<ISO-8601>","result":"PASS_WITH_CAUTION","caution":"非血腥近身衝突"},
    {"section":"S4","content_safety":"REVIEWED","checked_at":"<ISO-8601>","result":"PASS_WITH_CAUTION","caution":"臥室／親密關係語境；有衣著、無明示性行為"},
    {"section":"S5","content_safety":"REVIEWED","checked_at":"<ISO-8601>","result":"PASS_WITH_CAUTION","caution":"明確槍械／非血腥武裝行動"}
  ]
}
```

實際 JSON 放在 `<!-- content-safety-json:start -->` 與 `<!-- content-safety-json:end -->` markers 間；placeholder 不得留在 passing artifact。

#### P6.2 Render 前 transition QA（immutable 15 snapshots；5／5／5）

五個 targeted events：四個 authored section boundaries `12/24/36/48s`，以及 source-authored S3 montage cut `33s`。每個 event 抽 `before=-0.10s`、`at`、`after=+0.10s`；每條 command 恰五個 media items：

```bash
cd "$RUN_DIR/project"
TRANSITION_ROUND="${TRANSITION_ROUND:?set immutable r01, r02, ...}"
printf '%s' "$TRANSITION_ROUND" | grep -Eq '^r[0-9]{2}$'
for PHASE in before at after; do test ! -e "snapshots/transition-$TRANSITION_ROUND-$PHASE" || exit 1; done
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 snapshot --at 11.90,23.90,32.90,35.90,47.90 --no-end --timeout 30000 --describe false --output "snapshots/transition-$TRANSITION_ROUND-before"
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 snapshot --at 12.00,24.00,33.00,36.00,48.00 --no-end --timeout 30000 --describe false --output "snapshots/transition-$TRANSITION_ROUND-at"
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 snapshot --at 12.10,24.10,33.10,36.10,48.10 --no-end --timeout 30000 --describe false --output "snapshots/transition-$TRANSITION_ROUND-after"
for PHASE in before at after; do
  test "$(find "snapshots/transition-$TRANSITION_ROUND-$PHASE" -maxdepth 1 -name '*.png' -type f -size +0 | wc -l | tr -d ' ')" -eq 5 || exit 1
done
```

把十五張 exact paths 寫入 `<run_dir>/transition-qa.md` 的 machine-readable `pre_render` ledger：

```text
<!-- pre-render-transition-json:start -->
{ "events": [ five event objects ] }
<!-- pre-render-transition-json:end -->
```

每個 object 必填：`event_id,event_type,output_time,before_path,at_path,after_path,black_frame,freeze_frame,perceptible_stutter,automation_contract,preview_audio_listened_at,preview_audio_listener,audio_pop,audio_silence,audio_hesitation,result`。

- section events：`T12/T24/T36/T48`；at frame 可有 opacity `0.26` 色彩 dip，但主體不得全黑／消失，before→at→after 不得 freeze。
- source event：`T33`；不得出現 authored overlay／gain valley，實看原片 montage cut＋中央 crop＋caption 是否自然。
- 在 HyperFrames preview 以 `1x` 及 `0.25x` 各重播每個 ±0.25s 視窗並實聽；記 `preview_audio_listened_at` 與 listener。只寫 agent/pane done 無效。
- 任一黑幀、相同凍格、可感知頓格、pop、silence 或 hesitation 為 FAIL；修正後使用新 `TRANSITION_ROUND`，舊 evidence／ledger 不覆寫。
- passing artifact 必須有獨立行 `Active transition round: rNN` 與 `Pre-render transition result: PASS`。

### P7. Render 前最終 hard-stop replay

```bash
# M1 + internal-preview M2 必須再次 exit 0；只驗 QA 指定的 immutable passing rounds。
set -euo pipefail
ACTIVE_ROUND="$(awk -F': ' '/^Active passing round: / {print $2}' "$RUN_DIR/visual-qa.md")"
printf '%s' "$ACTIVE_ROUND" | grep -Eq '^r[0-9]{2}$'
for B in 01 02 03 04; do
  D="$RUN_DIR/project/snapshots/caption-$ACTIVE_ROUND-b$B"
  test "$(find "$D" -maxdepth 1 -name '*.png' -type f -size +0 | wc -l | tr -d ' ')" -eq 5 || exit 1
done
rg -q '^Overall result: PASS$' "$RUN_DIR/visual-qa.md"

ACTIVE_TRANSITION_ROUND="$(awk -F': ' '/^Active transition round: / {print $2}' "$RUN_DIR/transition-qa.md")"
printf '%s' "$ACTIVE_TRANSITION_ROUND" | grep -Eq '^r[0-9]{2}$'
for PHASE in before at after; do
  D="$RUN_DIR/project/snapshots/transition-$ACTIVE_TRANSITION_ROUND-$PHASE"
  test "$(find "$D" -maxdepth 1 -name '*.png' -type f -size +0 | wc -l | tr -d ' ')" -eq 5 || exit 1
done
rg -q '^Pre-render transition result: PASS$' "$RUN_DIR/transition-qa.md"
OMP_THREAD_LIMIT=1 nice -n 19 python3 - "$RUN_DIR/transition-qa.md" <<'PY'
from pathlib import Path
import datetime as dt, json, re, sys
s=Path(sys.argv[1]).read_text()
raw=s.split('<!-- pre-render-transition-json:start -->',1)[1].split('<!-- pre-render-transition-json:end -->',1)[0].strip()
raw=re.sub(r'^```json\s*|\s*```$', '', raw, flags=re.S)
rows=json.loads(raw)['events']; expected={'T12':12,'T24':24,'T33':33,'T36':36,'T48':48}
required={'event_id','event_type','output_time','before_path','at_path','after_path','black_frame','freeze_frame','perceptible_stutter','automation_contract','preview_audio_listened_at','preview_audio_listener','audio_pop','audio_silence','audio_hesitation','result'}
assert {r['event_id'] for r in rows}==set(expected) and len(rows)==5
for r in rows:
    assert required <= set(r) and float(r['output_time'])==expected[r['event_id']]
    assert r['event_type']==('source_authored_montage_cut' if r['event_id']=='T33' else 'section_boundary')
    for k in ['before_path','at_path','after_path']:
        assert Path(r[k]).is_file() and Path(r[k]).stat().st_size>0
    for k in ['black_frame','freeze_frame','perceptible_stutter','automation_contract','audio_pop','audio_silence','audio_hesitation','result']:
        assert r[k]=='PASS', (r['event_id'],k,r[k])
    assert r['preview_audio_listener'].strip()
    assert re.match(r'^\d{4}-\d{2}-\d{2}T',r['preview_audio_listened_at'])
    dt.datetime.fromisoformat(r['preview_audio_listened_at'].replace('Z','+00:00'))
print('PASS five pre-render transition events: paths/visual/automation/listening complete')
PY

OMP_THREAD_LIMIT=1 nice -n 19 python3 - "$RUN_DIR/visual-qa.md" <<'PY'
from pathlib import Path
import datetime as dt, json, re, sys
s=Path(sys.argv[1]).read_text()
assert '<!-- content-safety-json:start -->' in s and '<!-- content-safety-json:end -->' in s
raw=s.split('<!-- content-safety-json:start -->',1)[1].split('<!-- content-safety-json:end -->',1)[0].strip()
raw=re.sub(r'^```json\s*|\s*```$', '', raw, flags=re.S)
data=json.loads(raw); rows=data['content_safety']
expected={'S1':'犯罪／疑似物質處理','S2':'非血腥近身衝突','S4':'臥室／親密關係語境','S5':'槍械'}
assert {r['section'] for r in rows}==set(expected)
for r in rows:
    assert set(['section','content_safety','checked_at','result','caution']) <= set(r)
    assert r['content_safety']=='REVIEWED' and r['result']=='PASS_WITH_CAUTION'
    assert expected[r['section']] in r['caution'] and r['caution'].strip()
    assert re.match(r'^\d{4}-\d{2}-\d{2}T',r['checked_at'])
    dt.datetime.fromisoformat(r['checked_at'].replace('Z','+00:00'))
    assert '<ISO-8601>' not in r['checked_at']
print('PASS visual-qa content safety S1/S2/S4/S5 complete')
PY

cd "$RUN_DIR/project"
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 lint
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 check
```

預期：每項 exit `0`。`Overall result: PASS` 必須由 20 張 evidence 逐張記錄支持；transition PASS 必須由 15 張 before/at/after＋preview 實聽支持；四個 safety objects 缺欄位、空 caution、timestamp 不可 parse 或 result 非 passing 都會 fail。單純寫「agent done／pane complete」無效。

### P8. 單 worker immutable render attempt 與 final promotion

只有 P7 全通過才排程。每次 render 使用新的 `rNN` attempt directory；command failure／QA failure 都保留，不覆寫：

```bash
set -euo pipefail
RENDER_ATTEMPT="${RENDER_ATTEMPT:?set immutable r01, r02, ...}"
printf '%s' "$RENDER_ATTEMPT" | grep -Eq '^r[0-9]{2}$'
ATTEMPT_DIR="$RUN_DIR/render-attempts/$RENDER_ATTEMPT"
test ! -e "$ATTEMPT_DIR"
mkdir -p "$ATTEMPT_DIR"
cd "$RUN_DIR/project"
OMP_THREAD_LIMIT=1 nice -n 19 npx hyperframes@0.8.3 render \
  --output "$ATTEMPT_DIR/preview.mp4" --workers 1
test -s "$ATTEMPT_DIR/preview.mp4"
ATTEMPT_SHA="$(shasum -a 256 "$ATTEMPT_DIR/preview.mp4" | awk '{print $1}')"
printf '%s\t%s\t%s\n' "$RENDER_ATTEMPT" "$ATTEMPT_SHA" "$ATTEMPT_DIR/preview.mp4" \
  > "$ATTEMPT_DIR/render-result.tsv"

# 只有經 P7 選定的單一 attempt 可一次性 promotion；final path 與 selection 不得既存。
test ! -e "$RUN_DIR/preview.mp4"
test ! -e "$RUN_DIR/final-preview-selection.tsv"
ln "$ATTEMPT_DIR/preview.mp4" "$RUN_DIR/preview.mp4"
test "$(shasum -a 256 "$RUN_DIR/preview.mp4" | awk '{print $1}')" = "$ATTEMPT_SHA"
printf 'attempt\tsha256\tattempt_path\tfinal_path\n%s\t%s\t%s\t%s\n' \
  "$RENDER_ATTEMPT" "$ATTEMPT_SHA" "$ATTEMPT_DIR/preview.mp4" "$RUN_DIR/preview.mp4" \
  > "$RUN_DIR/final-preview-selection.tsv"
chmod a-w "$ATTEMPT_DIR/preview.mp4" "$RUN_DIR/preview.mp4" \
  "$ATTEMPT_DIR/render-result.tsv" "$RUN_DIR/final-preview-selection.tsv"
```

預期：render exit `0`，一個 attempt artifact 與根目錄唯一 final `preview.mp4` 具有同一 SHA-256。render 未成功或尚未 promotion 時，rerender 必須使用下一個 immutable `rNN` directory；不得重用 output／log。final 一旦 promotion，任何 canonical verifier 或 post-render QA failure 都 fail-fast 結束該 run；新 final 必須使用新的 timestamped run，不得替換既有 `preview.mp4`。若 reviewer 另授權 diagnostic reverify，只能寫新的 attempt-scoped log（例如 `render-attempts/r02/logs/verify-render-canonical.log`），不能覆寫 root canonical log或洗掉舊 exit。

`rights_status:UNKNOWN`／`publication_hold:true` 不阻擋 internal render；五項 Gate 已 PASS，但 focused reviewer 尚未解除既有 hold，所以整節仍 `NOT_RUN`。

## 8. 精確 post-render 驗證（全部 PLAN_ONLY／NOT_RUN）

### 8.1 Canonical harness verifier — `REQUIRED / NOT_RUN`

對根目錄**唯一 final** `preview.mp4` 執行一次，計為一個 external media operation／一個 media item。以下 exact pipeline 同時保留 stdout/stderr、command 與 verifier 原始 exit：

```bash
set -euo pipefail
test -s "$RUN_DIR/preview.mp4"
mkdir -p "$RUN_DIR/logs"
VERIFY_LOG="$RUN_DIR/logs/verify-render-canonical.log"
test ! -e "$VERIFY_LOG"
VERIFY_SHA_BEFORE="$(shasum -a 256 "$RUN_DIR/preview.mp4" | awk '{print $1}')"
printf 'OMP_THREAD_LIMIT=1 nice -n 19 %q %q --width 1080 --height 1920 --duration 60 --fps 30 --shot-seconds 6 2>&1 | tee %q\n' \
  "$HARNESS/bin/verify-render.sh" "$RUN_DIR/preview.mp4" "$VERIFY_LOG" \
  >> "$RUN_DIR/commands.log"
set +e
OMP_THREAD_LIMIT=1 nice -n 19 "$HARNESS/bin/verify-render.sh" "$RUN_DIR/preview.mp4" \
  --width 1080 --height 1920 --duration 60 --fps 30 --shot-seconds 6 \
  2>&1 | tee "$VERIFY_LOG"
PIPE_RC=("${PIPESTATUS[@]}")
set -e
VERIFY_RC="${PIPE_RC[0]}"; TEE_RC="${PIPE_RC[1]}"
printf 'verify-render-canonical\t%s\tlog=%s;tee_exit=%s\n' \
  "$VERIFY_RC" "$VERIFY_LOG" "$TEE_RC" >> "$RUN_DIR/exit-status.tsv"
test "$TEE_RC" -eq 0 || exit "$TEE_RC"
test "$VERIFY_RC" -eq 0 || exit "$VERIFY_RC"
test -s "$VERIFY_LOG"
VERIFY_SHA_AFTER="$(shasum -a 256 "$RUN_DIR/preview.mp4" | awk '{print $1}')"
test "$VERIFY_SHA_AFTER" = "$VERIFY_SHA_BEFORE"
chmod a-w "$VERIFY_LOG"
```

成功條件：canonical verifier exit `0`、tee exit `0`、log 非空、final hash 前後相同。任一不成立即 fail-fast，不執行後續 QA 或 GATE 2 handoff。root canonical log 不得覆寫；若曾失敗，該 run 的 final 即失敗。任何另行授權的 rerender／reverify 必須使用新的 immutable attempt media path與 attempt-scoped log，保留原 command／exit；新的 final 必須進新的 timestamped run。

第 8.2～8.5 的 metadata、音量、兩批各五音訊、代表幀與 transition QA 都是**補充證據，不能取代 8.1**。

### 8.2 Container、時長、幀數與 audio stream

```bash
mkdir -p "$RUN_DIR/qa"
OMP_THREAD_LIMIT=1 nice -n 19 ffprobe -v error \
  -show_entries format=duration:stream=index,codec_type,codec_name,width,height,nb_frames,r_frame_rate,avg_frame_rate \
  -of json "$RUN_DIR/preview.mp4" > "$RUN_DIR/qa/render-metadata.json"

OMP_THREAD_LIMIT=1 nice -n 19 python3 - "$RUN_DIR/qa/render-metadata.json" <<'PY'
import json, sys
m = json.load(open(sys.argv[1]))
v = next(s for s in m['streams'] if s['codec_type'] == 'video')
a = [s for s in m['streams'] if s['codec_type'] == 'audio']
assert (v['width'], v['height']) == (1080, 1920)
assert abs(float(m['format']['duration']) - 60) < 0.1
assert int(v['nb_frames']) == 1800
assert v['r_frame_rate'] == '30/1' and v['avg_frame_rate'] == '30/1'
assert a and a[0].get('codec_name')
print('PASS 1080x1920 60s 1800 frames output r/avg fps=30/1 audio present')
PY
```

預期：兩個 command exit `0`。

### 8.3 全片平均音量

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -threads 1 \
  -i "$RUN_DIR/preview.mp4" -af volumedetect -f null /dev/null \
  2> "$RUN_DIR/qa/render-volumedetect.log"
MV="$(awk '/mean_volume/ {print $5}' "$RUN_DIR/qa/render-volumedetect.log")"
awk -v v="$MV" 'BEGIN { exit !(v >= -22 && v <= -16) }'
```

預期：兩個 command exit `0`，`MV` 在 `-22` 至 `-16 dB`。

### 8.4 十段有聲，兩批各五

```bash
set -euo pipefail
: > "$RUN_DIR/qa/segment-audio-b01.tsv"
for T in 1 7 13 19 25; do
  V="$(OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -threads 1 -ss "$T" -t 4 \
    -i "$RUN_DIR/preview.mp4" -af volumedetect -f null /dev/null 2>&1 |
    awk '/mean_volume/ {print $5}')"
  test -n "$V" && test "$V" != '-inf' || exit 1
  printf '%s\t%s\tPASS\n' "$T" "$V" >> "$RUN_DIR/qa/segment-audio-b01.tsv"
done
test "$(wc -l < "$RUN_DIR/qa/segment-audio-b01.tsv" | tr -d ' ')" -eq 5

: > "$RUN_DIR/qa/segment-audio-b02.tsv"
for T in 31 37 43 49 55; do
  V="$(OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -threads 1 -ss "$T" -t 4 \
    -i "$RUN_DIR/preview.mp4" -af volumedetect -f null /dev/null 2>&1 |
    awk '/mean_volume/ {print $5}')"
  test -n "$V" && test "$V" != '-inf' || exit 1
  printf '%s\t%s\tPASS\n' "$T" "$V" >> "$RUN_DIR/qa/segment-audio-b02.tsv"
done
test "$(wc -l < "$RUN_DIR/qa/segment-audio-b02.tsv" | tr -d ' ')" -eq 5
```

預期：兩個 batch 各 exit `0`，每個 TSV 恰五列且沒有 `-inf`；pipefail 防止 ffmpeg 失敗被 awk 掩蓋。這兩批是額外 audibility coverage，**不得替代或被描述為等價於 8.1 canonical verifier**。

### 8.5 成片五張代表幀

```bash
set -euo pipefail
POST_QA_ROUND="${POST_QA_ROUND:?set immutable r01, r02, ...}"
printf '%s' "$POST_QA_ROUND" | grep -Eq '^r[0-9]{2}$'
MID="$RUN_DIR/qa/rendered-midpoints-$POST_QA_ROUND"
test ! -e "$MID"
mkdir -p "$MID"
for SPEC in '01 1.5' '02 16.5' '03 31.5' '04 46.5' '05 58.5'; do
  set -- $SPEC; OUT="$MID/$1.png"
  OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -v error -threads 1 -n -ss "$2" \
    -i "$RUN_DIR/preview.mp4" -frames:v 1 "$OUT" || exit 1
  test -s "$OUT" || exit 1
done
test "$(find "$MID" -maxdepth 1 -name '*.png' -type f -size +0 | wc -l | tr -d ' ')" -eq 5
```

預期：exit `0`，恰五張且舊 round 不覆寫。逐張結論寫 `qa/post-render-qa.md`；仍須由使用者進行既有 GATE 2，machine pass 不等於成片驗收。

### 8.5a Post-render transition visual／audio QA

對 final `preview.mp4` 重抽同五個 events 的 before／at／after，三個 visual batches 各五項；所有 paths 使用新 `rNN`，不得覆寫：

```bash
set -euo pipefail
POST_TRANSITION_ROUND="${POST_TRANSITION_ROUND:?set immutable r01, r02, ...}"
printf '%s' "$POST_TRANSITION_ROUND" | grep -Eq '^r[0-9]{2}$'
TD="$RUN_DIR/qa/transition-$POST_TRANSITION_ROUND"
test ! -e "$TD"
mkdir -p "$TD/before" "$TD/at" "$TD/after" "$TD/audio"

# Visual batch 1/3: before, exactly five items.
for SPEC in 'T12 11.90' 'T24 23.90' 'T33 32.90' 'T36 35.90' 'T48 47.90'; do
  set -- $SPEC; OUT="$TD/before/$1.png"
  OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -v error -threads 1 -n -ss "$2" \
    -i "$RUN_DIR/preview.mp4" -frames:v 1 "$OUT" || exit 1
  test -s "$OUT" || exit 1
done

# Visual batch 2/3: at, exactly five items.
for SPEC in 'T12 12.00' 'T24 24.00' 'T33 33.00' 'T36 36.00' 'T48 48.00'; do
  set -- $SPEC; OUT="$TD/at/$1.png"
  OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -v error -threads 1 -n -ss "$2" \
    -i "$RUN_DIR/preview.mp4" -frames:v 1 "$OUT" || exit 1
  test -s "$OUT" || exit 1
done

# Visual batch 3/3: after, exactly five items.
for SPEC in 'T12 12.10' 'T24 24.10' 'T33 33.10' 'T36 36.10' 'T48 48.10'; do
  set -- $SPEC; OUT="$TD/after/$1.png"
  OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -v error -threads 1 -n -ss "$2" \
    -i "$RUN_DIR/preview.mp4" -frames:v 1 "$OUT" || exit 1
  test -s "$OUT" || exit 1
done
for PHASE in before at after; do
  test "$(find "$TD/$PHASE" -maxdepth 1 -name '*.png' -type f -size +0 | wc -l | tr -d ' ')" -eq 5 || exit 1
done
for EVENT in T12 T24 T33 T36 T48; do
  H1="$(shasum -a 256 "$TD/before/$EVENT.png" | awk '{print $1}')"
  H2="$(shasum -a 256 "$TD/at/$EVENT.png" | awk '{print $1}')"
  H3="$(shasum -a 256 "$TD/after/$EVENT.png" | awk '{print $1}')"
  test "$H1" != "$H2" || test "$H2" != "$H3" || exit 1
done
```

短音訊 windows 是另一個恰五項 batch；每項輸出 0.50 秒 PCM WAV 與 `silencedetect+astats` raw log：

```bash
set -euo pipefail
printf 'event\tstart\trms_db\tpeak_db\tsilence_events\tresult\n' > "$TD/transition-audio.tsv"
for SPEC in 'T12 11.75' 'T24 23.75' 'T33 32.75' 'T36 35.75' 'T48 47.75'; do
  set -- $SPEC; EVENT="$1"; START="$2"
  WAV="$TD/audio/$EVENT.wav"; LOG="$TD/audio/$EVENT.astats.log"
  test ! -e "$WAV" && test ! -e "$LOG"
  OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel info -threads 1 -n \
    -ss "$START" -t 0.50 -i "$RUN_DIR/preview.mp4" -vn \
    -af 'silencedetect=noise=-50dB:d=0.05,astats=metadata=1:reset=0' \
    -c:a pcm_s16le "$WAV" 2> "$LOG" || exit 1
  test -s "$WAV" && test -s "$LOG"
  RMS="$(awk '/RMS level dB/ {v=$NF} END {print v}' "$LOG")"
  PEAK="$(awk '/Peak level dB/ {v=$NF} END {print v}' "$LOG")"
  test -n "$RMS" && test "$RMS" != '-inf'
  test -n "$PEAK" && test "$PEAK" != '-inf'
  SILENCE="$(grep -c 'silence_start' "$LOG" || true)"
  test "$SILENCE" -eq 0
  awk -v v="$PEAK" 'BEGIN {exit !(v <= 0)}'
  printf '%s\t%s\t%s\t%s\t%s\tPASS\n' "$EVENT" "$START" "$RMS" "$PEAK" "$SILENCE" \
    >> "$TD/transition-audio.tsv"
done
test "$(find "$TD/audio" -maxdepth 1 -name '*.wav' -type f -size +0 | wc -l | tr -d ' ')" -eq 5
test "$(wc -l < "$TD/transition-audio.tsv" | tr -d ' ')" -eq 6
```

每個 WAV 必須在 `1x` 與 `0.25x` 實聽，不能由 non-silence 數值推定沒有 pop／hesitation。把結果加入 `transition-qa.md` 的 markers：

```text
<!-- post-render-transition-json:start -->
{ "events": [ five event objects ] }
<!-- post-render-transition-json:end -->
Post-render transition result: PASS
```

每個 event object 必填：`event_id,event_type,output_time,before_path,at_path,after_path,black_frame,freeze_frame,perceptible_stutter,audio_window_path,audio_log_path,rms_db,peak_db,silence_events,listened_at,listener,audio_pop,audio_silence,audio_hesitation,result`。`T12/T24/T36/T48` 為 `section_boundary`；`T33` 為 `source_authored_montage_cut`。以下 assertion 必須 exit `0`：

```bash
OMP_THREAD_LIMIT=1 nice -n 19 python3 - "$RUN_DIR/transition-qa.md" <<'PY'
from pathlib import Path
import datetime as dt, json, re, sys
s=Path(sys.argv[1]).read_text()
raw=s.split('<!-- post-render-transition-json:start -->',1)[1].split('<!-- post-render-transition-json:end -->',1)[0].strip()
raw=re.sub(r'^```json\s*|\s*```$', '', raw, flags=re.S)
rows=json.loads(raw)['events']; expected={'T12':12,'T24':24,'T33':33,'T36':36,'T48':48}
required={'event_id','event_type','output_time','before_path','at_path','after_path','black_frame','freeze_frame','perceptible_stutter','audio_window_path','audio_log_path','rms_db','peak_db','silence_events','listened_at','listener','audio_pop','audio_silence','audio_hesitation','result'}
assert {r['event_id'] for r in rows}==set(expected) and len(rows)==5
for r in rows:
    assert required <= set(r) and float(r['output_time'])==expected[r['event_id']]
    assert r['event_type']==('source_authored_montage_cut' if r['event_id']=='T33' else 'section_boundary')
    for k in ['before_path','at_path','after_path','audio_window_path','audio_log_path']:
        assert Path(r[k]).is_file() and Path(r[k]).stat().st_size>0
    for k in ['black_frame','freeze_frame','perceptible_stutter','audio_pop','audio_silence','audio_hesitation','result']:
        assert r[k]=='PASS', (r['event_id'],k,r[k])
    assert int(r['silence_events'])==0 and r['listener'].strip()
    assert re.match(r'^\d{4}-\d{2}-\d{2}T',r['listened_at'])
    dt.datetime.fromisoformat(r['listened_at'].replace('Z','+00:00'))
assert 'Post-render transition result: PASS' in s
print('PASS five post-render transition events: visual/audio/listening complete')
PY
```

任何黑幀、freeze、可感知頓格、pop、`>=50ms` silence、hesitation、缺 path／欄位或未實聽都 FAIL，立即停止，不交 GATE 2。

### 8.5b `qa/post-render-qa.md` content safety contract

final rendered crop／caption 必須再檢 S1／S2／S4／S5；使用與 P6.1 相同的 markers 與每-object fields：`section,content_safety,checked_at,result,caution`。caution 不自動 FAIL，但四項目前都應為 `PASS_WITH_CAUTION`；若 final context 加劇風險可判 FAIL。artifact 另須有獨立行 `publication_hold: true`。

```bash
OMP_THREAD_LIMIT=1 nice -n 19 python3 - "$RUN_DIR/qa/post-render-qa.md" <<'PY'
from pathlib import Path
import datetime as dt, json, re, sys
s=Path(sys.argv[1]).read_text()
raw=s.split('<!-- content-safety-json:start -->',1)[1].split('<!-- content-safety-json:end -->',1)[0].strip()
raw=re.sub(r'^```json\s*|\s*```$', '', raw, flags=re.S)
rows=json.loads(raw)['content_safety']
expected={'S1':'犯罪／疑似物質處理','S2':'非血腥近身衝突','S4':'臥室／親密關係語境','S5':'槍械'}
required={'section','content_safety','checked_at','result','caution'}
assert {r['section'] for r in rows}==set(expected) and len(rows)==4
for r in rows:
    assert required <= set(r)
    assert r['content_safety']=='REVIEWED' and r['result']=='PASS_WITH_CAUTION'
    assert expected[r['section']] in r['caution'] and r['caution'].strip()
    assert re.match(r'^\d{4}-\d{2}-\d{2}T',r['checked_at'])
    dt.datetime.fromisoformat(r['checked_at'].replace('Z','+00:00'))
assert re.search(r'^publication_hold: true$',s,re.M)
print('PASS post-render safety S1/S2/S4/S5 complete; publication hold retained')
PY
```

缺任一 safety 欄位、timestamp、nonempty caution 或 hold line即 FAIL。

### 8.6 最終 hashes（單批五項）

```bash
cd "$RUN_DIR"
shasum -a 256 \
  preview.mp4 \
  inputs.json \
  story-package.json \
  project/index.html \
  project/assets/footage.mp4 \
  > qa/final-sha256-b01.txt
```

預期：exit `0`、五列。`PROVENANCE.md` 必須引用素材與成片 hash、第一方頁、取得方式、實測 metadata、source `r_frame_rate=30/1`、source `avg_frame_rate=30/1`、output `30 fps`、rights 狀態與取得日。

### 8.7 GATE 2 handoff 的 fps／cadence 揭露

GATE 2 package 必須明列：source `r_frame_rate=30/1`、source `avg_frame_rate=30/1`、output `fps=30`／1800 frames。就目前 probe 而言 nominal source/output fps **無差異**；仍經 HyperFrames decode／encode，使用者要用五張 rendered midpoints 與 preview 檢視 cadence。若完整下載後 probe 出現 VFR 或與 preflight 不同，須以實測覆寫此說明並明列 source→30 fps 重取樣落差。

### 8.8 GATE 2 safety／transition／canonical-verifier handoff

GATE 2 handoff 必須逐項引用 `visual-qa.md` 與 `qa/post-render-qa.md` 的 final evidence path、`checked_at`、`result`、`caution`：

| Section | Required caution |
|---|---|
| `S1` | 犯罪／疑似物質處理情境 |
| `S2` | 非血腥近身衝突 |
| `S4` | 臥室／親密關係語境；角色有衣著、無明示性行為 |
| `S5` | 明確槍械／非血腥武裝行動 |

caution 不自動 FAIL，但缺項、空欄位、無 final-frame evidence 或任一 QA result FAIL 都不得 handoff。另必須附：

- `logs/verify-render-canonical.log`、`exit-status.tsv` 中 `verify-render-canonical=0` 與 final preview SHA；
- `transition-qa.md` 的 pre／post 5-event PASS、15+15 visual paths、五個 audio logs／WAVs與實聽 timestamps；
- `publication_hold: true` 與 `rights_status: UNKNOWN`，明示 internal preview 不得公開。

## 9. GATE 2 後獨立 release check（不影響 internal preview）

只有使用者已通過 GATE 2、準備商用或對外公開時才執行：

```bash
OMP_THREAD_LIMIT=1 nice -n 19 jq -e '
  .gate2.status == "PASS" and
  .publication_rights.rights_status == "CONFIRMED_FOR_INTENDED_USE" and
  .publication_hold == false and
  (.publication_rights.intended_use | type == "string" and length > 0) and
  (.publication_rights.scope | type == "string" and length > 0) and
  (.publication_rights.evidence_refs | type == "array" and length > 0)
' "$RUN_DIR/release-check.json"
```

預期：exit `0` 才可 release。`UNKNOWN`、`publication_hold:true` 或 GATE 2 pending 時 exit `1`；只阻擋公開發布，不否定五項 Gate，也不撤銷已產生的內部 preview。

## 10. 計畫／執行狀態表

| 命令群 | 本輪是否執行 | 解除條件 | 成功預期 |
|---|---|---|---|
| M1／M2-internal／M3／M4a／M5 | `NOT_RUN / REVIEWER_HOLD` | canonical Gate／formal ref 已 PASS；focused reviewer 核准後才在新 run 凍結並重播 | 每項 exit `0` |
| P1 init project | `NOT_RUN / REVIEWER_HOLD` | reviewer 核准且前列 init checks 全通過；不等待 M4b／M6 | exit `0` |
| P2 prep footage | `NOT_RUN` | selection／Story／inputs 都綁定同一 official URL | exit `0`＋凍結 actual SHA-256 |
| P3 fixed window replay | `NOT_RUN` | 第 2.3 節十 starts 原序寫入 inputs | immutable 5＋5 strips；不符記 deviation／exit 1，絕不換點 |
| M4b／M6 | `NOT_RUN` | P3 PASS 後、P4 前；文案／shots／23 個 claim slots 完成 | 各 exit `0` |
| P4 transition／automation contract | `NOT_RUN` | M4b／M6 通過，index.html 已組成 | exact DOM/timing/GSAP/audio assertion exit `0` |
| P5 lint/check | `NOT_RUN` | composition 存在 | 各 exit `0` |
| P6 caption snapshots | `NOT_RUN` | lint/check 通過；每次使用新 rNN | 四批各五張、舊 round 保留 |
| P6 transition snapshots | `NOT_RUN` | P4/P5 PASS | before/at/after 三批各五張＋preview listening |
| P7 hard-stop replay | `NOT_RUN` | caption 20、transition 15、visual safety S1/S2/S4/S5 全有 passing evidence | 全部 exit `0` |
| P8 immutable internal render | `NOT_RUN / REVIEWER_HOLD` | reviewer／P7 全 PASS；允許 rights UNKNOWN＋hold | immutable attempt＋唯一 promoted final |
| 8.1 canonical verifier | `REQUIRED / NOT_RUN` | 唯一 final preview 已 promotion | exact tee command；verifier/tee 均 exit `0`，非零 fail-fast |
| 8.2–8.5 supplemental QA | `NOT_RUN` | 8.1 PASS | metadata／音量／split audio／midpoints；不能取代 8.1 |
| 8.5a transition QA | `NOT_RUN` | 8.1 PASS | 15 frames（5/5/5）＋5 WAV/log＋實聽，全 PASS |
| 8.5b post-render safety | `NOT_RUN` | final frames 可檢 | S1/S2/S4/S5 fields 完整、hold=true |
| GATE 2 | `PENDING AFTER RENDER` | canonical、supplemental、transition、安全、fps handoff 齊全 | 只能由使用者 PASS |
| Release check | `NOT_RUN / BLOCKED` | GATE 2 PASS 後另取得 intended-use rights、hold=false | exit `0` 才可公開 |

本文件本身不是 execution evidence；只有未來 run_dir 內的來源 URL／frozen text、rights 文件、實際 command log、exit status、media hashes、snapshots 與 QA 結果可作證據。agent、workspace 或 pane 的「完成」狀態一律不能替代。
