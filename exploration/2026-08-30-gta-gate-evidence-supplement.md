# GTA VI Editorial Gate evidence supplement

- artifact：`gta-gate-evidence-supplement`
- artifact 版本：`v0.3`
- 日期：`2026-08-30`
- 適用 candidate：`GE-GTA-VI-20260830-R1`
- freshness checked at：`2026-08-30T19:32:00+08:00`（`2026-08-30T11:32:00Z`）
- interest integration decision at：`2026-08-30T21:24:13.666+08:00`（`2026-08-30T13:24:13.666Z`）
- 目的：補 `freshness` 並把 interest canonical evidence 更新為 v0.4 behavior＋editorial-owner measurement；不替代 visual preflight、不代表 reviewer 已核准 fresh run，也不解除 publication hold。

## 1. Freshness 補證

### 可回查證據

| Evidence ID | URL | 查核結果 |
|---|---|---|
| `ES01` | [Rockstar Newswire｜Grand Theft Auto VI: An Extended Look](https://www.rockstargames.com/newswire/article/9k2kaa1o3297k9/grand-theft-auto-vi-an-extended-look) | 第一方公告列出 Netflix 首播為 `2026-08-27 3:00 p.m. ET`，並列官方 YouTube／網站為同日 `9:00 p.m. ET`。本題材的 first-public anchor 採前者。 |
| `ES02` | [PC Gamer live coverage](https://www.pcgamer.com/news/live/grand-theft-auto-6-reveal-live-coverage-breaking-down-the-netflix-extended-look-event/) | 獨立 live page 的 event entry `2026-08-27T19:17:24.976Z` 與 ES01 first-public event 相符；它不是 Rockstar 一手來源。 |

### 計算與判定

```text
anchor_at_utc = 2026-08-27T19:00:00Z
evaluated_at_utc = 2026-08-30T11:32:00Z
age = 64h32m = 64.5333h
window = 168h
64.5333h <= 168h  => PASS
```

- `confirmed`：第一方公告提供可轉成 UTC 的日期、時間與時區。
- `confirmed`：本輪 rolling 168h 內，`freshness=PASS`。
- `inferred`：first-public anchor 選 Netflix 首播，而不是六小時後官方網站上線；這是按「觀眾第一次可公開取得」的 Gate 定義套用規則。
- `unknown`：Rockstar 頁面 CMS 的精確發稿時間；本次 freshness 不依賴它。

## 2. Interest signals v0.4 canonical evidence

Canonical measurement：`exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md v0.1`。

### 2.1 Superseded attempts 不補位

- legacy score proxy：`SUPERSEDED_NOT_RELIED_UPON`；缺 pre-observation baseline／frozen raw record，不能支持本次 PASS。
- v0.2 Reddit JSON：A01 curl `56`／HTTP `403` 後按 stop condition 結束；其 headers、commands、exit 與 null ledgers仍是 immutable failure evidence。
- v0.3 screenshot：第一頁 screenshot timeout、process exit `1`，沒有持久化 count／normalized record／screenshot；結果仍是 historical UNKNOWN。
- v0.4 只改 evidence capture format；metric、四 IDs、順序、median baseline、`1.5x` threshold 與 selection-bias limitation承接事前 lock，沒有用觀測值改規則。

### 2.2 Premeasurement locks

| Contract | Required／verified SHA-256 | Result |
|---|---|---|
| `gta-interest-proxy-v0.4-dom-html-premeasurement v0.1` | `ed15306ca5ddd45e75ee5c8b5b19acc5ba72e6315e01a052eac026cb48978001` | `PASS` |
| `gta-editorial-owner-v0.4-premeasurement v0.1` | `24d153d42c3796993ed3936235a0220d0871a6fe59b3183b9fe7e4bf2d3a20f2` | `PASS` |

### 2.3 Audience-behavior proxy — PASS

Evidence root：`exploration/evidence/gta-interest-v04-dom-html/`；shared `captured_at=2026-08-30T12:53:44.940Z`。

| Role | Post ID | Frozen `comment-count` | Identity／raw result |
|---|---|---:|---|
| candidate | `1w0c7q5` | `1061` | exact target root、ID／permalink／subreddit、raw HTML 與 normalized JSON PASS |
| comparator 1 | `1tv49hl` | `1001` | 同上 |
| comparator 2 | `1vz2o7p` | `371` | 同上 |
| comparator 3 | `1w0szr9` | `233` | 同上 |

```text
median([1001, 371, 233]) = 371
1061 / 371 = 2.8598382749326148
2.8598382749326148 >= 1.5  => PASS
```

Raw／normalized paths 與 9 個 SHA-256 逐筆列在 canonical measurement §2.1；exact replay 在該文件 §9。

**Selection-bias boundary**：這是 global `r/Games` convenience set，不是隨機母體或台灣 audience；post age 沒正規化，且兩筆較低 Fable comparators 顯著影響 median。它可依 frozen contract 機械判 PASS，但 reviewer 仍可拒絕其 comparability；不得稱為預測播放量或發布後 outcome。

### 2.4 Independent editorial-owner breadth — PASS

Evidence root：`exploration/evidence/gta-editorial-owner-v04-r02/`；raw `measured_at=2026-08-30T13:21:59.592Z`；later integration decision `2026-08-30T13:24:13.666Z`；fixed window `2026-08-27T19:00:00Z–2026-08-29T19:00:00Z`。

| Parent key | Outlet | Qualifying timestamp | Critical boundary | Owner locator |
|---|---|---|---|---|
| `future` | PC Gamer | JSON-LD live `BlogPosting.datePublished=2026-08-27T19:17:24.976Z` | article-level initial publish `17:30:05Z` 在窗外，沒有拿它通過；只依 lock 明文接受的 machine-readable live timestamp | raw footer：`Future Publishing Limited` |
| `network-n` | PCGamesN | `article:published_time=2026-08-27T19:35:04Z`，與 visible time／JSON-LD 一致 | 在固定 48h window 內 | raw footer：`Network N Media Ltd` |

```text
distinct verified parent keys = {future, network-n}
count = 2
2 >= 2  => PASS
```

Raw／normalized paths 與 5 個 SHA-256 逐筆列在 canonical measurement §2.2。若 reviewer 不接受 PC Gamer live-entry semantics，該 record 必須回到 UNKNOWN，不能新增第三家補位。

### 2.5 G4 synthesis

兩種 proxy 使用不同來源、metric 與 independence key，且 behavior proxy 恰一種：

```yaml
signal_phase: pre_publish_proxy
proxy_records:
  - type: reddit_comment_count_behavior
    value_or_observation: candidate 1061; comparator median 371; ratio 2.8598382749326148
    baseline: predeclared median of three fixed comparators
    window: cumulative counts at shared capture 2026-08-30T12:53:44.940Z
    region: global Reddit r/Games
    independence_key: reddit-r-games-comment-count
    limitation: convenience set; unequal post ages; not Taiwan-specific; not outcome
  - type: independent_editorial_owner_breadth
    value_or_observation: two distinct parent keys within fixed event window
    baseline: at least two independent parent owners
    window: 2026-08-27T19:00:00Z/2026-08-29T19:00:00Z
    region: global English-language gaming press
    independence_key: editorial-owner-breadth-v0.4
    limitation: PC Gamer qualifies by in-window live BlogPosting entry, not its earlier initial publish
behavior_proxy_count: 1
independent_proxy_count: 2
post_publish_outcome_ref: null
exception_code: null
interest_signals:
  status: PASS
  reason_code: IS_V04_COMMENTS_RATIO_AND_OWNER_BREADTH
```

## 3. Canonical Gate boundary

```yaml
candidate_id: GE-GTA-VI-20260830-R1
criteria:
  freshness: {status: PASS, reason_code: FR_FIRST_PUBLIC_64H32M}
  why_now: {status: PASS, reason_code: WN_NEW_OFFICIAL_EXTENDED_LOOK}
  audience_payoff: {status: PASS, reason_code: AP_LONG_FORM_OFFICIAL_SHOWCASE}
  interest_signals: {status: PASS, reason_code: IS_V04_COMMENTS_RATIO_AND_OWNER_BREADTH}
  visual_source_fit: {status: PASS, reason_code: VS_ACTIVE_SET_FIVE_PASS}
overall_status: PASS
open_gate_unknowns: []
interest_evidence_ref: exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md
visual_evidence_ref: exploration/2026-08-30-gta-visual-preflight.md#9-active-selected-set-final-disposition
story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05
reviewer_ready: true
reviewer_approval: PENDING_FOCUSED_RECHECK
fresh_run_authorized: false
rights_status: UNKNOWN
publication_hold: true
next_action: FOCUSED_REVIEW_FOR_FRESH_RUN
```

Current canonical refs：`gta-editorial-brief v0.4`、`gta-visual-preflight v0.4`、`gta-gate-and-story-package v0.5`、`gta-production-plan v0.5`。五項 Gate 已閉合，formal Story Package 已建立；但 `reviewer_ready:true` 不是 reviewer approval，既有 `REVIEW_HOLD` 明確解除前仍不得建立 fresh run。

Rights 仍是 non-Gate unknown：只允許未來 reviewer 核准後製作 internal GATE 2 preview；公開／商用 release 仍因 `rights_status:UNKNOWN` 與 `publication_hold:true` 被阻擋。
