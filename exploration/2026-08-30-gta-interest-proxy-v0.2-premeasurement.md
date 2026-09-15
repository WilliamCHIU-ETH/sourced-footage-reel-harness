# GTA VI interest proxy v0.2 premeasurement lock

- artifact：`gta-interest-proxy-v0.2-premeasurement`
- artifact 版本：`v0.1`
- locked at：`2026-08-30T20:41:36+08:00`（`2026-08-30T12:41:36Z`）
- candidate：`GE-GTA-VI-20260830-R1`
- measurement status：`NOT_RUN`
- reviewer finding：`gta-preproduction-review v0.1 F-05`

## 1. Decision boundary

舊 `score` proxy 的 `3683／1639／1468／751` 沒有 frozen raw record，也沒有能證明 `1.5x` threshold 早於 score observation 的版本化 artifact。這份 lock **不回溯宣稱舊 proxy 合格**，也不修改舊 evidence。

本文件在讀取下列新 metric 前，先凍結一個不同的 audience-behavior proxy：Reddit `num_comments`。如果公開 endpoint 無法取得 raw record、候選未達門檻，或來源欄位無法驗證，本 proxy 為 `UNKNOWN`，不得用舊 score 補位。

## 2. Fixed benchmark set

這是固定的 convenience benchmark set，不宣稱是 r/Games 全母體。四筆 post ID 在 measurement 前凍結：

| Role | Post ID | URL | 固定理由 |
|---|---|---|---|
| candidate | `1w0c7q5` | https://www.reddit.com/r/Games/comments/1w0c7q5/grand_theft_auto_vi_an_extended_look/ | 單一遊戲、第一方 Extended Look 連結 |
| comparator 1 | `1tv49hl` | https://www.reddit.com/r/Games/comments/1tv49hl/marvels_wolverine_extended_gameplay_trailer_ps5/ | 單一遊戲、第一方 extended gameplay |
| comparator 2 | `1vz2o7p` | https://www.reddit.com/r/Games/comments/1vz2o7p/fable_official_quest_gameplay_gamescom_2026/ | 單一遊戲、第一方 gameplay |
| comparator 3 | `1w0szr9` | https://www.reddit.com/r/Games/comments/1w0szr9/fable_official_combat_gameplay_gamescom_2026/ | 單一遊戲、第一方 gameplay |

固定 inclusion criteria：

1. subreddit 為 `r/Games`。
2. 2026-05-29 至 measurement 時點的單一遊戲、第一方官方 gameplay／showcase link post。
3. 排除 leak、repost、multi-title megathread、非第一方素材。
4. comparator 必須不是 GTA VI candidate。

限制：這三筆 comparator 來自前一輪既有研究，因此可能有 selection bias；v0.2 只修復「metric 與 threshold 真正早於量測」和「raw record 可重播」，不把 convenience set 冒充 exhaustive query result。reviewer 可因這項限制維持 UNKNOWN。

## 3. Metric、window、region 與 threshold

```yaml
proxy_id: reddit-comments-v0.2
type: audience_behavior_discussion_volume
metric: num_comments
metric_field: Reddit listing children[0].data.num_comments
measurement_endpoint_template: https://www.reddit.com/comments/<post_id>.json?raw_json=1
measurement_window:
  start: original post created_utc
  end: one shared captured_at timestamp for all four sequential fetches
region: global Reddit r/Games; not Taiwan-specific
independence_key: reddit-r-games-comment-count
candidate_post_id: 1w0c7q5
comparator_post_ids: [1tv49hl, 1vz2o7p, 1w0szr9]
baseline_statistic: median(comparator num_comments)
pass_threshold: candidate num_comments >= 1.5 * comparator median
fail_threshold: null
unknown_if:
  - any raw JSON cannot be fetched or parsed
  - post id/subreddit/title/url do not match the fixed ledger
  - captured_at is not recorded
  - any raw record or hash is missing
  - candidate is below the PASS threshold
```

`num_comments` 尚未在本 artifact 量測；不得在此文件補值。四筆 fetch 必須在同一 sequential batch 完成，保存 raw response、HTTP metadata、normalized TSV 與 SHA-256；任何失敗全批為 UNKNOWN，不重抽其他 comparator。

## 4. Editorial breadth proxy lock

第二種 proxy 仍用既有「48 小時內至少兩個 ownership-independent outlet」規則，但 F-05 關閉前必須新增 raw page record 與 owner locator：

| Outlet | Parent owner expected | Article URL | Required owner locator |
|---|---|---|---|
| PC Gamer | Future | https://www.pcgamer.com/news/live/grand-theft-auto-6-reveal-live-coverage-breaking-down-the-netflix-extended-look-event/ | 頁面／官方 about/footer 可回查 owner `Future` |
| PCGamesN | Network N | https://www.pcgamesn.com/grand-theft-auto-iv/new-extended-look | 頁面可回查 `A Network N website` |

```yaml
proxy_id: editorial-owner-breadth-v0.2
type: independent_editorial_breadth
window: 2026-08-27T19:00:00Z/2026-08-29T19:00:00Z
region: global English-language gaming press
pass_threshold: independent parent owners >= 2
independence_keys: [future, network-n]
limitation: editorial attention is not audience outcome
```

## 5. Stop condition

只有下列全部成立，才可把 `interest_signals` 重新評為 PASS：

1. v0.2 `num_comments` raw records 與 hashes 完整，且候選達預先凍結的 `1.5x` threshold。
2. 兩個 article raw records、publish window 與 parent-owner locators 完整，且 parent owners 確實不同。
3. Gate artifact 改用 v0.2 `proxy_records[]`，完整填入 value、baseline、window、region、source、independence key、limitation。
4. reviewer 聚焦複審接受 convenience-set selection-bias 限制。

任一不成立：`interest_signals=UNKNOWN`、`overall_status=UNKNOWN`、`story_package_ref=null`，本輪停止，不開 fresh run。
