# GTA VI Gate Evaluation 與 formal Story Package

- artifact：`gta-gate-and-story-package`
- artifact 版本：`v0.5`
- 日期：`2026-08-30`
- Gate 版本：`editorial-gate v0.1`
- freshness evaluated at：`2026-08-30T19:32:00+08:00`（`2026-08-30T11:32:00Z`）
- visual decision at：`2026-08-30T20:10:51+08:00`（`2026-08-30T12:10:51Z`）
- interest integration at：`2026-08-30T21:24:13.666+08:00`（`2026-08-30T13:24:13.666Z`）
- candidate ID：`GE-GTA-VI-20260830-R1`
- acquisition record：`AR-GTA-VI-RK721912-20260830`
- status：`GATE_PASS_REVIEW_PENDING`
- story package ref：`exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05`
- reviewer ready：`true`
- reviewer approval：`PENDING_FOCUSED_RECHECK`
- fresh run authorized：`false`
- publication rights：`UNKNOWN`
- publication hold：`true`

## 1. Decision Lock 與證據 index

本 artifact 整合 dry-run、technical preflight、`gta-gate-evidence-supplement v0.3`、`gta-editorial-brief v0.4`、`gta-visual-preflight v0.4`、interest v0.4 behavior lock／measurement 與 editorial-owner v0.4 lock／r02 evidence。未建立 run_dir、完整下載、init、ffmpeg、snapshot 或 render。

| Evidence ID | URL／artifact | 時間與可支持範圍 |
|---|---|---|
| `E01` | [Rockstar Games｜Grand Theft Auto VI: An Extended Look](https://www.rockstargames.com/VI/an-extended-look) | 頁面 raw date `2026-08-27`，只有日期；支持第一方標題、新 Extended Look 與 PS5 capture context，不支持精確 timestamp／timezone |
| `E02` | [Rockstar official 1080p MP4](https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4) | `2026-08-30T11:15:17Z` session 單次 ffprobe；支持 duration、video/audio metadata 與 direct URL 技術可讀性 |
| `E03` | [Rockstar official zh-Hant VTT](https://videos-rockstargames-com.akamaized.net/v4/rk721912/cap/zh-hant.vtt) | 同 session 讀取；30,850 bytes、461 cues、SHA-256 `700ded6254683e34edd16fba079d1202cd8477d190ddba29e329777e2c2e2931` |
| `E04` | [PC Gamer｜Extended Look 上線報導](https://www.pcgamer.com/games/action/gta-6-netflix-extended-look-youtube/) | dry-run 查核 `2026-08-30T18:02:07+08:00`；獨立 editorial coverage，一筆 proxy，不是 audience outcome |
| `E05` | [Reddit r/PS5 上線日討論](https://www.reddit.com/r/PS5/comments/1w01299/grand_theft_auto_vi_an_extended_look_netflix_live/) | raw date `2026-08-27`；與 E06 合併為一種 audience-discussion proxy，沒有事前 baseline |
| `E06` | [Reddit r/xbox 上線日討論](https://www.reddit.com/r/xbox/comments/1w02rg2/grand_theft_auto_vi_an_extended_look_netflix/) | raw date `2026-08-27`；同平台討論 cluster，不另算第二種 behavior proxy |
| `E07` | [Rockstar Support｜Policy on posting copyrighted material](https://support.rockstargames.com/articles/7bNaeoMFTV0iUDGhStTXvz/policy-on-posting-copyrighted-rockstar-games-material) | dry-run 查核 `2026-08-30`；只證明有第一方政策頁，尚未完成本案 intended-use 判讀 |
| `E08` | `exploration/2026-08-30-gta-technical-preflight.md v0.1` | 單次 probe 完整 command／stdout、16 個 VTT 候選窗口；當時 visual preview UNKNOWN 是 technical-preflight history，current G5 已由 E11 supersede 為 PASS |
| `E09` | `exploration/2026-08-30-gta-gate-evidence-supplement.md v0.3` | freshness PASS；v0.2／v0.3 failures retained；canonical interest 切到 E12～E14 |
| `E10` | `exploration/2026-08-30-gta-editorial-brief.md v0.4` | identity-neutral viewer value、三行 headline、20 段摘要、IG copy 與 fixed active set 的 canonical editorial source |
| `E11` | `exploration/2026-08-30-gta-visual-preflight.md v0.4` | 八張既有 strips／ranges 不變；active selected set 五項 PASS，Caption 10 只由 active S3-R1 閉合 |
| `E12` | `exploration/2026-08-30-gta-interest-proxy-v0.4-dom-html-premeasurement.md v0.1` | 事前凍結 DOM `comment-count` metric、四 post IDs、median、1.5x threshold 與 selection-bias limitation；locked SHA 已驗 |
| `E13` | `exploration/2026-08-30-gta-editorial-owner-v0.4-premeasurement.md v0.1` | 事前凍結兩 outlets、48h window、publish/live timestamp 與 distinct parent-owner threshold；locked SHA 已驗 |
| `E14` | `exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md v0.1` | behavior `2.8598x` PASS；Future／Network N owner breadth `2/2` PASS；raw paths、14 hashes、failure history、bias 與 exact replay 完整 |

五項 Gate 只按 `exploration/2026-08-30-editorial-gate-v0.1.md` 判定；權利不增設第六 Gate。rights UNKNOWN 可在五項全 PASS 後維持 internal-preview `publication_hold:true`，但對外 release 仍阻擋。

**Viewer／audit separation**：headline、20 captions 與 IG Reels 內文只談 brief 定義的觀眾價值。H.264／AAC、VTT cue 或 cue 數、下載方式、rights workflow、candidate window 數與 hash 只可留在 Gate／selection／provenance audit，不得進 viewer-facing copy。

## 2. 五項 Gate Evaluation

### 2.1 Summary

| Gate | 狀態 | Reason code | 最短理由 |
|---|---|---|---|
| `freshness` | `PASS` | `FR_FIRST_PUBLIC_64H32M` | 第一方 `2026-08-27 3:00 p.m. ET` anchor 換算後 age `64.5333h ≤ 168h` |
| `why_now` | `PASS` | `WN_NEW_OFFICIAL_EXTENDED_LOOK` | 官方頁新增獨立的 Extended Look，而非只重刊舊 trailer |
| `audience_payoff` | `PASS` | `AP_LONG_FORM_OFFICIAL_SHOWCASE` | 近 27 分鐘官方展示可讓沒時間的觀眾理解任務分工、活動與日常互動，並區分尚未證明事項 |
| `interest_signals` | `PASS` | `IS_V04_COMMENTS_RATIO_AND_OWNER_BREADTH` | frozen behavior ratio `2.8598x ≥ 1.5x`，且固定 48h window 有兩個 distinct parent owners；bias 明揭 |
| `visual_source_fit` | `PASS` | `VS_ACTIVE_SET_FIVE_PASS` | fixed active selected set 五項中央 crop／UI／安全／claim mapping／相鄰 6 秒 pair 全 PASS |
| overall | `PASS` | `GE_ALL_FIVE_PASS` | 五項 conjunction 全 PASS；formal Story Package 建立並可送 focused reviewer，但尚未取得 fresh-run approval |

### 2.2 Freshness — PASS

- `freshness_anchor_at=2026-08-27T15:00:00-04:00`（`2026-08-27T19:00:00Z`）
- `freshness_anchor_type=first_public_netflix_premiere`
- `source_published_at=2026-08-27T15:00:00-04:00`
- `timezone=ET/UTC-04:00`
- `evaluated_at=2026-08-30T19:32:00+08:00`（`2026-08-30T11:32:00Z`）
- `source_checked_at=2026-08-30T19:32:00+08:00`
- `event_source_url=https://www.rockstargames.com/newswire/article/9k2kaa1o3297k9/grand-theft-auto-vi-an-extended-look`
- supporting URL：`https://www.pcgamer.com/news/live/grand-theft-auto-6-reveal-live-coverage-breaking-down-the-netflix-extended-look-event/`
- rolling window start：`2026-08-23T11:32:00Z`
- `age_hours=64.5333`
- `exception_code=null`

```text
2026-08-30T11:32:00Z - 2026-08-27T19:00:00Z
= 64h32m = 64.5333h
64.5333h <= 168h  => PASS
```

E09／supplement 以 Rockstar Newswire 的 `3:00 p.m. ET` Netflix first-public time 為 anchor，PC Gamer 的 `12 pm PDT` live coverage 相符。Rockstar CMS 精確發稿時間仍 unknown，但本次 freshness 不依賴 CMS timestamp；v0.1 的缺時分秒問題已由直接一手補證取代。

### 2.3 Why now — PASS

- before state：E01 的既有導覽列出先前 Trailer 1／Trailer 2；沒有本次 Extended Look。
- new state：E01 在 `2026-08-27` 新增 `Grand Theft Auto VI: An Extended Look`；E02 對應一支 1608.066667 秒第一方長片。
- `trigger_statement`：新的官方長篇展示成為可獨立查核的 product-showcase event，立即問題是「它相對既有 trailers 新增哪些任務／世界脈絡？」
- `primary_source_urls=[E01,E02]`；`supporting_source_urls=[E04]`。
- `trigger_at=2026-08-27T15:00:00-04:00`；精確 freshness 已由 E09 補證為 PASS。
- `claim_status=confirmed`；`exception_code=null`。

判定理由：這次 story angle 明確只談新增的 Extended Look，不把舊 trailer 或 GTA VI 長期熱度冒充新事件。

### 2.4 Audience payoff — PASS

- `story_type=product_showcase`
- technology／product delta：從官方頁既有 trailers，變成一支可連續檢視的 `1608.066667 s ÷ 60 = 26.801111 min`（約 `26:48.067`）PS5 capture 長片。
- affected audience：沒時間看完 26 分鐘、主要滑 Reels／短影音的一般科技與遊戲觀眾。
- payoff statement：因為 Rockstar 從既有 trailers 新增約 26:48 的官方長篇展示，所以沒時間看完的一般遊戲／科技觀眾能用 60 秒先掌握任務分工、活動與日常互動，再區分哪些事情仍待實測。
- `viewer_question_answered`：這次 Extended Look 相對既有 trailers 多給了哪些可回查的任務與世界密度？
- `practical_consequence`：觀眾可看懂官方剪輯如何留下任務空間切換、水上活動與角色日常，不把官方選擇展示的內容當成發售版效能證據。
- `supporting_claim_ids`：`GTA-V01`～`GTA-V12`；`GTA-V05`～`GTA-V08` 的 visual dependency 已由 E11 v0.4 active set 閉合，沒有 pending visual token。
- `claim_attribution=Rockstar official page/direct asset/official zh-Hant VTT`。
- `exception_code=null`。
- constraints：不聲稱畫質／效能提升、不聲稱實際 gameplay 系統已獨立驗證、不把 VTT 文字當畫面證據、不預測發售後體驗。

計算：長片約 `26.801111 min`；VTT `461 cues`；technical preflight 提出 `16 × 6 = 96 s` 敘事候選容量。這些數字支持「值得替沒時間觀眾整理」的具體交付，不依賴投資或市場 payoff。

### 2.5 Interest signals — PASS

`signal_phase=pre_publish_proxy`。Owner raw `measured_at=2026-08-30T13:21:59.592Z`，與後續 integration `2026-08-30T13:24:13.666Z` 分列。E12／E13 分別在 observation 前以 locked SHA-256 `ed15306ca5ddd45e75ee5c8b5b19acc5ba72e6315e01a052eac026cb48978001` 與 `24d153d42c3796993ed3936235a0220d0871a6fe59b3183b9fe7e4bf2d3a20f2` 凍結 behavior／owner contract；E14 逐檔記錄 raw paths、14 個 SHA、normalized records 與 exact replay。Legacy score metric 與 v0.2／v0.3 失敗均是 superseded history，不補位。

| Proxy | Frozen baseline／window | Measurement | Result |
|---|---|---|---|
| Reddit audience behavior | candidate `comment-count >= 1.5 × median(three fixed comparator comment-count)`；共同 capture `2026-08-30T12:53:44.940Z` | candidate `1061`；comparators `[1001,371,233]`；median `371`；ratio `2.8598382749326148` | `PASS` |
| Editorial owner breadth | event window `2026-08-27T19:00:00Z–2026-08-29T19:00:00Z`；distinct parent owners `>=2` | PC Gamer／Future 以窗內 live BlogPosting `19:17:24.976Z` 合格；PCGamesN／Network N publish `19:35:04Z` 合格 | `PASS` |

```text
median([1001, 371, 233]) = 371
1061 / 371 = 2.8598382749326148 >= 1.5  => behavior PASS
verified parent keys = {future, network-n}; 2 >= 2  => owner breadth PASS
```

- `canonical_measurement_ref=E14`
- `raw_behavior_evidence_root=exploration/evidence/gta-interest-v04-dom-html/`
- `raw_owner_evidence_root=exploration/evidence/gta-editorial-owner-v04-r02/`
- `old_score_proxy_relied_upon=false`
- `behavior_proxy_count=1`
- `independent_proxy_count=2`
- PC Gamer critical boundary：article-level initial publish `2026-08-27T17:30:05Z` 早於 anchor，沒有拿它通過；只因 frozen contract 接受 machine-readable publish／live timestamp，才使用同頁 event-specific JSON-LD live entry `2026-08-27T19:17:24.976Z`。Reviewer 若拒絕此 semantics，不得新增第三家補位。
- selection-bias limitation：固定四筆是 global `r/Games` convenience set，post ages 不齊、不是台灣樣本，兩筆較低 comparators 顯著影響 median。這不改 frozen-contract 算術 PASS，但必須交 reviewer，且不得寫成預測播放量、正向情緒或 observed outcome。

依 Editorial Gate v0.1，兩種有效且獨立 proxy 同時正向，且包含一種 audience behavior，所以 G4 判 `PASS`。`reviewer_ready=true` 只表示 evidence package 可送審；reviewer 仍可因 comparability／selection bias 維持 fresh-run hold。

### 2.6 Visual/source fit — PASS

已確認的 machine evidence：

- stable footage ID：`RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P`
- official page：E01
- official direct MP4：E02
- duration：`1608.066667 s`
- video：H.264、`1920×1080`、`r_frame_rate=30/1`、`avg_frame_rate=30/1`
- audio：AAC、2 channels、48 kHz
- official zh-Hant VTT：E03，461 cues
- VTT 候選：E08 有 16 個互不重疊 6 秒窗口，算術容量 `16 × 6 = 96 s ≥ 60 s`

E11 v0.4 的 canonical active disposition 是五項 PASS。primary-b01 的早期未閉合結果只存在 E11 第 1～6 節，已明示為 `superseded historical disposition`，不構成本段或 current Gate 狀態；active selected set 不再自行換點：

| Section | Active 12 秒 range | Evidence | Adjacent 6 秒 pair | Result |
|---|---|---|---|---|
| `S1` | `00:03:32.500–00:03:44.500` | `primary-b01/S1-strip.jpg` | PASS／PASS | `PASS` |
| `S2` | `00:24:15.000–00:24:27.000` | `fallback-b02/S2-R1-strip.jpg` | PASS／PASS_WITH_CAUTION | `PASS` |
| `S3` | `00:17:22.000–00:17:34.000` | `fallback-b02/S3-R1-strip.jpg` | PASS／PASS | `PASS` |
| `S4` | `00:06:24.000–00:06:36.000` | `fallback-b02/S4-R1-strip.jpg` | PASS_WITH_CAUTION／PASS_WITH_CAUTION | `PASS` |
| `S5` | `00:23:14.000–00:23:26.000` | `primary-b01/S5-strip.jpg` | PASS／PASS | `PASS` |

```yaml
fact_source_urls: [E01, E03]
official_footage_page: https://www.rockstargames.com/VI/an-extended-look
footage_publisher: Rockstar Games
platform: Rockstar official direct MP4
probe_status: PASS
duration_seconds: 1608.066667
width: 1920
height: 1080
audio_status: PRESENT
public_obtainability: CONFIRMED
visual_source_fit:
  status: PASS
  reason_code: VS_ACTIVE_SET_FIVE_PASS
visual_evidence_ref: exploration/2026-08-30-gta-visual-preflight.md#9-active-selected-set-final-disposition
active_selected_set:
  S1: {source: primary-b01, start: 00:03:32.500, status: PASS}
  S2: {source: fallback-b02, start: 00:24:15.000, status: PASS}
  S3: {source: fallback-b02, start: 00:17:22.000, status: PASS}
  S4: {source: fallback-b02, start: 00:06:24.000, status: PASS}
  S5: {source: primary-b01, start: 00:23:14.000, status: PASS}
execution_risks: [full_download_pending, non_graphic_crime_and_intimacy_cautions]
rights_status: UNKNOWN
publication_hold: true
exception_code: null
```

Rights `UNKNOWN`／`publication_hold:true` 不參與這項判定，也不把它改成 FAIL。

### 2.7 Active G5 consistency assertion

Canonical G5 必須維持 heading／reason／evidence／active rows 全為 PASS。下列 assertion 同時限制 active G5、canonical Gate block 與 formal package；它不讀 primary-b01 的明示 historical disposition，因此不會把保留的失敗史誤作 current state。

```bash
OMP_THREAD_LIMIT=1 nice -n 19 python3 - exploration/2026-08-30-gta-gate-and-story-package.md <<'PY'
from pathlib import Path
import re, sys
s = Path(sys.argv[1]).read_text()
g5 = s.split('### 2.6 Visual/source fit — PASS', 1)[1].split('## 3. Overall contract', 1)[0]
gate_start = '<!-- canonical-' + 'gate-state:start -->'
gate_end = '<!-- canonical-' + 'gate-state:end -->'
formal_anchor = '<a id="formal-story-' + 'package-v05"></a>'
canon = s.split(gate_start, 1)[1].split(gate_end, 1)[0]
package = s.split(formal_anchor, 1)[1].split('## 4.', 1)[0]
for stale in [
    'Visual/source fit — ' + 'UNKNOWN',
    'VS_VISUAL_' + 'PREVIEW_PENDING',
    'VS_PRIMARY_BATCH_' + 'NOT_ALL_PASS',
    'open_gate_unknowns: [' + 'visual_preview]',
    'visual_source_fit: ' + 'UNKNOWN',
]:
    assert stale not in g5 + canon + package, stale
assert g5.count('| `PASS` |') >= 5
assert 'visual_source_fit:\n  status: PASS\n  reason_code: VS_ACTIVE_SET_FIVE_PASS' in g5
assert len(re.findall(r'^  [a-z_]+: \{status: PASS,', canon, re.M)) == 5 and 'overall_status: PASS' in canon
assert 'story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05' in canon
assert 'formal_package_created: true' in package and 'open_gate_unknowns: []' in package
print('PASS active G5, canonical Gate, and formal package are consistent')
PY
```

## 3. Overall contract

<!-- canonical-gate-state:start -->
```yaml
gate_version: v0.1
evaluated_at: 2026-08-30T21:24:13.666+08:00
candidate_id: GE-GTA-VI-20260830-R1
criteria:
  freshness: {status: PASS, reason_code: FR_FIRST_PUBLIC_64H32M}
  why_now: {status: PASS, reason_code: WN_NEW_OFFICIAL_EXTENDED_LOOK}
  audience_payoff: {status: PASS, reason_code: AP_LONG_FORM_OFFICIAL_SHOWCASE}
  interest_signals: {status: PASS, reason_code: IS_V04_COMMENTS_RATIO_AND_OWNER_BREADTH}
  visual_source_fit: {status: PASS, reason_code: VS_ACTIVE_SET_FIVE_PASS}
overall_status: PASS
hard_fail_reasons: []
open_gate_unknowns: []
rights_status: UNKNOWN
publication_hold: true
story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05
interest_evidence_ref: exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md
visual_evidence_ref: exploration/2026-08-30-gta-visual-preflight.md#9-active-selected-set-final-disposition
reviewer_ready: true
reviewer_approval: PENDING_FOCUSED_RECHECK
fresh_run_authorized: false
next_action: FOCUSED_REVIEW_FOR_FRESH_RUN
```
<!-- canonical-gate-state:end -->

Gate conjunction 已閉合，所以以下建立 Gate v0.1 所稱的正式 Story Package。這只完成 editorial handoff；不等於 reviewer approval、harness execution、GATE 2 或 publication clearance。

### 3.1 Formal Story Package v0.5

<a id="formal-story-package-v05"></a>

```yaml
package_status: FORMAL_EDITORIAL_GATE_PASS
formal_package_created: true
package_id: gta-vi-extended-look-20260830
package_version: v0.5
gate_version: v0.1
selected_at: 2026-08-30T21:24:13.666+08:00
gate_evaluation_ref: exploration/2026-08-30-gta-gate-and-story-package.md#2-五項-gate-evaluation
story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05
interest_evidence_ref: exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md
visual_evidence_ref: exploration/2026-08-30-gta-visual-preflight.md#9-active-selected-set-final-disposition
reviewer_ready: true
reviewer_approval: PENDING_FOCUSED_RECHECK
fresh_run_authorized: false
topic: GTA VI An Extended Look
one_sentence_angle: 這支片不是替 Rockstar 重播宣傳，而是用 60 秒回答：8 月 27 日新增的近 27 分鐘官方展示，究竟讓觀眾多知道了什麼、又有哪些事情仍不能下結論。
why_now: 8 月 27 日首次公開，評估時 64.5333 小時，落在 rolling 168h 內。
audience_payoff: 不看完整 26:48，也能理解這次新增的是任務分工、活動與日常互動，並知道哪些問題仍須等未剪輯實測。
story_type: product_showcase
interest_basis: frozen v0.4 Reddit comment-count ratio 2.8598382749326148x plus two distinct editorial parent owners in the fixed 48h event window; convenience-set/post-age/live-entry limitations retained; not an outcome forecast
content_boundaries:
  - 不宣稱 interest proxy 等於台灣 IG 的觀看、留存或發布後成效。
  - 不把官方剪輯寫成發售版 gameplay、畫質、幀率、穩定度或 PC 版的獨立實測。
  - 不把 VTT 語意候選當 visual evidence。
  - viewer-facing copy 禁止放 codec、audio codec、cue 數、下載、rights workflow、candidate 數或 hash。
  - 不把 public direct URL 當 publication license。
  - 不以 convenience-set PASS 宣稱爆紅、正向情緒或預測播放數。
open_gate_unknowns: []
release_unknowns: [publication_rights]
execution_unknowns: [full_source_sha256, fresh_run_result, gate2_result]
publication_rights:
  intended_use: INTERNAL_GATE2_PREVIEW
  rights_status: UNKNOWN
  internal_preview_explicitly_prohibited: null
  evidence_refs: []
  scope: null
  approved_at: null
publication_hold: true
```

## 4. Formal production claim whitelist

規則：以下 wording 來自 E10 v0.4，visual-dependent claims 已由 E11 v0.4 active set 閉合，interest evidence 來自 E14。`eligible=true` 只表示在 reviewer 核准 fresh run 後可進 production；目前 `fresh_run_authorized:false`。第一方展示必須保留 `官方稱／官方展示` 或整片 footer `影片來源：Rockstar Games`；下表之外的性能、熱門結果、畫面細節、發售效果與權利推論全部禁止。

| Claim ID | Status | Eligible | 核准 viewer wording／邊界 | Evidence | Attribution／visual evidence |
|---|---|---:|---|---|---|
| `GTA-V01` | confirmed | true | `8/27，Rockstar 公開全新長篇展示` | E09／ES01 | Rockstar named |
| `GTA-V02` | confirmed | true | `而是接近二十七分鐘官方實機`、headline 的 `27 分鐘` | E02、E10 | official-source context required |
| `GTA-V03` | inferred | true | `這次不再只是三分鐘宣傳預告`；只表達相對既有短版 trailer 的 editorial contrast | E01、E10 | no performance inference |
| `GTA-V04` | confirmed first-party claim | true | `官方稱全片取自PS5遊戲內畫面`；不可改寫成獨立效能測試 | E01、E10 | footer＋Caption 04 attribution |
| `GTA-V05` | inferred | true | `值得檢查的不只表面畫質`、`而是任務終於可以連續看懂` | E03、E10、E11 | S1／S2 continuity evidence |
| `GTA-V06` | inferred | true | `官方展示任務角色分工`、`再把行動切到不同位置`；不指定兩名主角 identity 或同場會合 | E03、E10、E11 | S2-R1 PASS |
| `GTA-V07` | inferred | true | `追車與槍戰不是全部`、`水上與場館活動也入鏡` | E10、E11 | Caption 10 only uses active S3-R1；淘汰 primary frame 不支撐 viewer claim |
| `GTA-V08` | inferred | true | `角色日常也被留下`、`長片才看得出這些密度`；不再主張直播／社群 | E03、E10、E11 | S3-R1／S4-R1 PASS |
| `GTA-V09` | confirmed boundary | true | `但別忘了這仍是官方剪輯`、`它只證明官方選擇展示了什麼` | E01、E10 | explicit boundary |
| `GTA-V10` | confirmed evidence boundary | true | `不代表發售版本已經穩定`、`幀率、PC版本與自由度仍沒答案`、`所以重點不是現在就決定必買` | E01、E10 | no positive performance inference |
| `GTA-V11` | inferred editorial synthesis | true | `而是熱度背後終於有內容可檢查`；不得附量化熱門結論或拿舊 score 支持 | E10、E14 | v0.4 proxy PASS 只留 audit；viewer wording 不是 proxy outcome claim |
| `GTA-V12` | editorial evidence boundary | true | `正式上市前還要等未剪輯實測` | E10 | no release-date factual claim；不需日期來源 |
| `GTA-V13` | editorial prompt | true | `你最想先驗效能、任務還是世界？` | E10 | no factual claim |

Audit-only metadata 明確排除於 viewer copy：codec、audio codec、VTT cue／cue 數、下載方式、candidate window 數、hash、rights workflow。這些仍可留在第 1、2.6、8、9、10 節供追溯。

## 5. 三行固定 headline（formal package）

採 E10 原始價值 framing：

| Slot | Text | Claim mapping | Fact review |
|---|---|---|---|
| `headline-01` | `GTA VI 這次` | `GTA-V01` | `PASS` |
| `headline-02` | `給了 {{num}}27 分鐘{{/num}}實機` | `GTA-V02`、`GTA-V04` | `PASS` |
| `headline-03` | `但證明了什麼？` | `GTA-V09`、`GTA-V10` | `PASS` |

必要 context attribution：整片 footer 必須顯示 `影片來源：Rockstar Games`，Caption 04 必須明示 `官方稱`。第二行不是獨立效能測試。像素寬度與恰為三行仍須未來 composition snapshot 驗證；formal package 只核准文字，尚不宣稱 production rendering 成功。

## 6. 20 段 viewer-facing 中文字幕（formal package）

- 每段 `3 s`，總長 `60 s`。
- 去空白字元數：`247`；密度：`247 ÷ 60 = 4.1167 字／秒`，落在 4–5 硬門檻；不需以技術 metadata 補字。
- **這些字幕是編輯摘要，不是英文對白的逐句翻譯。** 官方 zh-Hant VTT 只作語意／時間對位 audit，最終仍須由 visual preflight 支持 Caption 07–12。
- 文案沿用 E10 的「新增資訊 vs 尚未證明」價值取向；沒有 codec、audio codec、cue 數、下載、rights 或 candidate-window workflow。

| Caption | Lines | Claim mapping | Fact review |
|---:|---|---|---|
| 01 | `8/27，Rockstar`<br>`公開全新長篇展示` | `GTA-V01` | `PASS` |
| 02 | `這次不再只是三分鐘宣傳預告` | `GTA-V03` | `PASS` |
| 03 | `而是接近二十七分鐘官方實機` | `GTA-V02` | `PASS` |
| 04 | `官方稱全片取自PS5遊戲內畫面` | `GTA-V04` | `PASS` |
| 05 | `值得檢查的不只表面畫質` | `GTA-V05` | `PASS` |
| 06 | `而是任務終於可以連續看懂` | `GTA-V05` | `PASS` |
| 07 | `官方展示任務角色分工` | `GTA-V06` | `PASS` |
| 08 | `再把行動切到不同位置` | `GTA-V06` | `PASS` |
| 09 | `追車與槍戰不是全部` | `GTA-V07` | `PASS` |
| 10 | `水上與場館活動也入鏡` | `GTA-V07` | `PASS` |
| 11 | `角色日常也被留下` | `GTA-V08` | `PASS` |
| 12 | `長片才看得出這些密度` | `GTA-V08` | `PASS` |
| 13 | `但別忘了這仍是官方剪輯` | `GTA-V09` | `PASS` |
| 14 | `它只證明官方選擇展示了什麼` | `GTA-V09` | `PASS` |
| 15 | `不代表發售版本已經穩定` | `GTA-V10` | `PASS` |
| 16 | `幀率、PC版本與自由度仍沒答案` | `GTA-V10` | `PASS` |
| 17 | `所以重點不是現在就決定必買` | `GTA-V10` | `PASS` |
| 18 | `而是熱度背後終於有內容可檢查` | `GTA-V11` | `PASS` |
| 19 | `正式上市前`<br>`還要等未剪輯實測` | `GTA-V12` | `PASS` |
| 20 | `你最想先驗效能、任務還是世界？` | `GTA-V13` | `PASS` |

## 7. IG Reels 內文（formal internal-preview copy）

> GTA VI 終於給了近 27 分鐘實機，但別只看畫面有多漂亮。
>
> 8/27，Rockstar 公開《An Extended Look》，官方表示全片取自 PS5 遊戲內畫面。這次真正新增的資訊，是你可以連續看到任務如何分工、活動與日常互動如何被留下。
>
> 但這仍是剪輯過的官方 showcase：它不等於發售版幀率、穩定度、PC 版或自由度已獲證明。正式上市前，下一個值得追的是未剪輯實機與技術測試。
>
> 你最想先確認哪一項：效能、任務節奏，還是世界細節？
>
> 影片來源：Rockstar Games  
> #GTAVI #RockstarGames #PS5 #科技新聞 #遊戲新知

狀態：`FORMAL_PACKAGE_COPY_REVIEW_PENDING`。Editorial Gate 已閉合，但 focused reviewer 尚未解除 fresh-run hold；公開前另受第 9 節 rights hold 約束。不得加入「爆紅」「玩家都在討論」、預測播放數或未證實 gameplay／效能效果。

## 8. 選材理由與 stable identity（AUDIT ONLY）

本節可保留 codec、音訊、VTT、候選窗口、取得與 hash coverage gap；不得搬入第 5～7 節 viewer copy。

```yaml
selection_status: EDITORIAL_GATE_PASS_FORMAL_PACKAGE
story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05
reviewer_ready: true
reviewer_approval: PENDING_FOCUSED_RECHECK
fresh_run_authorized: false
stable_footage_id: RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P
publisher: Rockstar Games
official_page: https://www.rockstargames.com/VI/an-extended-look
official_url: https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4
official_zh_hant_vtt: https://videos-rockstargames-com.akamaized.net/v4/rk721912/cap/zh-hant.vtt
expected_content_length: 1980545083
expected_source_sha256: null
technical_metadata:
  duration_seconds: 1608.066667
  video_codec: h264
  width: 1920
  height: 1080
  r_frame_rate: 30/1
  avg_frame_rate: 30/1
  audio_codec: aac
  audio_channels: 2
  audio_sample_rate_hz: 48000
visual_preview_status: PASS
visual_evidence_ref: exploration/2026-08-30-gta-visual-preflight.md#9-active-selected-set-final-disposition
active_selected_ranges:
  - {section: S1, start: 00:03:32.500, end: 00:03:44.500, evidence: primary-b01/S1-strip.jpg}
  - {section: S2, start: 00:24:15.000, end: 00:24:27.000, evidence: fallback-b02/S2-R1-strip.jpg}
  - {section: S3, start: 00:17:22.000, end: 00:17:34.000, evidence: fallback-b02/S3-R1-strip.jpg}
  - {section: S4, start: 00:06:24.000, end: 00:06:36.000, evidence: fallback-b02/S4-R1-strip.jpg}
  - {section: S5, start: 00:23:14.000, end: 00:23:26.000, evidence: primary-b01/S5-strip.jpg}
rights_status: UNKNOWN
publication_hold: true
harness_handoff:
  audience: 一般科技／遊戲觀眾
  duration_seconds: 60
  shot_seconds: 6
  caption_seconds: 3
  width: 1080
  height: 1920
  output_fps: 30
  target_lufs: -16
  required_credit_text: 影片來源：Rockstar Games
```

選材理由：

1. Rockstar 第一方 direct asset，stable path 含 `rk721912`，不依賴已知匿名下載失敗的 YouTube。
2. 單次 ffprobe 已重播取得 26:48、1080p30、AAC stereo 48 kHz；可回查完整 stdout 在 E08。
3. 第一方繁中 VTT 可直接支持故事線索與時間帶，不需翻譯外推。
4. E11 v0.4 完整保留 primary findings 並驗證三項 fallback；fixed active selected set 五項與十個相鄰 6 秒窗口全 PASS，copy mapping 使用 E10 v0.4。
5. canonical route 只接受上述 stable ID／official URL；若改 URL、語系、解析度或 local file，必須重新 GATE 1 授權。
6. `expected_source_sha256=null` 是明示 coverage gap：本輪禁止完整下載，不能捏造 hash；首次合法完整取得後須立即凍結 actual SHA-256。

## 9. Publication hold 與 internal／release 邊界

- `rights_status=UNKNOWN`
- `publication_hold=true`
- `internal_preview_explicitly_prohibited=null`（目前沒有直接證據證明禁止；也沒有直接證據確認允許）
- rights 不屬於五項 Gate，不能把其 UNKNOWN 改寫成任一 Gate FAIL。
- 五項 Gate 現已全 PASS；若 focused reviewer 後續核准 fresh run，可製作 internal GATE 2 preview，但 preview 仍維持 publication hold、不得公開。
- 使用者通過 GATE 2 後，另做 release check：只有 intended-use rights `CONFIRMED_FOR_INTENDED_USE`、第一方 policy／license evidence 非空、scope 明確且 `publication_hold=false` 才能公開。
- E07 的政策頁目前只是一條待判讀的一手來源；technical obtainability、HTTP ranges、VTT 或 internal render 都不是授權證據。

## 10. Non-Gate coverage gaps 與 reviewer hold

| Gap／hold | 所屬階段 | 下一個最小證據 | 未解時處置 |
|---|---|---|---|
| full-download SHA-256 | Harness execution | 首次另行授權的完整取得後 hash | 不捏造；綁定 URL／size，取得後凍結 |
| publication rights for release | Post-GATE 2 release | intended-use 第一方 policy／license 判讀與 scope | hold=true；禁止 release，但不改 Gate PASS |
| behavior comparability acceptance | Editorial review | focused reviewer 檢視 convenience set、unequal post ages 與 PC Gamer live-entry semantics | reviewer 可維持 hold；不得改用第三家或舊 score 補位 |
| reviewer approval | Editorial handoff | focused reviewer 重檢本 v0.5、E09 v0.3、E10 v0.4、E11 v0.4、E14 v0.1 與 production plan v0.5 | 未核准前不建立 fresh run |

目前五項 `freshness/why_now/audience_payoff/interest_signals/visual_source_fit` 全為 PASS，`overall_status=PASS`、`open_gate_unknowns=[]`、formal Story Package ref 非空、`reviewer_ready=true`。但既有 reviewer hold 尚未明確解除，所以 `fresh_run_authorized=false`；`publication_hold=true` 且 rights 仍 UNKNOWN。本 artifact 下一步只交 focused reviewer re-check，不授權建立 run_dir、完整下載、init、ffmpeg、snapshot 或 render。
