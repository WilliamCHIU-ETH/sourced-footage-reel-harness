# GTA VI interest proxy v0.4 DOM-HTML premeasurement lock

- artifact：`gta-interest-proxy-v0.4-dom-html-premeasurement`
- artifact 版本：`v0.1`
- locked at：`2026-08-30T20:51:45+08:00`（`2026-08-30T12:51:45Z`）
- measurement status：`NOT_RUN`
- unchanged metric／pages／threshold：承接 v0.3；沒有任何觀測值用來改規則

## 1. Predecessor failure boundary

v0.3 Ego round 在第一頁 `Page.captureScreenshot` timeout，process exit `1`；沒有 comment count、normalized record 或 screenshot 被輸出／持久化。因此 v0.3 全批為 UNKNOWN，不能作 Gate 證據。

v0.4 只更換 evidence capture format：不再呼叫 screenshot API，改凍結 target post root 的 raw opening-tag HTML（`cloneNode(false).outerHTML`）、normalized JSON 與 page identity。Metric、四個 post IDs、measurement order、median baseline、`1.5x` threshold、selection-bias limitation 全部不變。

## 2. Fixed contract

```yaml
proxy_id: reddit-dom-comments-v0.4
metric: target shreddit-post comment-count integer
measurement_order: [1w0c7q5, 1tv49hl, 1vz2o7p, 1w0szr9]
pages:
  1w0c7q5: https://www.reddit.com/r/Games/comments/1w0c7q5/grand_theft_auto_vi_an_extended_look/
  1tv49hl: https://www.reddit.com/r/Games/comments/1tv49hl/marvels_wolverine_extended_gameplay_trailer_ps5/
  1vz2o7p: https://www.reddit.com/r/Games/comments/1vz2o7p/fable_official_quest_gameplay_gamescom_2026/
  1w0szr9: https://www.reddit.com/r/Games/comments/1w0szr9/fable_official_combat_gameplay_gamescom_2026/
baseline: median(comparator comment-count)
pass_threshold: candidate >= 1.5 * baseline
region: global Reddit r/Games; not Taiwan-specific
independence_key: reddit-r-games-comment-count
required_per_page:
  - requested_url
  - resolved_url
  - target post id
  - subreddit
  - title
  - comment-count
  - extraction path
  - raw target root opening-tag HTML
  - captured_at
  - SHA-256 of raw HTML and normalized JSON
unknown_if:
  - any target root or identity field is missing/ambiguous
  - comment-count is absent/non-integer
  - any of four records or hashes is missing
  - browser round exits nonzero
```

原始 HTML 可以含頁面當時的其他 target-root attributes，但 v0.4 只使用 `comment-count`；不得回頭用 score。四頁完成後才寫共同 `captured_at` 與計算。

## 3. Final retry stop

這是同一 metric 的最後一次 evidence-capture attempt。若 v0.4 失敗或 candidate 未達門檻，`interest_signals=UNKNOWN`、`overall_status=UNKNOWN`、`story_package_ref=null`，不再建立 v0.5、不開 fresh run。

即使量測 PASS，reviewer 仍可因 convenience comparator set 的 selection bias 拒絕解除 hold。
