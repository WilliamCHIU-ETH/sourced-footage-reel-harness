# GTA VI five-window visual preflight

- artifact：`gta-visual-preflight`
- artifact 版本：`v0.4`
- 日期：`2026-08-30`
- candidate：`GE-GTA-VI-20260830-R1`
- stable footage ID：`RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P`
- retained batch：`primary-b01`，恰好 `5` 個 media items
- new batch：`fallback-b02`，恰好 `3` 個 media items
- execution mode：各 batch sequential；每項一次；無 retry；b02 後無第 4 項／再 fallback
- status：`ACTIVE_SELECTED_SET_ALL_PASS`
- final `visual_source_fit`：`PASS`
- canonical copy mapping：`gta-editorial-brief v0.4`
- overall Gate handoff：`PASS`（interest v0.4 behavior／owner proxies PASS；不改 active visual findings）
- formal Story Package：`exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05`
- reviewer handoff：`READY_FOR_FOCUSED_RECHECK`；既有 reviewer hold 尚未解除
- publication hold：`true`

## 1. Scope lock

第 1～6 節完整保留 `primary-b01` 的 command、逐格 findings 與當時 UNKNOWN disposition；第 7 節起追加 orchestrator 已決定的 `fallback-b02` 與最終 active-set 判定。

本批只讀既定 Rockstar official direct MP4：

- URL：`https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4`
- Referer：`https://www.rockstargames.com/VI/an-extended-look`

本批沒有換題、換來源、建立 run_dir、完整下載、init、fallback、composition 或 render。每項只以 input `-ss` 做 HTTP range seek，讀取一個 12 秒 primary window，取相對 `0／3／6／9 s` 四幀。

Evidence 寫入新的 immutable directory：

```text
exploration/evidence/gta-visual-preflight/primary-b01/
```

所有 ffmpeg command 使用 `-n`；既有輸出會直接失敗而不覆寫。

## 2. 中央 crop 計算

現行 `fixtures/composition-template.html` 的 content viewport 是 `1080×1017`；來源是 `1920×1080`，`object-fit: cover` 會先按高度縮放：

```text
scale = 1017 / 1080 = 0.9416667
visible source width = 1080 / 0.9416667
                     = 1080 × 1080 / 1017
                     = 1146.0177 px
integer crop = 1146 × 1080
x = (1920 - 1146) / 2 = 387
y = 0
```

每格縮為 `320×302`；`320 × 1080 / 1146 = 301.57`，取偶數 `302`。四格 strip 為 `1280×302`。這只模擬 template 的 stage viewport；沒有把 HyperFrames 中文 caption 真正畫上去，所以 collision 判定依 raw source text／UI 是否落在 stage bottom caption zone 做保守評估。

## 3. Commands 與 exit status

### S1

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel error -threads 1 -rw_timeout 20000000 -headers $'Referer: https://www.rockstargames.com/VI/an-extended-look\r\n' -ss 00:03:32.500 -i 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4' -t 12 -an -vf "fps=1/3:start_time=0,crop=1146:1080:(iw-1146)/2:0,scale=320:302:flags=lanczos,tile=4x1:nb_frames=4:padding=0:margin=0" -frames:v 1 -q:v 2 -n 'exploration/evidence/gta-visual-preflight/primary-b01/S1-strip.jpg'
```

### S2

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel error -threads 1 -rw_timeout 20000000 -headers $'Referer: https://www.rockstargames.com/VI/an-extended-look\r\n' -ss 00:13:41.000 -i 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4' -t 12 -an -vf "fps=1/3:start_time=0,crop=1146:1080:(iw-1146)/2:0,scale=320:302:flags=lanczos,tile=4x1:nb_frames=4:padding=0:margin=0" -frames:v 1 -q:v 2 -n 'exploration/evidence/gta-visual-preflight/primary-b01/S2-strip.jpg'
```

### S3

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel error -threads 1 -rw_timeout 20000000 -headers $'Referer: https://www.rockstargames.com/VI/an-extended-look\r\n' -ss 00:17:19.000 -i 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4' -t 12 -an -vf "fps=1/3:start_time=0,crop=1146:1080:(iw-1146)/2:0,scale=320:302:flags=lanczos,tile=4x1:nb_frames=4:padding=0:margin=0" -frames:v 1 -q:v 2 -n 'exploration/evidence/gta-visual-preflight/primary-b01/S3-strip.jpg'
```

### S4

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel error -threads 1 -rw_timeout 20000000 -headers $'Referer: https://www.rockstargames.com/VI/an-extended-look\r\n' -ss 00:18:19.000 -i 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4' -t 12 -an -vf "fps=1/3:start_time=0,crop=1146:1080:(iw-1146)/2:0,scale=320:302:flags=lanczos,tile=4x1:nb_frames=4:padding=0:margin=0" -frames:v 1 -q:v 2 -n 'exploration/evidence/gta-visual-preflight/primary-b01/S4-strip.jpg'
```

### S5

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel error -threads 1 -rw_timeout 20000000 -headers $'Referer: https://www.rockstargames.com/VI/an-extended-look\r\n' -ss 00:23:14.000 -i 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4' -t 12 -an -vf "fps=1/3:start_time=0,crop=1146:1080:(iw-1146)/2:0,scale=320:302:flags=lanczos,tile=4x1:nb_frames=4:padding=0:margin=0" -frames:v 1 -q:v 2 -n 'exploration/evidence/gta-visual-preflight/primary-b01/S5-strip.jpg'
```

| Item | Primary window | Exit | Strip | Bytes | Dimensions |
|---|---|---:|---|---:|---|
| `S1` | `00:03:32.500–00:03:44.500` | `0` | `exploration/evidence/gta-visual-preflight/primary-b01/S1-strip.jpg` | `61968` | `1280×302` |
| `S2` | `00:13:41.000–00:13:53.000` | `0` | `exploration/evidence/gta-visual-preflight/primary-b01/S2-strip.jpg` | `48138` | `1280×302` |
| `S3` | `00:17:19.000–00:17:31.000` | `0` | `exploration/evidence/gta-visual-preflight/primary-b01/S3-strip.jpg` | `100722` | `1280×302` |
| `S4` | `00:18:19.000–00:18:31.000` | `0` | `exploration/evidence/gta-visual-preflight/primary-b01/S4-strip.jpg` | `119425` | `1280×302` |
| `S5` | `00:23:14.000–00:23:26.000` | `0` | `exploration/evidence/gta-visual-preflight/primary-b01/S5-strip.jpg` | `39115` | `1280×302` |

Exit `0` 只證明 range extraction 成功，不等於 visual PASS。

## 4. Visual observations

四格均由左至右為該 primary window 的相對 `0／3／6／9 s`；絕對時間是 source start 加該 offset。

### S1 — transaction／mission hook

- primary：`00:03:32.500–00:03:44.500`
- intended final section：`0–12 s`
- planned caption／claim：Caption 01–04；`GTA-V01`～`GTA-V04`。日期、時長與 PS5 attribution 由來源證據支持，不宣稱由這四幀直接證明。

| Offset | Source time | Observation |
|---:|---:|---|
| `0 s` | `00:03:32.500` | 昏暗室內有兩名男性；刺青男性落在中央，左側人物被邊界裁掉一部分但不是唯一主體。 |
| `3 s` | `00:03:35.500` | 多人圍繞工作檯，人物與檯面集中在中央，空間與行動可讀。 |
| `6 s` | `00:03:38.500` | 刺青男性近景居中；背景人物不影響主體。 |
| `9 s` | `00:03:41.500` | 手機來電近景完整留在中央 crop，`Unknown` UI 可讀。 |

- 中央裁切：`PASS`；四格都有可辨主體。
- 文字／UI／字幕碰撞：沒有燒錄字幕；9 秒手機 UI 位於畫面中段，沒有落在 template bottom caption zone。
- 內容安全：`CAUTION_NOT_BLOCKING`；犯罪／疑似物質處理情境與赤膊人物，但四格沒有裸露、血腥或直接施暴。
- caption／claim mapping：`PASS` 作任務 hook；不把畫面冒充 freshness、duration 或 platform 規格證據。
- first adjacent 6 s `00:03:32.500–00:03:38.500`：`PASS`，交易／工作檯建立情境。
- second adjacent 6 s `00:03:38.500–00:03:44.500`：`PASS`，人物近景轉手機來電，仍是同一任務脈絡。
- **S1 result：`PASS`**。

### S2 — dual-protagonist／action division intent

- primary：`00:13:41.000–00:13:53.000`
- intended final section：`12–24 s`
- planned caption／claim：Caption 05–08；`GTA-V05`、`GTA-V06`。

| Offset | Source time | Observation |
|---:|---:|---|
| `0 s` | `00:13:41.000` | 車內男性近景居中，臉部完整。 |
| `3 s` | `00:13:44.000` | 後座另一名男性居中，車內空間清楚。 |
| `6 s` | `00:13:47.000` | 蒙面女性居中，視線／動作可讀。 |
| `9 s` | `00:13:50.000` | 蒙面男性佔前景右側，頭部貼近上緣；後座仍有另一人物。 |

- 中央裁切：`PASS_WITH_EDGE_CAUTION`；0／3／6 秒清楚，9 秒前景人物偏大但仍可辨。
- 文字／UI／字幕碰撞：沒有可見 source text、HUD 或燒錄字幕。
- 內容安全：`CAUTION_NOT_BLOCKING`；蒙面犯罪準備情境，沒有四格可見血腥或直接施暴。
- caption／claim mapping：`UNKNOWN`。四格能證明「多人共同準備行動」，但無法從畫面＋既有時間語意唯一確認這是「兩名主角分工」並在同一段「會合」；其中還出現多於兩人。不得把角色 identity 猜成 PASS。
- first adjacent 6 s `00:13:41.000–00:13:47.000`：`PASS` 作多人車內 setup。
- second adjacent 6 s `00:13:47.000–00:13:53.000`：`PASS` 作蒙面團隊 setup。
- **S2 result：`UNKNOWN`**（visual 可用，但 `GTA-V06` mapping 未閉合）。

### S3 — city activity／world detail intent

- primary：`00:17:19.000–00:17:31.000`
- intended final section：`24–36 s`
- planned caption／claim：Caption 09–12；`GTA-V07`、`GTA-V08`。

| Offset | Source time | Observation |
|---:|---:|---|
| `0 s` | `00:17:19.000` | 女性使用划船訓練器，人物中央；底部中央有 gameplay button prompts。 |
| `3 s` | `00:17:22.000` | 男性由碼頭入水，中央構圖。 |
| `6 s` | `00:17:25.000` | 水上摩托車朝城市水道前進，主體中央。 |
| `9 s` | `00:17:28.000` | 女性划 kayak，城市 skyline 可讀，主體中央。 |

- 中央裁切：人物／載具本身 `PASS`，但 0 秒 gameplay prompts 落在未來 caption zone。
- 文字／UI／字幕碰撞：`FAIL`。第一個相鄰 6 秒窗口已有 bottom-center prompts，會和 template 的 bottom Chinese caption 競爭；本批禁止另做遮罩或替代窗口。
- 內容安全：`PASS`；運動與水上活動，沒有可見暴力或成人內容。
- caption／claim mapping：`FAIL`。四格支持運動／水上活動等 world activity，但不直接支持 Caption 09 的追車／槍戰／潛入，也未顯示 Caption 11 的直播／社群；不能用「世界細節」概括詞洗掉 exact mapping 缺口。
- first adjacent 6 s `00:17:19.000–00:17:25.000`：`FAIL`，bottom UI collision 且訓練器→入水是來源 montage。
- second adjacent 6 s `00:17:25.000–00:17:31.000`：`PASS` 作水上／城市活動，但不足以獨自救回 Caption 09–12 mapping。
- **S3 result：`FAIL`**。

### S4 — livestream／social pursuit intent

- primary：`00:18:19.000–00:18:31.000`
- intended final section：`36–48 s`
- planned caption／claim：Caption 13–16；`GTA-V09`、`GTA-V10`；section visual intent 另要求直播／社群進入追逐情節。

| Offset | Source time | Observation |
|---:|---:|---|
| `0 s` | `00:18:19.000` | 街邊一男一女與手機互動，人物集中在中央。 |
| `3 s` | `00:18:22.000` | 同組人物近景，手機行為清楚。 |
| `6 s` | `00:18:25.000` | 車輛追逐後視角；左側直播／chat UI 進入 crop，警用燈光可見。 |
| `9 s` | `00:18:28.000` | 海灘 livestream 畫面，有垂直 chat 與上方文字 overlay。 |

- 中央裁切：0／3 秒人物 `PASS`；6／9 秒主畫面可讀，但原本靠左的 livestream UI 被中央 crop 截到邊界。
- 文字／UI／字幕碰撞：`FAIL`。直播 chat 的左側資訊不完整，且垂直 UI 延伸進 future caption-safe region；S4 的核心正是社群 UI，不能把被裁內容視為不重要。
- 內容安全：`PASS`；街景、追車與海灘，四格沒有可見血腥或明確裸露。
- caption／claim mapping：evidence-boundary Caption 13–16 不與畫面矛盾，且 6／9 秒確實支持「官方剪輯／直播社群」脈絡；但核心 UI crop/collision 使 section 無法 production PASS。
- first adjacent 6 s `00:18:19.000–00:18:25.000`：`PASS` 作手機／街邊社群 setup。
- second adjacent 6 s `00:18:25.000–00:18:31.000`：`FAIL`，直播 UI 被 crop 且有 caption-zone 競爭。
- **S4 result：`FAIL`**。

### S5 — closing payoff／testing boundary intent

- primary：`00:23:14.000–00:23:26.000`
- intended final section：`48–60 s`
- planned caption／claim：Caption 17–20；`GTA-V10`～`GTA-V13`。

| Offset | Source time | Observation |
|---:|---:|---|
| `0 s` | `00:23:14.000` | 室內武裝對峙，人物與槍械集中在中央。 |
| `3 s` | `00:23:17.000` | 藍光室內樓層有多名武裝人物，空間層次可讀。 |
| `6 s` | `00:23:20.000` | 兩名人物在藍光場地移動，前景人物居中。 |
| `9 s` | `00:23:23.000` | 煙霧中人物持槍／抬手，輪廓位於中央。 |

- 中央裁切：`PASS`；四格主體都在中央且無關鍵人物被切掉。
- 文字／UI／字幕碰撞：`PASS`；未見 source text、HUD 或燒錄字幕。
- 內容安全：`CAUTION_NOT_BLOCKING`；四格有明確槍械與非血腥武裝行動，未見血液、傷口或屍體。若未來平台／品牌另定禁槍政策，須重新判定；目前 contract 未把非血腥槍械自動列為 FAIL。
- caption／claim mapping：`PASS_WITH_BOUNDARY`。Caption 17–20 是「不要先下購買／效能結論」與 engagement prompt，不把武裝畫面當性能證據；動作畫面可作官方 showcase 的收束背景。
- first adjacent 6 s `00:23:14.000–00:23:20.000`：`PASS_WITH_CONTENT_CAUTION`。
- second adjacent 6 s `00:23:20.000–00:23:26.000`：`PASS_WITH_CONTENT_CAUTION`。
- **S5 result：`PASS`**（保留非血腥槍械 caution）。

## 5. Batch result 與 Gate disposition

| Item | Central crop | Text／UI／caption fit | Content safety | Caption／claim mapping | Adjacent 6 s pair | Item result |
|---|---|---|---|---|---|---|
| `S1` | PASS | PASS | CAUTION | PASS | PASS／PASS | `PASS` |
| `S2` | PASS_WITH_CAUTION | PASS | CAUTION | UNKNOWN | PASS／PASS | `UNKNOWN` |
| `S3` | visual subject PASS | FAIL | PASS | FAIL | FAIL／PASS | `FAIL` |
| `S4` | PARTIAL | FAIL | PASS | semantic PASS, layout FAIL | PASS／FAIL | `FAIL` |
| `S5` | PASS | PASS | CAUTION | PASS_WITH_BOUNDARY | PASS／PASS | `PASS` |

```yaml
historical_primary_stop:
  primary_batch_all_pass: false
  item_counts:
    PASS: 2
    FAIL: 2
    UNKNOWN: 1
  visual_source_fit_at_primary_stop:
    status: UNKNOWN
    reason_code: VS_PRIMARY_BATCH_NOT_ALL_PASS
    rationale: S2 mapping 未閉合；S3 caption mapping/UI collision FAIL；S4 livestream UI crop/collision FAIL。官方長片與當時未跑 fallback 仍可能提供替代窗口，因此尚不足以判整個 source FAIL。
  overall_status_at_primary_stop: UNKNOWN
  open_gate_unknowns_at_primary_stop: [visual_preview]
  story_package_ref_at_primary_stop: null
  publication_hold_at_primary_stop: true
  fallback_status_at_primary_stop: NOT_RUN_BY_SCOPE
  v0_3_promotion_at_primary_stop: NOT_PERFORMED
  next_action_at_primary_stop: ORCHESTRATOR_DECIDE_SECOND_BATCH
  reviewer_ready_at_primary_stop: false
```

以上欄位全部有 `_at_primary_stop`／`historical_` namespace，只是 immutable decision history，不是 current executable handoff。

依呼叫方規則，任一 primary 為 FAIL／UNKNOWN 就停在 artifact。本批不執行 E10 列出的 fallback，也不自行改 captions、換來源或建立第二批。`gta-gate-and-story-package` 保持 `v0.2`；不建立五項全 PASS 的 v0.3。

## 6. Producer self-check contract

必須同時成立才算本 artifact 可交付給 orchestrator：

1. command 恰 `5` 條，每條有 `OMP_THREAD_LIMIT=1 nice -n 19`、`ffmpeg`、`-threads 1`、official URL／Referer、input range seek、`-t 12`、`-n`。
2. 五個 exit 都是 `0`，五張 strip 都非空且為 `1280×302`。
3. windows 恰為 S1～S5 指定值，四個 nominal sample offsets 恰為 `0／3／6／9 s`。
4. evidence directory 是新建 `primary-b01`，沒有舊檔被覆寫。
5. 沒有 run_dir、完整 MP4、init、fallback 或 render。
6. 因 `2 PASS / 2 FAIL / 1 UNKNOWN`，Gate 保持 UNKNOWN、ref 保持 null、publication hold 保持 true，未升 v0.3。
7. 本 artifact 可交 orchestrator 決定是否公告第二批；**尚不可交 reviewer 當五項全 PASS package**。

以上是 `primary-b01` 當時的 producer self-check，保留作 immutable history；已由下列 `fallback-b02` 與 active-set final disposition supersede，但不刪除、不改寫。

## 7. Fallback-b02 commands 與 exit status

### S2-R1

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel error -threads 1 -rw_timeout 20000000 -headers $'Referer: https://www.rockstargames.com/VI/an-extended-look\r\n' -ss 00:24:15.000 -i 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4' -t 12 -an -vf "fps=1/3:start_time=0,crop=1146:1080:(iw-1146)/2:0,scale=320:302:flags=lanczos,tile=4x1:nb_frames=4:padding=0:margin=0" -frames:v 1 -q:v 2 -n 'exploration/evidence/gta-visual-preflight/fallback-b02/S2-R1-strip.jpg'
```

### S3-R1

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel error -threads 1 -rw_timeout 20000000 -headers $'Referer: https://www.rockstargames.com/VI/an-extended-look\r\n' -ss 00:17:22.000 -i 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4' -t 12 -an -vf "fps=1/3:start_time=0,crop=1146:1080:(iw-1146)/2:0,scale=320:302:flags=lanczos,tile=4x1:nb_frames=4:padding=0:margin=0" -frames:v 1 -q:v 2 -n 'exploration/evidence/gta-visual-preflight/fallback-b02/S3-R1-strip.jpg'
```

### S4-R1

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffmpeg -hide_banner -loglevel error -threads 1 -rw_timeout 20000000 -headers $'Referer: https://www.rockstargames.com/VI/an-extended-look\r\n' -ss 00:06:24.000 -i 'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4' -t 12 -an -vf "fps=1/3:start_time=0,crop=1146:1080:(iw-1146)/2:0,scale=320:302:flags=lanczos,tile=4x1:nb_frames=4:padding=0:margin=0" -frames:v 1 -q:v 2 -n 'exploration/evidence/gta-visual-preflight/fallback-b02/S4-R1-strip.jpg'
```

| Item | Fallback window | Exit | Strip | Bytes | Dimensions |
|---|---|---:|---|---:|---|
| `S2-R1` | `00:24:15.000–00:24:27.000` | `0` | `exploration/evidence/gta-visual-preflight/fallback-b02/S2-R1-strip.jpg` | `37886` | `1280×302` |
| `S3-R1` | `00:17:22.000–00:17:34.000` | `0` | `exploration/evidence/gta-visual-preflight/fallback-b02/S3-R1-strip.jpg` | `94893` | `1280×302` |
| `S4-R1` | `00:06:24.000–00:06:36.000` | `0` | `exploration/evidence/gta-visual-preflight/fallback-b02/S4-R1-strip.jpg` | `75258` | `1280×302` |

三項 command 都只使用既定 official URL／Referer、input range seek、`-t 12`、同一中央 crop、相對 `0／3／6／9 s`、`-n`；exit `0` 只證明 extraction 成功。

## 8. Fallback-b02 visual observations

### S2-R1 — 任務分工／空間切換

- fallback：`00:24:15.000–00:24:27.000`
- intended final section：`12–24 s`
- planned caption／claim：Caption 05–08；特別驗 `GTA-V06` 的 identity-neutral `官方展示任務角色分工`／`再把行動切到不同位置`。

| Offset | Source time | Observation |
|---:|---:|---|
| `0 s` | `00:24:15.000` | 女性角色在藍光走廊低身移動，主體位於中央。 |
| `3 s` | `00:24:18.000` | 同一角色由走廊朝亮處移動，門與空間方向清楚。 |
| `6 s` | `00:24:21.000` | 角色進入樓梯間，中央 silhouette 與上樓路徑可讀。 |
| `9 s` | `00:24:24.000` | 樓梯間發生近身衝突；倒地角色仍在中央，右前景人物只部分入鏡但不遮斷主要動作。 |

- 中央裁切：`PASS`；四格主要角色／路徑都在中央。
- 文字／UI／字幕碰撞：`PASS`；只有 6／9 秒上方 fire-exit signage，未落入 bottom caption zone，也不是 viewer claim 的必要文字。
- 內容安全：`CAUTION_NOT_BLOCKING`；9 秒有非血腥近身衝突，未見血液、傷口或裸露。
- caption／claim mapping：`PASS`。官方時間語意含「聲東擊西」與「我要上樓」，四格又直接顯示角色沿走廊轉入樓梯；可支持任務角色分工與空間切換，但不再指定兩名主角 identity／會合。
- first adjacent 6 s `00:24:15.000–00:24:21.000`：`PASS`，走廊移動與任務路徑清楚。
- second adjacent 6 s `00:24:21.000–00:24:27.000`：`PASS_WITH_CONTENT_CAUTION`，樓梯移動／近身衝突可讀且非血腥。
- **S2-R1 result：`PASS`**。

### S3-R1 — 世界活動

- fallback：`00:17:22.000–00:17:34.000`
- intended final section：`24–36 s`
- planned caption／claim：Caption 09–12；`GTA-V07`、`GTA-V08`。Caption 10 canonical wording 為 `水上與場館活動也入鏡`。

| Offset | Source time | Observation |
|---:|---:|---|
| `0 s` | `00:17:22.000` | 男性由碼頭入水，主體中央；已避開 primary 17:19 的 bottom button prompts。 |
| `3 s` | `00:17:25.000` | 水上摩托車朝城市水道前進，載具與尾流中央。 |
| `6 s` | `00:17:28.000` | 女性划 kayak，人物／船與 skyline 都可讀。 |
| `9 s` | `00:17:31.000` | 場館入口／活動海報門面，中央對稱；來源文字是環境 signage，不是必須讀完的資訊。 |

- 中央裁切：`PASS`；四格主體與環境焦點都在中央。
- 文字／UI／字幕碰撞：`PASS`。0／3／6 秒無 bottom HUD；9 秒 signage 位於門面中上部，底部 caption 可覆蓋非關鍵門面，不會截斷 viewer claim 所需 UI。
- 內容安全：`PASS`；水上／場館活動，未見暴力、裸露或危險細節。
- caption／claim mapping：`PASS_ACTIVE_ONLY`。active S3-R1 直接支持 Caption 10 `水上與場館活動也入鏡`：0／3／6 秒是入水、水上載具與 kayak，9 秒是場館門面。淘汰的 primary-b01 S3 訓練器 frame 只保留為 historical rejection evidence，不支撐任何 production viewer claim。Caption 09 的「追車與槍戰不是全部」由 active 非動作畫面與 active S5 槍械畫面形成可回查對比；Caption 11 的角色日常由 active S4-R1 支持，Caption 12 是跨 active set 的密度摘要。字幕是編輯摘要，不是每格逐句對白翻譯。
- first adjacent 6 s `00:17:22.000–00:17:28.000`：`PASS`，入水／水上摩托車均中央且無 prompt。
- second adjacent 6 s `00:17:28.000–00:17:34.000`：`PASS`，kayak 轉場館門面仍屬世界活動 montage，沒有 blocking UI。
- **S3-R1 result：`PASS`**。

### S4-R1 — 角色日常互動

- fallback：`00:06:24.000–00:06:36.000`
- intended final section：`36–48 s`
- planned caption／claim：Caption 13–16 的官方剪輯／未證明邊界；同時為 `GTA-V08` 的「角色日常也被留下」提供 active visual evidence。

| Offset | Source time | Observation |
|---:|---:|---|
| `0 s` | `00:06:24.000` | 臥室 overhead 畫面有兩名穿著完整的角色與生活物件，主體集中在中央。 |
| `3 s` | `00:06:27.000` | 男性與女性在粉色臥室對話，男性居中，女性前景輪廓仍可辨。 |
| `6 s` | `00:06:30.000` | 女性坐／靠在床邊互動，人物完整居中。 |
| `9 s` | `00:06:33.000` | 女性站立與男性近距離互動；女性中央，男性右前景雖部分裁切但不影響日常關係語意。 |

- 中央裁切：`PASS`；四格至少一個主要角色完整居中，房間 context 保留。
- 文字／UI／字幕碰撞：`PASS`；無 gameplay HUD、燒錄字幕或 bottom source text。
- 內容安全：`CAUTION_NOT_BLOCKING`；臥室／親密關係語境，但角色均有衣著，四格無裸露或明示性行為。
- caption／claim mapping：`PASS`。四格直接支持角色日常互動；用在 Caption 13–16 時不冒充發售版性能證據，反而配合「這仍是官方剪輯」的 evidence boundary。Caption 11／12 可把本段作跨 active-set supporting evidence，不要求逐句英文翻譯。
- first adjacent 6 s `00:06:24.000–00:06:30.000`：`PASS_WITH_CONTENT_CAUTION`，臥室 setup／對話連續且非裸露。
- second adjacent 6 s `00:06:30.000–00:06:36.000`：`PASS_WITH_CONTENT_CAUTION`，同一房間的互動持續。
- **S4-R1 result：`PASS`**。

## 9. Active selected set final disposition

Active selected set 依 orchestrator 固定，不再自行換點：

| Section | Active 12 s range | Evidence | Central／UI | Content | Caption／claim mapping | Adjacent 6 s pair | Result |
|---|---|---|---|---|---|---|---|
| `S1` | `00:03:32.500–00:03:44.500` | `primary-b01/S1-strip.jpg` | PASS | CAUTION_NOT_BLOCKING | PASS | PASS／PASS | `PASS` |
| `S2` | `00:24:15.000–00:24:27.000` | `fallback-b02/S2-R1-strip.jpg` | PASS | CAUTION_NOT_BLOCKING | PASS | PASS／PASS_WITH_CAUTION | `PASS` |
| `S3` | `00:17:22.000–00:17:34.000` | `fallback-b02/S3-R1-strip.jpg` | PASS | PASS | PASS_ACTIVE_ONLY | PASS／PASS | `PASS` |
| `S4` | `00:06:24.000–00:06:36.000` | `fallback-b02/S4-R1-strip.jpg` | PASS | CAUTION_NOT_BLOCKING | PASS | PASS_WITH_CAUTION／PASS_WITH_CAUTION | `PASS` |
| `S5` | `00:23:14.000–00:23:26.000` | `primary-b01/S5-strip.jpg` | PASS | CAUTION_NOT_BLOCKING | PASS_WITH_BOUNDARY | PASS／PASS | `PASS` |

十個 production shot starts（每個 12 秒 range 拆成相鄰兩個 6 秒）：

```text
S1-A 00:03:32.500
S1-B 00:03:38.500
S2-A 00:24:15.000
S2-B 00:24:21.000
S3-A 00:17:22.000
S3-B 00:17:28.000
S4-A 00:06:24.000
S4-B 00:06:30.000
S5-A 00:23:14.000
S5-B 00:23:20.000
```

```yaml
active_selected_set_all_pass: true
item_counts:
  PASS: 5
  FAIL: 0
  UNKNOWN: 0
visual_source_fit:
  status: PASS
  reason_code: VS_ACTIVE_SET_FIVE_PASS
  evidence_ref: exploration/2026-08-30-gta-visual-preflight.md#9-active-selected-set-final-disposition
  crop_contract: source 1920x1080 center-crop 1146x1080 -> stage-equivalent 1080x1017
  sample_offsets_seconds: [0, 3, 6, 9]
  adjacent_six_second_pairs_pass: 5
fallback_b02_media_items: 3
fallback_b02_exits: [0, 0, 0]
full_download: NOT_RUN
init: NOT_RUN
render: NOT_RUN
publication_hold: true
overall_gate_status: PASS
interest_evidence_ref: exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md
story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05
reviewer_ready: true
reviewer_approval: PENDING_FOCUSED_RECHECK
fresh_run_authorized: false
```

## 10. Final producer self-check contract

1. `primary-b01` 的五條 commands、五張 strips、逐格 observations、`2 PASS／2 FAIL／1 UNKNOWN` historical disposition 全保留。
2. `fallback-b02` 恰三條 commands；每條含 resource limits、official URL／Referer、range seek、`-t 12`、相對四幀、中央 crop 與 `-n`；沒有第 4 項或 retry。
3. 三個 fallback exits 都是 `0`；三張 strips 非空且 `1280×302`。
4. S2-R1／S3-R1／S4-R1 的中央裁切、text／UI、內容安全、caption／claim mapping、兩個相鄰 6 秒均逐項閉合。
5. active selected set 恰為呼叫方固定的五個 ranges，結果 `5 PASS／0 FAIL／0 UNKNOWN`。
6. 沒有 run_dir、完整 MP4、init 或 render；publication hold 仍為 true。
7. `visual_source_fit=PASS` 仍成立；copy mapping 與 v0.4 interest proxies 已閉合，overall Gate PASS、formal Story Package ref 非空、`reviewer_ready=true`；但 focused reviewer 尚未明確解除既有 hold，`fresh_run_authorized=false`，仍不得開 fresh run。
