# GTA VI interest proxy v0.3 DOM premeasurement lock

- artifact：`gta-interest-proxy-v0.3-dom-premeasurement`
- artifact 版本：`v0.1`
- locked at：`2026-08-30T20:48:02+08:00`（`2026-08-30T12:48:02Z`）
- candidate：`GE-GTA-VI-20260830-R1`
- measurement status：`NOT_RUN`
- predecessor：`gta-interest-proxy-v0.2-premeasurement v0.1`
- predecessor outcome：Batch A item 1 public JSON fetch failed；不得 retry／改 endpoint 後冒充 v0.2

## 1. 新 metric 與不可回溯邊界

本文件在任何 DOM comment-count 讀取前凍結。v0.3 改用 Reddit 公開 post page DOM 中屬於目標 post 的 comment count；不讀舊 score，不以 page line count、目前可見 comment 篇數或人工估算替代。

固定 extraction priority：

1. 目標 post root 的機器欄位／attribute（例如 `comment-count`），且同一 root 可同時驗證 post ID、subreddit 與 permalink。
2. 同頁 JSON-LD／hydration data 的 `commentCount`，且 record 可唯一綁回固定 post ID。
3. 兩者都不存在、格式不一致或需登入才可見：該筆 UNKNOWN，全批 UNKNOWN。

禁止使用 snapshot 中其他推薦貼文的 `comments` 文字或以實際抓到的 comment nodes 數量當總數。

## 2. Fixed pages and metric

| Role | Post ID | Public page |
|---|---|---|
| candidate | `1w0c7q5` | https://www.reddit.com/r/Games/comments/1w0c7q5/grand_theft_auto_vi_an_extended_look/ |
| comparator 1 | `1tv49hl` | https://www.reddit.com/r/Games/comments/1tv49hl/marvels_wolverine_extended_gameplay_trailer_ps5/ |
| comparator 2 | `1vz2o7p` | https://www.reddit.com/r/Games/comments/1vz2o7p/fable_official_quest_gameplay_gamescom_2026/ |
| comparator 3 | `1w0szr9` | https://www.reddit.com/r/Games/comments/1w0szr9/fable_official_combat_gameplay_gamescom_2026/ |

```yaml
proxy_id: reddit-dom-comments-v0.3
type: audience_behavior_discussion_volume
metric: target_post_comment_count
pages: fixed 4 URLs above
browser: ego-browser isolated task space; public logged-out-compatible state
measurement_order: [1w0c7q5, 1tv49hl, 1vz2o7p, 1w0szr9]
measurement_window:
  start: each post publication
  end: one captured_at recorded after the fourth page
region: global Reddit r/Games; not Taiwan-specific
independence_key: reddit-r-games-comment-count
baseline: median of the three comparator comment counts
pass_threshold: candidate >= 1.5 * comparator median
unknown_if:
  - any target post identity cannot be verified in DOM/data
  - any comment count is absent, non-integer, or ambiguous
  - all four are not captured in one browser task-space round
  - screenshot and normalized record are not persisted
```

Comparator selection仍沿用既有 convenience set，可能有 selection bias，並非 exhaustive r/Games mother population。此 limitation 不得刪除；reviewer 可據此不接受 PASS。

## 3. Evidence contract

同一 Ego task space 依固定順序開四頁，每頁必須保存：

- target URL、resolved URL、post ID、title、subreddit、comment count、extraction path、captured_at；
- 一張可回查 screenshot；
- 一份只含 target post identity／metric 的 normalized JSON；
- screenshot／JSON SHA-256。

任何頁面出現 login wall、captcha、user takeover 或 ambiguity，依 ego-browser 規則停止；不登入、不註冊、不付款、不改用其他網站或舊 score。

## 4. Stop condition

只有四筆完整、candidate ratio 達 `1.5x`，且 reviewer 接受 convenience-set limitation，才可用 v0.3 取代失敗的 v0.2 behavior proxy。否則：`interest_signals=UNKNOWN`、`overall_status=UNKNOWN`、`story_package_ref=null`，不開 fresh run。
